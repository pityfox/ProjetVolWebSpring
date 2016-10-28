package vols.web;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Required;
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

	@RequestMapping("/addClientPhysique")
	public String addClientPhysique(Model model) {
			ClientPhysique client = new ClientPhysique();
			model.addAttribute("client", client);
			model.addAttribute("titres", TitrePhysique.values());
			return "client/clientPhysiqueEdit";
	}
	
	@RequestMapping("/addClientMoral")
	public String addClientMoral(Model model) {
			ClientMoral client = new ClientMoral();
			model.addAttribute("client", client);
			model.addAttribute("titres", TitreMoral.values());
			return "client/clientMoralEdit";
	}
	
	@RequestMapping("/addClientEI")
	public String addClientEI(Model model) {
			ClientEI client = new ClientEI();
			model.addAttribute("client", client);
			model.addAttribute("titres", TitrePhysique.values());
			return "client/clientEIEdit";
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

	@RequestMapping("/saveClientPhysique")
	public String saveClientPhysique(@ModelAttribute("client") @Valid ClientPhysique client, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			model.addAttribute("titres", TitrePhysique.values());
			return "client/clientPhysiqueEdit";
		}
		
		if(Long.valueOf(client.getId()) != null) {
			clientDao.update(client);
		} else { 
			clientDao.create(client);
		}
		
		return "forward:list";
	}
	
	@RequestMapping("/saveClientMoral")
	public String saveClientMoral(@ModelAttribute("client") @Valid ClientMoral client, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			model.addAttribute("titres", TitreMoral.values());
			return "client/clientMoralEdit";
		}
		
		if(Long.valueOf(client.getId()) != null) {
			clientDao.update(client);
		} else { 
			clientDao.create(client);
		}
		
		return "forward:list";
	}
	
	@RequestMapping("/saveClientEI")
	public String saveClientEI(@ModelAttribute("client") @Valid ClientEI client, BindingResult result, Model model) {
		
		if(result.hasErrors()) {
			model.addAttribute("titres", TitrePhysique.values());
			return "client/clientEIEdit";
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

