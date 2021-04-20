package hr.fer.apptownfunk.services;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.fer.apptownfunk.models.ExhibitDetails;
import hr.fer.apptownfunk.repository.ExhibitDetailsRepository;

@Service
public class ExhibitDetailsService {

	@Autowired
	private ExhibitDetailsRepository exhibitDetailsRepository;

	public List<ExhibitDetails> getAllExhibitDetails() {
		List<ExhibitDetails> exhibitDetails = new ArrayList<>();
		exhibitDetailsRepository.findAll().forEach(exhibitDetails::add);

		return exhibitDetails;
	}
	
	public List<ExhibitDetails> getAllExhibitDetailsExhibitId(Integer id) {
		List<ExhibitDetails> exhibitDetails = new ArrayList<>();
		exhibitDetailsRepository.findByExhibitId(id).forEach(exhibitDetails::add);

		return exhibitDetails;
	}

	public ExhibitDetails getExhibitDetail(Integer id) {
		return exhibitDetailsRepository.findOne(id);
	}

	public void addExhibitDetail(ExhibitDetails exhibitDetail) {
		exhibitDetailsRepository.save(exhibitDetail);
	}

	public void updateExhibitDetail(ExhibitDetails exhibitDetail) {
		exhibitDetailsRepository.save(exhibitDetail);
	}

	public void deleteExhibitDetail(Integer id) {
		exhibitDetailsRepository.delete(id);
	}
}
