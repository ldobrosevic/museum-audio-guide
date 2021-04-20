package hr.fer.apptownfunk.services;

import java.util.ArrayList;
import java.util.Comparator;
import java.util.List;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import hr.fer.apptownfunk.models.Exhibits;
import hr.fer.apptownfunk.models.ExhibitsAndExhibitionsIds;
import hr.fer.apptownfunk.repository.ExhibitsAndExhibitionsRepository;
import hr.fer.apptownfunk.repository.ExhibitsRepository;

@Service
public class ExhibitsService {

	@Autowired
	private ExhibitsRepository exhibitsRepository;

	@Autowired
	private ExhibitsAndExhibitionsRepository exhibitsAndExhibitionsRepository;

	public List<Exhibits> getAllExhibits() {
		List<Exhibits> exhibits = new ArrayList<>();
		exhibitsRepository.findAll().forEach(exhibits::add);
		return exhibits.stream().sorted(new Comparator<Exhibits>() {
			@Override
			public int compare(Exhibits o1, Exhibits o2) {
				return o1.getName().toLowerCase().compareTo(o2.getName().toLowerCase());
			}
		}).collect(Collectors.toList());
	}

	public Exhibits getExhibitById(Integer id) {
		return exhibitsRepository.findOne(id);
	}

	public void addExhibit(Exhibits exhibitObject) {
		exhibitsRepository.save(exhibitObject);
	}

	public void updateExhibit(Exhibits exhibitObject) {
		exhibitsRepository.save(exhibitObject);
	}

	public void deleteExhibit(Integer id) {
		exhibitsRepository.delete(id);
	}

	public void addExhibitsToExhibition(int exhibitionId, int[] exhibitId) {
		List<ExhibitsAndExhibitionsIds> exhibitionAndExhibitIdsList = new ArrayList<>();

		for (Integer i : exhibitId) {
			exhibitionAndExhibitIdsList.add(new ExhibitsAndExhibitionsIds(exhibitionId, i));
		}

		exhibitsAndExhibitionsRepository.save(exhibitionAndExhibitIdsList);

	}

	public List<Exhibits> getExhibitsByExhibitionId(Integer exhibitionId) {
		List<ExhibitsAndExhibitionsIds> exhibitIdList = exhibitsAndExhibitionsRepository
				.findByExhibitionId(exhibitionId);
		List<Exhibits> exhibitsList = new ArrayList<>();

		for (ExhibitsAndExhibitionsIds ex : exhibitIdList) {
			exhibitsList.add(exhibitsRepository.findOne(ex.getExhibitId()));
		}
		
		return exhibitsList.stream().sorted(new Comparator<Exhibits>() {
			@Override
			public int compare(Exhibits o1, Exhibits o2) {
				return o1.getName().toLowerCase().compareTo(o2.getName().toLowerCase());
			}
		}).collect(Collectors.toList());
	}

	public void removeExhibitsFromExhibition(int exhibitionId, int[] exhibitId) {
		List<ExhibitsAndExhibitionsIds> exhibitIdList = exhibitsAndExhibitionsRepository
				.findByExhibitionId(exhibitionId);
		
		for (int i = 0; i < exhibitId.length; i++) {
			int index = exhibitId[i];
			
			for (int j = 0; j < exhibitIdList.size(); j++) {
				ExhibitsAndExhibitionsIds o = exhibitIdList.get(j);
				
				if (o.getExhibitId() == index) {
					exhibitsAndExhibitionsRepository.delete(o);
				}
			}
		}
	}

}
