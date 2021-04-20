package hr.fer.apptownfunk.controllers;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import hr.fer.apptownfunk.models.Users;
import hr.fer.apptownfunk.services.EmailService;
import hr.fer.apptownfunk.services.PasswordRecoveryService;
import hr.fer.apptownfunk.services.UserService;
import hr.fer.apptownfunk.services.UserServiceRequestType;

@Controller
public class LoginController {
	
	@Autowired
	UserService userService;
	
	@Autowired
	EmailService emailService;
	
	@Autowired
	PasswordRecoveryService passwordRecoveryService;
	
	@GetMapping("/login")
	public String showLoginPage(HttpSession session) {
		Users user = (Users) session.getAttribute("user");
		if(user != null) {
			return "redirect:/";
		}

		return "login";
	}
	
	@PostMapping("/login")
    public String userValidation(HttpSession session, ModelMap model, @RequestParam String username, @RequestParam String password){
        String isValidUser = userService.validateUser(username, password);

        if (!isValidUser.equals("")) {
        	model.addAttribute("errorMessage", isValidUser);
            
            return "login";
        }

        Users user = userService.getUser(username, UserServiceRequestType.USERNAME);
        session.setAttribute("user", user);
        
        return "redirect:/";
    }
	
	@GetMapping("/logout")
	public String logoutUser(HttpSession session) {
		Object o = session.getAttribute("user");
		
		if(o == null) {
			return "redirect:/";
		} 
		
		session.removeAttribute("user");	
		return "index";	
	}
	
	@GetMapping("/forgotPassword")
	public String forgotPassword(HttpServletRequest request) {
		ServletContext context = request.getServletContext();
		Object o = context.getAttribute("user");
		
		if(o != null) {
			return "redirect:/";
		}
		
		return "passRecoveryEmail";
	}
	
	@PostMapping("/forgotPassword")
	public String forgotPasswordPost(ModelMap model, @RequestParam String email) {
		String emailCheck = userService.getUser(email, UserServiceRequestType.EMAIL) == null ? null : "";
		
        if (emailCheck == null) {
            model.put("errorMessage", "Ne postoji registrirani korisnik s danom e-mail adresom");
            return "passRecoveryEmail";
        }
        
        String recoveryToken = passwordRecoveryService.addRecovery(email);
        
        emailService.sendSimpleMessage(email, "Poslan je zahtjev za promjenom lozinke, ako želite nastaviti pritisnite link u nastavku: ",
				"<a href=\"http://localhost:8080/recoverPassword?t=" + recoveryToken + "\">Promjeni lozinku</a>");

        
		return "successful";
	}
}
