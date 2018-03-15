package com.kte.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kte.project.VO.CustomVO;
import com.kte.project.dao.LoginDAO;

@Controller
public class LoginController {
	@Autowired
	LoginDAO lDAO = null; 
	
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public String register(Model model) {
		CustomVO vo = new CustomVO();
		model.addAttribute("vo", vo);

		return "login";
	}
	
	@RequestMapping(value="/login.do", method = RequestMethod.POST)
	public String p_login(HttpServletRequest request, @ModelAttribute("vo") CustomVO vo) {
		CustomVO cvo = lDAO.selectCustomOne(vo);
		
		if(cvo != null) {
			if(cvo.getCustom_block() != 1) {
				HttpSession httpsession = request.getSession();
				httpsession.setAttribute("custom_name", cvo.getCustom_name());
				httpsession.setAttribute("custom_id", cvo.getCustom_id());
				System.out.println("로그인 성공");
				return "redirect:main.do";
			}else {
				System.out.println("차단된 아이디");
				return "redirect:login.do"; 
			}
			
		}else {
			System.out.println("존재하지 않는 아이디");
			return "redirect:login.do";
		}
		
		
	}
	
	@RequestMapping(value="/logout.do", method = RequestMethod.GET)
	public String p_logout(HttpServletRequest request) {
		HttpSession httpsession = request.getSession();
		httpsession.invalidate();
		
		return "redirect:login.do";
	}
}
