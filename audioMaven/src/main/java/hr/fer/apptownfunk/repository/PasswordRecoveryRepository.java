package hr.fer.apptownfunk.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import hr.fer.apptownfunk.models.PasswordRecovery;

@Repository
public interface PasswordRecoveryRepository extends CrudRepository<PasswordRecovery, Integer> {
	
	PasswordRecovery findByEmail(String email);	
	PasswordRecovery findByRecoveryToken(String recoveryToken);
}
