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
public class PasswordRecovery {
	
	/**
	 * Id of recovery case
	 */
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int recoveryId;
	
	/**
	 * User's email address
	 */
	@Column(nullable = false)
	private String email;

	/**
	 * Password recovery token
	 */
	@Column(nullable = false)
	private String recoveryToken;
	
	@Transient
	private String recoveryTokenNoHash;
	public String getRecoveryTokenNoHash() {
		return recoveryTokenNoHash;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getRecoveryToken() {
		return recoveryToken;
	}
	
	public void setRecoveryToken(String recoveryToken) {
		this.recoveryToken = recoveryToken;
	}
	
	public PasswordRecovery() {
		super();
	}
	
	public PasswordRecovery(String email) {
		this.email = email;
		recoveryTokenNoHash = ValidationTokenGenerator.getSaltString();
		this.recoveryToken = Crypto.toSHA1(recoveryTokenNoHash);		
	}

}
