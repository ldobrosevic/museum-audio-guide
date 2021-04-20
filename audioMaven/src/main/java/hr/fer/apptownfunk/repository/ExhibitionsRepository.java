package hr.fer.apptownfunk.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import hr.fer.apptownfunk.models.Exhibitions;

@Repository
public interface ExhibitionsRepository extends CrudRepository<Exhibitions, Integer> {

	
}
