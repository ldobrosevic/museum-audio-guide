package hr.fer.apptownfunk.controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;

import hr.fer.apptownfunk.services.ExhibitionService;
import hr.fer.apptownfunk.util.ViewCounter;

@Controller
public class RootController {

	@Autowired
	ExhibitionService exhibitionService;

	@GetMapping("/")
	public String showIndexPage(ModelMap model) {
		model.addAttribute("exhibitions", exhibitionService.getExhibitionsForHomepage());
		ViewCounter.addIndex();
		return "index";
	}

	@GetMapping("/audio")
	public String showAudioPage() {
		return "audio";
	}

	@GetMapping("/aboutus")
	public String showAboutUsPage() {
		return "aboutus";
	}

	@GetMapping("/contact")
	public String showContactPage() {
		return "contact";
	}

	@GetMapping("/pageCount")
	public String showPageCountPage(ModelMap model) {
		model.addAttribute("index", ViewCounter.getIndex());
		model.addAttribute("exhibitions", ViewCounter.getAllExhibitions());
		model.addAttribute("exhibits", ViewCounter.getAllExhibits());
		return "pagecounter";
	}

}