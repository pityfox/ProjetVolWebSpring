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

import vol.metier.dao.PassagerDao;
import vol.metier.model.Passager;

@Controller
@RequestMapping("/passager")
public class PassagerController {

	@Autowired
	private PassagerDao passagerDao;

	public PassagerController() {
		super();
	}

	@RequestMapping({ "/list", "" })
	public String list(Model model) {
		List<Passager> passagers = passagerDao.findAll();

		model.addAttribute("passagers", passagers);

		return "passager/passagers";
		
	}

	@RequestMapping("/add")
	public ModelAndView add() {
		ModelAndView mav = new ModelAndView("passager/passagerEdit","passager", new Passager());
		

		return mav;
	}

	@RequestMapping("/edit")
	public String edit(@RequestParam("id") Long idPassager, Model model) {
		Passager passager = passagerDao.find(idPassager);

		model.addAttribute("passager", passager);
		model.addAttribute("mode", "edit");

		return "passager/passagerEdit";
	}

	@RequestMapping("/save")
	public String save(@ModelAttribute("passager") @Valid Passager passager, BindingResult result) {

		if(result.hasErrors()){
			return "passager/passagerEdit";
		}
//		if("edit".equals(mode)) {
//		return "passager/paasagerEdit";	
//			
//		}
//		else
		
		if (Long.valueOf(passager.getId() )!= null) {
			passagerDao.update(passager);
		} else

		{
			passagerDao.create(passager);
		}

		return "forward:list";

	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Long idPassager, Model model) {
		Passager passager = passagerDao.find(idPassager);

		passagerDao.delete(passager);

		return "forward:list";
	}

}
