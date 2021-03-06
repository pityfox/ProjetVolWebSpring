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
import vol.metier.model.Login;


@Controller
@RequestMapping("/login")

public class LoginController {
	@SuppressWarnings("unused")
	@Autowired
	private LoginDao logintDao;

	
	public LoginController() {
		super();
	}

	
	@RequestMapping({"/list",""})
	public String list(Model model) {
		List<Login> mesLogins = logintDao.findAll();
		
		model.addAttribute("mesLogins", mesLogins);

		return "login/logins";
	}

	@RequestMapping("/add")
	public ModelAndView add() {
		ModelAndView mav = new ModelAndView("login/loginEdit");
		mav.addObject("login", new Login());
		
		return mav;
	}

	@RequestMapping("/edit")
	public String edit(@RequestParam("id") Long idLogin, Model model) {
		Login login= logintDao.find(idLogin);
		
		model.addAttribute("login", login);
		
		return "login/loginEdit";
	}

	@RequestMapping("/save")
	public String save(@ModelAttribute("login") @Valid Login login, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			
			
			return "login/loginEdit";
		}
		
		if(Long.valueOf(login.getId())!=null) {
			logintDao.update(login);
		} else {
			logintDao.create(login);
		}
		
		return "forward:list";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Long idLogin) {
		Login login = logintDao.find(idLogin);
		
		logintDao.delete(login);
		
		return "forward:list";
	}


}
