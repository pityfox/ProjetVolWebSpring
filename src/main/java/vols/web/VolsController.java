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


import vol.metier.dao.VolDao;
import vol.metier.model.Vol;

@Controller
@RequestMapping({"/vols","/vol"})
public class VolsController {

	@Autowired
	private VolDao volDao;

	@RequestMapping({ "/list", "" })
	public String list(Model model) {
		List<Vol> vols = volDao.findAll();

		model.addAttribute("page", "vols");
		model.addAttribute("vols", vols);

		return "vol/vols";
	}

	@RequestMapping("/add")
	public ModelAndView add() {
		ModelAndView mav = new ModelAndView("vol/volEdit", "vol", new Vol());

		return mav;
	}

	@RequestMapping("/edit")
	public String edit(@RequestParam("id") Long id, Model model) {
		Vol vol = volDao.find(id);

		model.addAttribute("vol", vol);
		//model.addAttribute("mode", "edit");

		return "vol/volEdit";
	}

	@RequestMapping("/save")
	public String save(@ModelAttribute("vol") @Valid Vol vol, BindingResult result, Model model) {
		if(result.hasErrors()) {
			
			return "vol/volEdit";
		}
		
		if (vol.getId()!=0) {
			volDao.update(vol);
		} else {
			volDao.create(vol);
		}

		return "forward:list";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Long id) {
		Vol vol = volDao.find(id);

		volDao.delete(vol);

		return "redirect:list";
	}
}
