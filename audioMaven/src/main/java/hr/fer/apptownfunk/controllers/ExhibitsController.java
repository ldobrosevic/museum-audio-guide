package hr.fer.apptownfunk.controllers;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import hr.fer.apptownfunk.models.Exhibits;
import hr.fer.apptownfunk.models.UserRoles;
import hr.fer.apptownfunk.models.Users;
import hr.fer.apptownfunk.models.filebucket.FileBucket;
import hr.fer.apptownfunk.models.filebucket.MultiFileBucket;
import hr.fer.apptownfunk.services.ExhibitDetailsService;
import hr.fer.apptownfunk.services.ExhibitsService;
import hr.fer.apptownfunk.util.ViewCounter;

@Controller
public class ExhibitsController {
	Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap("cloud_name", "depmyfwu5", "api_key", "149973747796576",
			"api_secret", "3BVnRJK1tQsoi4EYOeQQgCJ0rcM"));

	@Autowired
	private ExhibitsService exhibitsService;

	@Autowired
	private ExhibitDetailsService exhibitsDetailsService;

	@Autowired
	private MultiFileBucket detailsModel;

	@GetMapping("/exhibitUpload")
	public String showExhibitUploadPage(ModelMap model, HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		if(user == null ||
		   (user != null && !user.getRole().equals(UserRoles.ADMIN.getRole()))) {
			return "redirect:/";
		}
		
		model.addAttribute("fileBucket", detailsModel);
		return "exhibitUpload";
	}

	@GetMapping("/exhibitUpdate/{id}")
	public String showExhibitUpdatePage(@PathVariable Integer id, ModelMap model, HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		if(user == null ||
		   (user != null && !user.getRole().equals(UserRoles.ADMIN.getRole()))) {
			return "redirect:/";
		}

		model.addAttribute("fileBucket", detailsModel);
		model.addAttribute("exhibit", exhibitsService.getExhibitById(id));
		return "exhibitUpdate";
	}

	@SuppressWarnings("unchecked")
	@PostMapping(value = "/exhibits", headers = ("content-type=multipart/*"), consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public String addNewExhibit(ModelMap map, @RequestParam String name, @RequestParam String description,
			MultiFileBucket files) {
		List<FileBucket> filesList = files.getFiles();
		Map<String, Object> image = null;
		Map<String, Object> audio = null;

		// Spremanje na Cloudinary
		try {
			image = cloudinary.uploader().upload(convert(filesList.get(0).getFile()),
					ObjectUtils.asMap("public_id", filesList.get(0).getFile().getOriginalFilename()));
			audio = cloudinary.uploader().upload(convert(filesList.get(1).getFile()), ObjectUtils.asMap("public_id",
					filesList.get(1).getFile().getOriginalFilename(), "resource_type", "raw"));
		} catch (IOException e) {
			System.out.println(e.getMessage());
		}

		// Spremanje u bazu
		Exhibits exhibit = new Exhibits(0, description, name, audio.get("url").toString(), image.get("url").toString());
		exhibitsService.addExhibit(exhibit);

		return getAllExhibits(map);
	}

	public File convert(MultipartFile file) throws IOException {
		File convFile = new File(file.getOriginalFilename());
		convFile.createNewFile();
		FileOutputStream fos = new FileOutputStream(convFile);
		fos.write(file.getBytes());
		fos.close();
		return convFile;
	}

	@SuppressWarnings("unchecked")
	@PostMapping("/exhibitUpdate/{id}")
	public String updateExhibit(ModelMap map, @RequestParam String name, @RequestParam String description,
			MultiFileBucket files, @PathVariable Integer id) {
		Exhibits exhibit = exhibitsService.getExhibitById(id);

		exhibit.setName(name);
		exhibit.setDescription(description);
		List<FileBucket> filesList = files.getFiles();

		if (!filesList.get(0).getFile().isEmpty()) {
			Map<String, Object> image = null;

			// Spremanje na Cloudinary
			try {
				image = cloudinary.uploader().upload(convert(filesList.get(0).getFile()),
						ObjectUtils.asMap("public_id", filesList.get(0).getFile().getOriginalFilename()));
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}

			exhibit.setImage_path(image.get("url").toString());
		}

		if (!filesList.get(1).getFile().isEmpty()) {
			Map<String, Object> audio = null;

			// Spremanje na Cloudinary
			try {
				audio = cloudinary.uploader().upload(convert(filesList.get(1).getFile()), ObjectUtils.asMap("public_id",
						filesList.get(1).getFile().getOriginalFilename(), "resource_type", "raw"));
			} catch (IOException e) {
				System.out.println(e.getMessage());
			}

			exhibit.setAudio_path(audio.get("url").toString());
		}

		exhibitsService.updateExhibit(exhibit);
		return "redirect:/exhibits";
	}

	@PutMapping("/exhibits/{id}")
	public void updateExhibit(@RequestBody Exhibits exhibitObjects) {
		exhibitsService.updateExhibit(exhibitObjects);
	}

	@DeleteMapping("/exhibits/{id}")
	public void deleteExhibit(ModelMap map, @PathVariable Integer id) {
		// ObriÅ¡i exhibit
		exhibitsService.deleteExhibit(id);

		// ObriÅ¡i sve detalje vezane uz exhibit
		exhibitsDetailsService.getAllExhibitDetailsExhibitId(id).forEach(detail -> {
			exhibitsDetailsService.deleteExhibitDetail(id);
		});
	}

	@GetMapping("/exhibits")
	public String getAllExhibits(ModelMap model) {
		model.addAttribute("exhibits", exhibitsService.getAllExhibits());
		ViewCounter.addAllExhibits();
		return "allExhibits";
	}

	// @GetMapping("/exhibits/{id}")
	// public Exhibits getExhibitById(@PathVariable int id) {
	// return exhibitsService.getExhibitById(id);
	// }

	@GetMapping("/exhibits/{id}")
	public ModelAndView getExhibitById(ModelMap model, @PathVariable Integer id) {
		ModelAndView modelAndview = new ModelAndView("exhibit");
		model.addAttribute("exhibitDetails", exhibitsDetailsService.getAllExhibitDetailsExhibitId(id));
		model.addAttribute("exhibit", exhibitsService.getExhibitById(id));

		return modelAndview;
	}

	@GetMapping("/addExhibits/{id}")
	public String showAddExhibits(ModelMap model, HttpSession session, @PathVariable Integer id) {
		Users user = (Users) session.getAttribute("user");
		if(user == null ||
		   (user != null && !user.getRole().equals(UserRoles.ADMIN.getRole()))) {
			return "redirect:/";
		}

		List<Exhibits> exhibits = exhibitsService.getAllExhibits();

		exhibits.removeAll(exhibitsService.getExhibitsByExhibitionId(id));
		model.addAttribute("exhibits", exhibits);

		return "addExhibits";
	}

	@PostMapping("/addExhibits/{id}")
	public String addExhibits(ModelMap model, @PathVariable Integer id, @RequestParam("selected") int[] exhibitId) {
		exhibitsService.addExhibitsToExhibition(id, exhibitId);
		return "redirect:/exhibitions/" + id;
	}

	@GetMapping("/removeExhibits/{id}")
	public String showRemoveExhibits(ModelMap model, HttpSession session, @PathVariable Integer id) {
		Users user = (Users) session.getAttribute("user");
		if(user == null ||
		   (user != null && !user.getRole().equals(UserRoles.ADMIN.getRole()))) {
			return "redirect:/";
		}
		
		model.addAttribute("exhibits", exhibitsService.getExhibitsByExhibitionId(id));
		model.addAttribute("exhibitionId", id);

		return "removeExhibits";
	}

	@PostMapping("/removeExhibits/{id}")
	public String removeExhibits(ModelMap model, @PathVariable Integer id,
			@RequestParam("selected") int[] exhibitId) {
		exhibitsService.removeExhibitsFromExhibition(id, exhibitId);
		return "redirect:/exhibitions/" + id;
	}

}
