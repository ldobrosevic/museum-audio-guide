package hr.fer.apptownfunk.repository;

import java.util.List;


import org.springframework.data.repository.CrudRepository;
import org.springframework.stereotype.Repository;


import hr.fer.apptownfunk.models.ExhibitsAndExhibitionsIds;

@Repository
public interface ExhibitsAndExhibitionsRepository extends CrudRepository<ExhibitsAndExhibitionsIds, Integer> {
	List<ExhibitsAndExhibitionsIds> findByExhibitionId(Integer id); 
}
