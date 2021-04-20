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
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.cloudinary.Cloudinary;
import com.cloudinary.utils.ObjectUtils;

import hr.fer.apptownfunk.models.ExhibitDetails;
import hr.fer.apptownfunk.models.UserRoles;
import hr.fer.apptownfunk.models.Users;
import hr.fer.apptownfunk.models.filebucket.FileBucket;
import hr.fer.apptownfunk.models.filebucket.MultiFileBucket;
import hr.fer.apptownfunk.services.ExhibitDetailsService;

@Controller
public class ExhibitDetailsController {
	Cloudinary cloudinary = new Cloudinary(ObjectUtils.asMap("cloud_name", "depmyfwu5", "api_key", "149973747796576",
			"api_secret", "3BVnRJK1tQsoi4EYOeQQgCJ0rcM"));

	@Autowired
	private ExhibitDetailsService exhibitDetailsService;

	@Autowired
	private MultiFileBucket detailsModel;

	@GetMapping("/detailsUpload/{id}")
	public String showDetailsUploadPage(@PathVariable Integer id, ModelMap model, HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		if(user == null ||
		   (user != null && !user.getRole().equals(UserRoles.ADMIN.getRole()))) {
			return "redirect:/";
		}

		model.addAttribute("fileBucket", detailsModel);
		model.addAttribute("exhibitId", id);
		return "detailsUpload";
	}

	@GetMapping("/detailsUpdate/{id}")
	public String showDetailsUpdatePage(@PathVariable Integer id, ModelMap model, HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		if(user == null ||
		   (user != null && !user.getRole().equals(UserRoles.ADMIN.getRole()))) {
			return "redirect:/";
		}

		model.addAttribute("fileBucket", detailsModel);
		model.addAttribute("detail", exhibitDetailsService.getExhibitDetail(id));
		return "detailsUpdate";
	}

	@SuppressWarnings("unchecked")
	@PostMapping(value = "/exhibitDetails/{id}", headers = ("content-type=multipart/*"), consumes = MediaType.APPLICATION_FORM_URLENCODED_VALUE)
	public String addNewExhibitDetail(ModelMap map, @RequestParam String name, @RequestParam String description,
			MultiFileBucket files, @PathVariable Integer id) {
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
		ExhibitDetails exhibitDetail = new ExhibitDetails(0, id, description, audio.get("url").toString(),
				image.get("url").toString(), name);
		exhibitDetailsService.addExhibitDetail(exhibitDetail);

		return "redirect:/exhibits/" + id;
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
	@PostMapping("/detailsUpdate/{id}")
	public String updateExhibitDetail(ModelMap map, @RequestParam String name, @RequestParam String description,
			MultiFileBucket files, @PathVariable Integer id) {
		ExhibitDetails exhibitDetail = exhibitDetailsService.getExhibitDetail(id);

		exhibitDetail.setName(name);
		exhibitDetail.setDescription(description);
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

			exhibitDetail.setImage_path(image.get("url").toString());
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

			exhibitDetail.setAudio_path(audio.get("url").toString());
		}

		exhibitDetailsService.updateExhibitDetail(exhibitDetail);
		return "redirect:/exhibits/" + id;
	}

	@DeleteMapping("/exhibitDetails/{id}")
	public void deleteExhibitDetail(ModelMap map, @PathVariable Integer id) {
		exhibitDetailsService.deleteExhibitDetail(id);
	}

	@GetMapping("/exhibitDetails")
	public String getAllExhibitDetails(ModelMap model) {
		model.addAttribute("details", exhibitDetailsService.getAllExhibitDetails());
		return "allExhibitDetails";
	}


	@GetMapping("/exhibitDetails/{id}")
	public ModelAndView getExhibitDetailById(ModelMap model, @PathVariable Integer id) {
		ModelAndView modelAndview = new ModelAndView("exhibitDetail");
		model.addAttribute("detail", exhibitDetailsService.getExhibitDetail(id));
		return modelAndview;
	}
}
