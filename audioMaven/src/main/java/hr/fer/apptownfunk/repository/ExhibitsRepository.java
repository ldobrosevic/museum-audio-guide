package hr.fer.apptownfunk.repository;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import hr.fer.apptownfunk.models.Exhibits;

@Repository
public interface ExhibitsRepository extends CrudRepository<Exhibits, Integer>  {

}
