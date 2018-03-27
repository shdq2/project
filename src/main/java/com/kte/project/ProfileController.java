package com.kte.project;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kte.project.VO.CustomVO;

@Controller
public class ProfileController {
	//@Autowired
	
	@RequestMapping(value="/profile.do", method = RequestMethod.GET)
	public String profile(HttpSession http) {
		CustomVO vo =(CustomVO)http.getAttribute("custom");
		
		if(vo == null) {
			return "redirect:login.do";
		}
		
		return "profile_view";
	}

	@RequestMapping(value="/profileEdit.do", method = RequestMethod.GET)
	public String profileEdit(HttpSession http,Model model) {
		CustomVO vo =(CustomVO)http.getAttribute("custom");
		
		if(vo == null) {
			return "redirect:login.do";
		}
		CustomVO cvo = new CustomVO();
		model.addAttribute("cvo", cvo);		
		
		return "profile_edit";
	}
}
