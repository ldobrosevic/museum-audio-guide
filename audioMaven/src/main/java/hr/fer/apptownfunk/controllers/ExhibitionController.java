package hr.fer.apptownfunk.controllers;

import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.http.HttpSession;

import java.sql.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hr.fer.apptownfunk.models.Exhibitions;
import hr.fer.apptownfunk.models.TypeOfExhibition;
import hr.fer.apptownfunk.models.UserRoles;
import hr.fer.apptownfunk.models.Users;
import hr.fer.apptownfunk.services.ExhibitionService;
import hr.fer.apptownfunk.services.ExhibitsService;
import hr.fer.apptownfunk.util.ViewCounter;

@Controller
public class ExhibitionController {

	@Autowired
	private ExhibitionService exhibitionService;

	@Autowired
	private ExhibitsService exhibitsService;

	@GetMapping("/exhibitionUpload")
	public String showExhibitionUploadPage(ModelMap model, HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		if(user == null ||
		   (user != null && !user.getRole().equals(UserRoles.ADMIN.getRole()))) {
			return "redirect:/";
		}

		model.addAttribute("enums", TypeOfExhibition.values());
		return "exhibitionUpload";
	}

	@GetMapping("/exhibitionUpdate/{id}")
	public String showExhibitionUpdatePage(@PathVariable Integer id, ModelMap model, HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		if(user == null ||
		   (user != null && !user.getRole().equals(UserRoles.ADMIN.getRole()))) {
			return "redirect:/";
		}

		Exhibitions exhibition = exhibitionService.getExhibition(id);

		String dateBegin = new SimpleDateFormat("yyyy-MM-dd").format(exhibition.getDateBegin());
		String dateEnd = new SimpleDateFormat("yyyy-MM-dd").format(exhibition.getDateEnd());
		model.addAttribute("begin", dateBegin);
		model.addAttribute("end", dateEnd);

		model.addAttribute("exhibition", exhibition);
		model.addAttribute("enums", TypeOfExhibition.values());
		return "exhibitionUpdate";
	}

	@PostMapping("/exhibitions")
	public String addNewExhibition(ModelMap map, @RequestParam String name, @RequestParam String description,
			@RequestParam String begin, @RequestParam String end, @RequestParam String chosen) {
		Date dateBegin = null;
		Date dateEnd = null;

		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			dateBegin = new Date(sdf.parse(begin).getTime());
			dateEnd = new Date(sdf.parse(end).getTime());
		} catch (ParseException e) {
		}

		Exhibitions exhibition = new Exhibitions(0, name, description, dateBegin, dateEnd,
				TypeOfExhibition.valueOf(chosen));
		exhibitionService.addExhibition(exhibition);
		return getAllExhibitions(map);

	}

	@PostMapping("/exhibitionUpdate/{id}")
	public String updateExhibition(@PathVariable Integer id, ModelMap model, @RequestParam String name,
			@RequestParam String description, @RequestParam String begin, @RequestParam String end,
			@RequestParam String chosen) {
		Exhibitions exhibition = exhibitionService.getExhibition(id);

		exhibition.setNameOfExhibition(name);
		exhibition.setDescription(description);
		exhibition.setTypeofExhibition(TypeOfExhibition.valueOf(chosen));

		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			Date dateBegin = new Date(sdf.parse(begin).getTime());
			Date dateEnd = new Date(sdf.parse(end).getTime());
			exhibition.setDateEnd(dateEnd);
			exhibition.setDateBegin(dateBegin);
		} catch (ParseException e) {
		}

		exhibitionService.updateExhibition(exhibition);
		return "redirect:/exhibitions";
	}

	@PutMapping("/exhibitions/{id}")
	public void updateExhibition(@RequestBody Exhibitions exhibit) {
		exhibitionService.updateExhibition(exhibit);
	}

	@DeleteMapping("/exhibitions/{id}")
	public void deleteExhibition(@PathVariable Integer id) {
		exhibitionService.deleteExhibition(id);
	}

	@GetMapping("/exhibitions")
	public String getAllExhibitions(ModelMap model) {
		model.addAttribute("exhibitions", exhibitionService.getAllExhibitions());
		ViewCounter.addAllExhibitions();
		return "allExhibitions";
	}

	@GetMapping("/exhibitions/{id}")
	public ModelAndView getExhibitionById(ModelMap model, @PathVariable int id) {
		ModelAndView modelAndView = new ModelAndView("exhibition");
		model.addAttribute("exhibition", exhibitionService.getExhibition(id));
		model.addAttribute("exhibits", exhibitsService.getExhibitsByExhibitionId(id));

		return modelAndView;
	}
}
