package hr.fer.apptownfunk.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import hr.fer.apptownfunk.models.Users;

@Repository
public interface UserRepository extends CrudRepository<Users, Integer>{
	Users findByUsernameAndPassword(String username, String password);
	Users findByUsername(String username);
	Users findByEmail(String email);
	Users findByValidationToken(String validationToken);
}
