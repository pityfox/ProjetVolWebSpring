package vols.web;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import vol.metier.dao.LoginDao;
import vol.metier.dao.VilleDao;
import vol.metier.model.Login;
import vol.metier.model.Ville;


@Controller
@RequestMapping("/ville")
public class VilleController {
	@SuppressWarnings("unused")
	@Autowired
	private VilleDao villeDao;

	
	public VilleController() {
		super();
	}

	
	@RequestMapping({"/list",""})
	public String list(Model model) {
		List<Ville> mesVilles= villeDao.findAll();
		
		model.addAttribute("mesVilles", mesVilles);

		return "ville/villes";
	}

	@RequestMapping("/add")
	public ModelAndView add() {
		ModelAndView mav = new ModelAndView("ville/villeEdit");
		mav.addObject("ville", new Ville());
		
		return mav;
	}

	@RequestMapping("/edit")
	public String edit(@RequestParam("id") Long idVille, Model model) {
		Ville ville= villeDao.find(idVille);
		
		model.addAttribute("ville", ville);
		
		return "ville/villeEdit";
	}

	@RequestMapping("/save")
	public String save(@ModelAttribute("ville") @Valid Ville ville, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			
			
			return "ville/villeEdit";
		}
		
		if(Long.valueOf(ville.getId())!=null) {
			villeDao.update(ville);
		} else {
			villeDao.create(ville);
		}
		
		return "forward:list";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Long idLogin) {
		Ville ville = villeDao.find(idLogin);
		
		villeDao.delete(ville);
		
		return "forward:list";
	}


}
