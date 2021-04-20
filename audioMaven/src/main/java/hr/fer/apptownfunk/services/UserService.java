package hr.fer.apptownfunk.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.fer.apptownfunk.models.UserRoles;
import hr.fer.apptownfunk.models.Users;
import hr.fer.apptownfunk.repository.UserRepository;
import hr.fer.apptownfunk.util.Crypto;

@Service
public class UserService {

	@Autowired
	private UserRepository userRepository;

	public List<Users> getAllUsers() {
		List<Users> users = new ArrayList<>();
		userRepository.findAll().forEach(users::add);

		return users;
	}

	public void addUser(Users user) {
		userRepository.save(user);
	}

	public void updateUser(Users user) {
		userRepository.save(user);
	}

	public void deleteUser(Integer id) {
		userRepository.delete(id);
	}

	public Users getUser(int id) {
		return userRepository.findOne(id);
	}
	
	public Users getUser(String str, UserServiceRequestType t) {
		if(t.equals(UserServiceRequestType.VALIDATION_TOKEN)) {
			return userRepository.findByValidationToken(Crypto.toSHA1(str));
		} else if(t.equals(UserServiceRequestType.USERNAME)) {
			return userRepository.findByUsername(str);
		} else if(t.equals(UserServiceRequestType.EMAIL)) {
			return userRepository.findByEmail(str);
		}
		return null;
	}

	public String validateUser(String username, String password) {
		Users user =  userRepository.findByUsernameAndPassword(username, Crypto.toSHA1(password));
		
		if(user != null) {
			if(user.isEmailVerified()) {
				return "";				
			} else {
				return "Please verify your account before signing in";
			}
		}
		
		return "Username or password is not valid";
	}

	public String registrateUser(String username, String password, String firstName, String lastName, String email) {
		Users user1 = userRepository.findByUsername(username);
		
		if(user1 != null) {
			return null;
		}
		
		user1 = userRepository.findByEmail(email);
		
		if(user1 != null) {
			return null;
		}
		
		Users newUser = new Users(firstName, lastName, username, password, UserRoles.REGISTERED_USER.getRole(), email, false);
		userRepository.save(newUser);
		
		return newUser.getValidationTokenNoHash();
	}
	
	public boolean AddNewAdmin(String username) {
		
		Users user = userRepository.findByUsername(username);
		
		if(user == null){
			return false;
		}
		
		user.setRole(UserRoles.ADMIN.getRole());
		
		this.updateUser(user);
		
		return true;
		
	}
	
	
	public List<Users> getAllAdmins(){
		
		List<Users> allUsers = new ArrayList<>();
		List<Users> admins = new ArrayList<>();
		
		allUsers = this.getAllUsers();
		
		for(Users o : allUsers){
			if(o.getRole().equals(UserRoles.ADMIN.getRole())){
				admins.add(o);
			}
		}
		
		return admins;	
	}
	
	public String numberOfAdmins(){
		
		List<Users> admins = new ArrayList<>();
		admins = this.getAllAdmins();
		Integer size = admins.size();
		
		return Integer.toString(size);
	}
	
	public void deleteAdmins(String[] adminsUsernames){
		
		for(int i = 0; i < adminsUsernames.length; ++i) {
			
			Users user = userRepository.findByUsername(adminsUsernames[i]);
			user.setRole(UserRoles.REGISTERED_USER.getRole());
			this.updateUser(user);
			
		}
		
	}
	
	
}
