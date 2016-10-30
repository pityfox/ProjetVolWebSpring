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

import vol.metier.dao.AeroportDao;
import vol.metier.model.Aeroport;

@Controller
@RequestMapping("/aeroport")
public class AeroportController {
	
		@Autowired
		private AeroportDao aeroportDao;

		
		public AeroportController() {
			super();
		}

		
		@RequestMapping({"/list",""})
		public String list(Model model) {
			List<Aeroport> mesAeroports = aeroportDao.findAll();
			
			model.addAttribute("mesAeroports", mesAeroports);

			return "aeroport/aeroports";
		}

		@RequestMapping("/add")
		public ModelAndView add() {
			ModelAndView mav = new ModelAndView("aeroport/aeroportEdit");
			mav.addObject("aeroport", new Aeroport());
			
			return mav;
		}

		@RequestMapping("/edit")
		public String edit(@RequestParam("id") Long idAeroport, Model model) {
			Aeroport aeroport = aeroportDao.find(idAeroport);
			
			model.addAttribute("aeroport", aeroport);
			
			return "aeroport/aeroportEdit";
		}

		@RequestMapping("/save")
		public String save(@ModelAttribute("aeroport") @Valid Aeroport aeroport, BindingResult result) {
			
			if(result.hasErrors()) {
				
				return "aeroport/aeroportEdit";
			}
			
			if(aeroport.getId()!=null) {
				aeroportDao.update(aeroport);
			} else {
				aeroportDao.create(aeroport);
			}
			
			return "forward:list";
		}

		@RequestMapping("/delete")
		public String delete(@RequestParam("id") Long idClient) {
			Aeroport aeroport = aeroportDao.find(idClient);
			
			aeroportDao.delete(aeroport);
			
			return "forward:list";
		}

		

	}


