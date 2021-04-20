package hr.fer.apptownfunk.services;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.fer.apptownfunk.models.Exhibitions;
import hr.fer.apptownfunk.repository.ExhibitionsRepository;

@Service
public class ExhibitionService {

	@Autowired
	private ExhibitionsRepository exhibitionsRepository;

	public List<Exhibitions> getAllExhibitions() {
		List<Exhibitions> exhibitions = new ArrayList<>();
		exhibitionsRepository.findAll().forEach(exhibitions::add);

		return exhibitions.stream().sorted(new Comparator<Exhibitions>() {
			@Override
			public int compare(Exhibitions o1, Exhibitions o2) {
				return o1.getNameOfExhibition().toLowerCase().compareTo(o2.getNameOfExhibition().toLowerCase());
			}
		}).collect(Collectors.toList());
	}

	public Exhibitions getExhibition(Integer id) {
		return exhibitionsRepository.findOne(id);
	}

	public void addExhibition(Exhibitions exhibit) {
		exhibitionsRepository.save(exhibit);
	}

	public void updateExhibition(Exhibitions exhibit) {
		exhibitionsRepository.save(exhibit);
	}

	public void deleteExhibition(Integer id) {
		exhibitionsRepository.delete(id);
	}

	public List<Exhibitions> getExhibitionsForHomepage() {
		List<Exhibitions> exhibitions = new ArrayList<>();
		exhibitionsRepository.findAll().forEach(exhibitions::add);
		return exhibitions.stream().sorted(new Comparator<Exhibitions>() {
			@Override
			public int compare(Exhibitions o1, Exhibitions o2) {
				return o1.getDateBegin().compareTo(o2.getDateBegin());
			}

		}).skip(exhibitions.size() - 4).collect(Collectors.toList());
	}
}
