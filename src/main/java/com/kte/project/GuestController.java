package com.kte.project;

import static org.hamcrest.CoreMatchers.instanceOf;

import java.io.FileReader;
import java.io.InputStream;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.fasterxml.jackson.core.JsonParser;
import com.kte.project.VO.CustomVO;
import com.kte.project.VO.ReservationVO;
import com.kte.project.dao.CustomDAO;
import com.kte.project.dao.guestDAO;

@Controller
public class GuestController {
	@Autowired
	private CustomDAO cdao = null;
	@Autowired
	private guestDAO gdao = null;
	
	@RequestMapping(value="/guest.do", method = RequestMethod.GET)
	public String guest(HttpSession http,Model model) {
		CustomVO vo =(CustomVO)http.getAttribute("custom");
		
		if(vo == null) {
			return "redirect:login.do";
		}
		
		CustomVO cvo = cdao.selectmember(vo.getCustom_id());		
		int sum = 0;		
		List<ReservationVO> list = gdao.guest_reser(cvo.getCustom_id());
		for(int i=0;i<list.size();i++) {
			sum += list.get(i).getReser_count();
		}
		
		List<ReservationVO> rlist = gdao.guest_reser_list(cvo.getCustom_id());
		model.addAttribute("list", list);
		model.addAttribute("sum", sum);
		model.addAttribute("rlist", rlist);
		return "guest";
	}
	
	@RequestMapping(value="/reser_detail.do", method = RequestMethod.GET)
	public String reser_detail(HttpSession http,Model model,HttpServletRequest request,
			@RequestParam("code")int code) {
		if(request.getHeader("referer")==null) {
			return "redirect:/";
		}else {
			CustomVO vo =(CustomVO)http.getAttribute("custom");
			
			if(vo == null) {
				return "redirect:login.do";
			}
			ReservationVO reser = gdao.select_guest_reser(code);
			CustomVO host = gdao.host_info(reser.getHost_id());
			
			model.addAttribute("host", host);
			model.addAttribute("reser", reser);
			model.addAttribute("guest", vo.getCustom_id());
			return "reser_detail";
		}
		
	}
}
