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
import com.kte.project.VO.RoomVO;
import com.kte.project.VO.paymentVO;
import com.kte.project.dao.CustomDAO;
import com.kte.project.dao.guestDAO;
import com.kte.project.dao.paymentDAO;

@Controller
public class GuestController {
	@Autowired
	private CustomDAO cdao = null;
	@Autowired
	private guestDAO gdao = null;
	@Autowired
	private paymentDAO pdao = null;
	
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
	
	@RequestMapping(value="/host_list.do", method = RequestMethod.GET)
	public String host(HttpSession http,Model model) {
		CustomVO vo =(CustomVO)http.getAttribute("custom");
		
		if(vo == null) {
			return "redirect:login.do";
		}
		
		CustomVO cvo = cdao.selectmember(vo.getCustom_id());		
		int sum = 0;		
		List<ReservationVO> list = gdao.host_reser(cvo.getCustom_id());
		for(int i=0;i<list.size();i++) {
			sum += list.get(i).getReser_count();
		}
		List<ReservationVO> rlist = gdao.host_reser_list(cvo.getCustom_id());
		model.addAttribute("list", list);
		model.addAttribute("sum", sum);
		model.addAttribute("rlist", rlist);
		return "host";
	}
	
	@RequestMapping(value="/reser_detail.do", method = RequestMethod.GET)
	public String reser_detail(HttpSession http,Model model,HttpServletRequest request,
			@RequestParam("code")int code) {
		if(request.getHeader("referer")==null) {
			return "redirect:main.do";
		}else {
			CustomVO vo =(CustomVO)http.getAttribute("custom");
			
			if(vo == null) {
				return "redirect:login.do";
			}		

			ReservationVO reser = gdao.select_guest_reser(code);
			CustomVO host = gdao.host_info(reser.getHost_id());
			CustomVO guestvo = gdao.host_info(reser.getGuest_id());
			RoomVO mvo = gdao.mapSearch(reser.getRoom_code());
			List<CustomVO> list= cdao.select_profile(vo.getCustom_id());
			int img_code =-1;
			if(!list.isEmpty()) {
				img_code = list.get(0).getImg_code();
			}
			paymentVO pvo = pdao.select_payment(code);
			model.addAttribute("host", host);
			model.addAttribute("reser", reser);
			model.addAttribute("guest", vo.getCustom_id());
			model.addAttribute("gvo", guestvo);
			model.addAttribute("guest_img", img_code);
			model.addAttribute("guest_name", vo.getCustom_name());
			model.addAttribute("map", mvo);
			String[] card = {"KB국민","삼성","현대","신한","롯데","NH농협","우리","하나","씨티","SC리워드","카카오뱅크","BC"};
			model.addAttribute("card", card);
			model.addAttribute("pvo", pvo);
			return "reser_detail";
		}
		
	}
	
	@RequestMapping(value="/hope.do", method = RequestMethod.GET)
	public String hope(HttpSession http,Model model) {
		CustomVO vo =(CustomVO)http.getAttribute("custom");
		
		if(vo == null) {
			return "redirect:login.do";
		}
		
		String like = gdao.custom_like(vo.getCustom_id());	
		
		String[] a = like.split(";");
		
		List<RoomVO> list = gdao.hope_list(a);
		
		int size = list.size();
		
		for(RoomVO rvo : list) {
			
			String addr = rvo.getRoom_addr();
			String addr2 = "";
			String[] saddr = addr.split(" ");
			for(int i=0;i<=2;i++) {
				addr2+=saddr[i] + " ";
			}
			rvo.setRoom_addr(addr2);
		}
		model.addAttribute("size", size);
		model.addAttribute("list", list);
		
		return "hope";
	}
}
