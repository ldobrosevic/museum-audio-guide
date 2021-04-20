package hr.fer.apptownfunk.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;

import hr.fer.apptownfunk.models.ExhibitDetails;

@Repository
public interface ExhibitDetailsRepository extends CrudRepository<ExhibitDetails, Integer>  {
	List<ExhibitDetails> findByExhibitId(Integer id);
}
