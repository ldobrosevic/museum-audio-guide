package hr.fer.apptownfunk.controllers;

import java.io.IOException;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hr.fer.apptownfunk.models.Users;
import hr.fer.apptownfunk.services.EmailService;
import hr.fer.apptownfunk.services.UserService;
import hr.fer.apptownfunk.services.UserServiceRequestType;

@Controller
public class RegistrationController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	EmailService emailService;	

	@GetMapping("/registration")
	public String showRegistrationPage(HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		if(user != null) {
			return "redirect:/";
		}
		
		return "registration";
	}
	
	@PostMapping("/registration")
    public String registrateUser(ModelMap model, @RequestParam String username, @RequestParam String password,
    		@RequestParam String firstname, @RequestParam String lastname, @RequestParam String email){
        String validationToken = userService.registrateUser(username, password, firstname, lastname, email);

        if (validationToken == null) {
            model.put("errorMessage", "Username already in use");
            return "registration";
        }

		emailService.sendSimpleMessage(email, "Dobrodosli u muzej "+ username, "<a href=\"http://localhost:8080/validateEmail?t=" + validationToken + "\">Verify Email</a>");
				
		model.addAttribute("message", "Uspješno ste se registrirali");
		return "successful";
    }
	
	@PostMapping("/exists")
	public ResponseEntity<String> checkIfExists(ModelMap model, @RequestParam Map<String, String> allRequestParams) throws IOException {
		String username = allRequestParams.get("username");
		String email = allRequestParams.get("email");
		
		Users u = null;
		if(username != null) {
			u = userService.getUser(username, UserServiceRequestType.USERNAME);			
		} else if(email != null) {
			u = userService.getUser(email, UserServiceRequestType.EMAIL);
		}
		
		if(u != null) {
			return ResponseEntity.ok((username != null ? "username" : "email") + " is already in use!");
		}
		return ResponseEntity.ok((username != null ? "username" : "email") + " is currently not in use!");
	}
}
