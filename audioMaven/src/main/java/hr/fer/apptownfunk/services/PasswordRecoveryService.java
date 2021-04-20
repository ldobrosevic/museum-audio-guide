package hr.fer.apptownfunk.services;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.fer.apptownfunk.models.PasswordRecovery;
import hr.fer.apptownfunk.repository.PasswordRecoveryRepository;
import hr.fer.apptownfunk.util.Crypto;

@Service
public class PasswordRecoveryService {

	@Autowired
	PasswordRecoveryRepository passwordRecoveryRepository;

	public String addRecovery(String email) {
		PasswordRecovery passRec = new PasswordRecovery(email);
		passwordRecoveryRepository.save(passRec);
		return passRec.getRecoveryTokenNoHash();
	}
	
	public String getEmail(String recoveryToken) {
		return passwordRecoveryRepository.findByRecoveryToken(Crypto.toSHA1(recoveryToken)).getEmail();
	}
}
