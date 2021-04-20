package hr.fer.apptownfunk.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import hr.fer.apptownfunk.models.Users;
import hr.fer.apptownfunk.services.UserService;

@Controller
public class AdministrationController {

	@Autowired
	UserService userService;
	
	@GetMapping("/adminTools")
	public ModelAndView showEditAdminToolsPage(ModelMap model) {
		ModelAndView modelAndview = new ModelAndView("adminTools");
		return modelAndview;
	}
	
	@GetMapping("/editAdministrators")
	public ModelAndView showEditAdministratorsPage(ModelMap model) {
		ModelAndView modelAndview = new ModelAndView("editAdministrators");
		model.addAttribute("numberOfAdmins", userService.numberOfAdmins());
		model.addAttribute("admins", userService.getAllAdmins());
		
		List<Users> notAdmins = userService.getAllUsers();
		notAdmins.removeAll(userService.getAllAdmins());
		model.addAttribute("users", notAdmins);
		
		return modelAndview;
	}
	
	@PostMapping("/addAdmins")
	public ModelAndView addAdministrator(ModelMap model, @RequestParam String chosen) {
		userService.AddNewAdmin(chosen);
		return showEditAdministratorsPage(model);
	}
	
	@PostMapping("/removeAdmins")
	public ModelAndView addAdministrator(ModelMap model, @RequestParam("selected") String[] username) {
		userService.deleteAdmins(username);
		return showEditAdministratorsPage(model);
	}
}
