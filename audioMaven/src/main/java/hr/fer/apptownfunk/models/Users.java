package hr.fer.apptownfunk.models;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Transient;

import hr.fer.apptownfunk.util.Crypto;
import hr.fer.apptownfunk.util.ValidationTokenGenerator;

@Entity
public class Users {
	
	/**
	 * Id of user
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int userId;
	
	/**
	 * First name of user
	 */
	@Column(nullable = false)
	private String firstName;
	
	/**
	 * Last name of user
	 */
	@Column(nullable = false)
	private String lastName;
	
	@Column(nullable = false)
	private String email;
	
	/**
	 * User's username
	 */
	@Column(nullable = false)
	private String username;
	
	/**
	 * User password
	 */
	@Column(nullable = false)
	private String password;
	
	@Column(nullable = false)
	private boolean emailVerified;
	
	/**
	 * User's role
	 */
	@Column(nullable = false)
	private String role;
	
	/**
	 * Email validation token
	 */
	@Column(nullable = false)
	private String validationToken;
	
	@Transient
	private String validationTokenNoHash;
	
	public String getValidationTokenNoHash() {
		return validationTokenNoHash;
	}
		
	protected Users(){
		super();
	}
	
	public Users(String firstName, String lastName, String username, String password, String role,
			String email, boolean emailVerified){
		super();
		this.firstName = firstName;
		this.lastName = lastName;
		this.username = username;
		this.password = password;
		if(!password.equals("")) {
			this.password = Crypto.toSHA1(password);
		}
		this.email = email;
		this.role = role;
		this.emailVerified = emailVerified;
		validationTokenNoHash = ValidationTokenGenerator.getSaltString();
		this.validationToken = Crypto.toSHA1(validationTokenNoHash);
	}
	

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	/**
	 * @return the id
	 */
	public int getUserId() {
		return userId;
	}

	/**
	 * @param id the id to set
	 */
	public void setUserId(int userId) {
		this.userId = userId;
	}

	/**
	 * @return the firstName
	 */
	public String getFirstName() {
		return firstName;
	}

	/**
	 * @param set the firstName sets the user's first name
	 */
	public void setFirstName(String firstName) {
		this.firstName = firstName;
	}

	/**
	 * @return the lastName
	 */
	public String getLastName() {
		return lastName;
	}

	/**
	 * @param the lastName sets the user's last name
	 */
	public void setLastName(String lastName) {
		this.lastName = lastName;
	}

	/**
	 * @return the username
	 */
	public String getUsername() {
		return username;
	}

	/**
	 * @param the username sets the username
	 */
	public void setUsername(String username) {
		this.username = username;
	}

	/**
	 * @return the password
	 */
	public String getPassword() {
		return password;
	}

	/**
	 * @param the password sets the user's password
	 */
	public void setPassword(String password) {
		this.password = password;
	}

	/**
	 * @return the user's role
	 */
	public String getRole() {
		return role;
	}

	/**
	 * @param the role sets the user's role
	 */
	public void setRole(String role) {
		this.role = role;
	}

	/**
	 * @return the emailVerified
	 */
	public boolean isEmailVerified() {
		return emailVerified;
	}

	/**
	 * @param emailVerified the emailVerified to set
	 */
	public void setEmailVerified(boolean emailVerified) {
		this.emailVerified = emailVerified;
	}	
	
	/**
	 * Getter for validation token
	 * @return	validation token string
	 */
	public String getValidationToken() {
		return validationToken;
	}


}
