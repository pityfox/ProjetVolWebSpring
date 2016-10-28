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

import vol.metier.dao.CompagnieAerienneDao;
import vol.metier.model.CompagnieAerienne;

@Controller
@RequestMapping({"/compagnieAerienne","/compagniesAerienne","/compagnieAeriennes","/compagniesAeriennes"})
public class CompagnieAerienneController {

	@Autowired
	private CompagnieAerienneDao compagnieAerienneDao;

	
	public CompagnieAerienneController() {
		super();
	}

	
	@RequestMapping({"/list",""})
	public String list(Model model) {
		List<CompagnieAerienne> compagnieAeriennes = compagnieAerienneDao.findAll();
		
		model.addAttribute("compagnieAeriennes", compagnieAeriennes);
		model.addAttribute("page", "compagnieAerienne");
		return "compagnieAerienne/compagnieAeriennes";
	}

	@RequestMapping("/add")
	public ModelAndView add() {
		ModelAndView mav = new ModelAndView("compagnieAerienne/compagnieAerienneEdit");
		mav.addObject("compagnieAerienne", new CompagnieAerienne());
		
		return mav;
	}

	@RequestMapping("/edit")
	public String edit(@RequestParam("id") Long idCompagnieAerienne, Model model) {
		CompagnieAerienne compagnieAerienne = compagnieAerienneDao.find(idCompagnieAerienne);
		
		model.addAttribute("compagnieAerienne", compagnieAerienne);
		
		return "compagnieAerienne/compagnieAerienneEdit";
	}

	@RequestMapping("/save")
	public String save(@ModelAttribute("compagnieAerienne") @Valid CompagnieAerienne compagnieAerienne, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			return "compagnieAerienne/compagnieAerienneEdit";
		}
		
		if(Long.valueOf(compagnieAerienne.getId()) != null) {
			compagnieAerienneDao.update(compagnieAerienne);
		} else {
			compagnieAerienneDao.create(compagnieAerienne);
		}
		
		return "forward:list";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Long idCompagnieAerienne) {
		CompagnieAerienne compagnieAerienne = compagnieAerienneDao.find(idCompagnieAerienne);
		
		compagnieAerienneDao.delete(compagnieAerienne);
		
		return "forward:list";
	}
	
}
