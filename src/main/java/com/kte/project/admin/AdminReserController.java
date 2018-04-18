package com.kte.project.admin;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kte.project.VO.CustomVO;
import com.kte.project.VO.ReservationVO;
import com.kte.project.dao.adminDAO;
import com.kte.project.dao.admin_wishDAO;
import com.kte.project.dao.adminmemberDAO;
import com.kte.project.dao.adminreservationDAO;
import com.kte.project.dao.adminroomDAO;
import com.kte.project.dao.visitDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminReserController {

	@Autowired
	private adminreservationDAO aredao = null;
	
	@RequestMapping(value = "/admin/admin_reser.do", method = RequestMethod.GET)
	public String home(Model model,HttpSession http) {
		List<ReservationVO> list = aredao.reservation_all();
		
		for(int i = 0;i<list.size();i++) {
			String host_id = list.get(i).getHost_id();
			String guest_id = list.get(i).getGuest_id();
			
			list.get(i).setHost_img_code(aredao.profile_img(host_id));
			list.get(i).setGuest_img_code(aredao.profile_img(guest_id));
			
		}
		
		model.addAttribute("list", list);
		return "admin_reservation";
	}
	
	@RequestMapping(value = "/admin/admin_reser_detail.do", method = RequestMethod.GET)
	public String reser_detail(Model model,HttpSession http,@RequestParam("reser_code")int code) {
		
		ReservationVO vo = aredao.select_reser(code);
		model.addAttribute("vo", vo);
		return "admin_reservation_detail";
	}
	
}
