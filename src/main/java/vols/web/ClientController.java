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

import vol.metier.dao.ClientDao;
import vol.metier.model.Client;
import vol.metier.model.ClientEI;
import vol.metier.model.ClientMoral;
import vol.metier.model.ClientPhysique;
import vol.metier.model.TitreMoral;
import vol.metier.model.TitrePhysique;

@Controller
@RequestMapping("/client")
public class ClientController {
	@Autowired
	private ClientDao clientDao;

	
	public ClientController() {
		super();
	}

	
	@RequestMapping({"/list",""})
	public String list(Model model) {
		List<Client> clients = clientDao.findAll();
		model.addAttribute("clients", clients);
		
		return "client/clients";
	}

	@RequestMapping("/add")
	public String add(Model model) {
		if(client instanceof ClientMoral){
			model.addAttribute("titres", TitreMoral.values());
			return "client/clientMoralEdit";
		}else if(client instanceof ClientPhysique){
			model.addAttribute("titres", TitrePhysique.values());
			return "client/clientPhysiqueEdit";
		}else if(client instanceof ClientEI){
			model.addAttribute("titres", TitrePhysique.values());
			return "client/clientEIEdit";
		}else{
			return "client";
		}
	}
	

	@RequestMapping("/edit")
	public String edit(@RequestParam("id") Long idClient, Model model) {
		Client client = clientDao.find(idClient);
		model.addAttribute("client", client);
		
		if(client instanceof ClientMoral){
			model.addAttribute("titres", TitreMoral.values());
			return "client/clientMoralEdit";
		}else if(client instanceof ClientPhysique){
			model.addAttribute("titres", TitrePhysique.values());
			return "client/clientPhysiqueEdit";
		}else if(client instanceof ClientEI){
			model.addAttribute("titres", TitrePhysique.values());
			return "client/clientEIEdit";
		}else{
			return "client";
		}
		
	}

	@RequestMapping("/save")
	public String save(@ModelAttribute("client") @Valid Client client, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			model.addAttribute("titres", Titre.values());
			
			return "client/clientEdit";
		}
		
		if(Long.valueOf(client.getId()) != null) {
			clientDao.update(client);
		} else { 
			clientDao.create(client);
		}
		
		return "forward:list";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Long idClient) {
		Client client = clientDao.find(idClient);
		
		clientDao.delete(client);
		
		return "forward:list";
	}

	
}

