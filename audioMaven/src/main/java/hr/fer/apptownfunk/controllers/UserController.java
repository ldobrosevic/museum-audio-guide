package hr.fer.apptownfunk.controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;

import hr.fer.apptownfunk.models.Users;
import hr.fer.apptownfunk.services.UserService;

@RestController
public class UserController {

	@Autowired
	private UserService userService;
	
	@PostMapping("/users")
	public void addNewUser(@RequestBody Users user) {
		userService.addUser(user);
	}

	@PutMapping("/users/{id}")
	public void updateUser(@RequestBody Users user) {
		userService.updateUser(user);
	}
	
	@DeleteMapping("/users/{id}")
	public void deleteUser(@PathVariable Integer id) {
		userService.deleteUser(id);
	}

	@GetMapping("/users")
	public List<Users> getAllUsers() {
		return userService.getAllUsers();
	}

	@GetMapping("/users/{id}")
	public Users getUserById(@PathVariable int id) {
		return userService.getUser(id);
	}
}
