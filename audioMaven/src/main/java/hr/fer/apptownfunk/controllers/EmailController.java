package hr.fer.apptownfunk.controllers;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hr.fer.apptownfunk.models.UserRoles;
import hr.fer.apptownfunk.models.Users;
import hr.fer.apptownfunk.services.EmailService;
import hr.fer.apptownfunk.services.PasswordRecoveryService;
import hr.fer.apptownfunk.services.UserService;
import hr.fer.apptownfunk.services.UserServiceRequestType;
import hr.fer.apptownfunk.util.Crypto;

@Controller
public class EmailController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	PasswordRecoveryService passwordRecoveryService;
	
	@Autowired
	EmailService emailService;	

	@GetMapping("/validateEmail")
	public String validateEmail(@RequestParam String t) {
		Users user = userService.getUser(t, UserServiceRequestType.VALIDATION_TOKEN);
		
		if(user == null) {				
			return "unsuccessful";		 
		}
		
		user.setEmailVerified(true);
		userService.updateUser(user);
		
		return "email";
	}
	
	@GetMapping("/recoverPassword")
	public String recoverPassword(ModelMap model, @RequestParam String t) {
		String email = passwordRecoveryService.getEmail(t);
		
		if(email == null) {				
			return "unsuccessful";
		}
		
		model.addAttribute("sentFromMail", email);
		
		return "enterNewPassword";
	}
	
	@PostMapping("/recoverPassword")
	public String recoverPassword(@RequestParam String password, @RequestParam String e) {
		Users user = userService.getUser(e, UserServiceRequestType.EMAIL);
		
		if(user == null) {
			return "unsuccessful";			
		}
		
		user.setPassword(Crypto.toSHA1(password));
		userService.updateUser(user);
		
		return "email";
	}
	
	@GetMapping("promoMaterial")
	public String sendPromoMaterialPage(HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		if(user == null ||
		   (user != null && !user.getRole().equals(UserRoles.ADMIN.getRole()))) {
			return "redirect:/";
		}

		return "promoMaterial";
	}
	
	@PostMapping("/sendPromo")
	public String sendPromoMaterial(ModelMap map, @RequestParam String subject, @RequestParam String mailBody) {
		List<Users> users = userService.getAllUsers();
		
		Users currentUser;		
		for(int i = 0, w = users.size(); i < w; i++) {
			currentUser = users.get(i);
			if(currentUser.isEmailVerified() && currentUser.getRole().equals(UserRoles.REGISTERED_USER.getRole())) {
				emailService.sendSimpleMessage(currentUser.getEmail(), subject, mailBody);
			}
		}
		
		map.addAttribute("message", "Promo materijali uspješno poslani");
		return "successful";
	}

}
