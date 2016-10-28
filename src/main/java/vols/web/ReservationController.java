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

import vol.metier.dao.ReservationDao;
import vol.metier.model.ClientEI;
import vol.metier.model.Reservation;
import vol.metier.model.TitrePhysique;

@Controller
@RequestMapping("/reservation")
public class ReservationController {

	@Autowired
	private ReservationDao reservationDao;

	@RequestMapping({ "/list", "" })
	public String list(Model model) {
		List<Reservation> reservations = reservationDao.findAll();

		model.addAttribute("reservations", reservations);

		return "reservation/reservations";
	}

	@RequestMapping("/add")
	public ModelAndView add() {
		ModelAndView mav = new ModelAndView("reservation/reservationEdit", "reservation", new Reservation());

		return mav;
	}

	@RequestMapping("/edit")
	public String edit(@RequestParam("id")  Long idReservation, Model model) {
		Reservation reservation = reservationDao.find(idReservation);

		model.addAttribute("reservation", reservation);
		model.addAttribute("mode", "edit");

		return "reservation/reservationEdit";
	}

	@RequestMapping("/save")
	public String save(@ModelAttribute("reservation") @Valid Reservation reservation, BindingResult result, Model model) {

		if(result.hasErrors()) {
			return "reservation/reservationEdit";
		}
		
		if (reservation.getId() != null) {
			reservationDao.update(reservation);
		}
		
		else {
			reservationDao.create(reservation);
		}
		
		return "forward:list";
	}

	@RequestMapping("/delete")
	public String delete(@RequestParam("id") Long idReservation, Model model) {
		Reservation reservation = reservationDao.find(idReservation);

		reservationDao.delete(reservation);

		return "redirect:list";
	}
}
 