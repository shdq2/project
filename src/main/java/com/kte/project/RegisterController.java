package com.kte.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kte.project.VO.CustomVO;
import com.kte.project.dao.RegisterDAO;

@Controller
public class RegisterController {
	@Autowired
	RegisterDAO rDAO = null;
	
	@RequestMapping(value="/register.do", method = RequestMethod.GET)
	public String register(Model model) {
		CustomVO vo = new CustomVO();
		model.addAttribute("vo", vo);
		
		return "register";
	}
	
	@RequestMapping(value="/register.do", method = RequestMethod.POST)
	public String p_register(@ModelAttribute("vo") CustomVO vo) {
		System.out.println(vo.getCustom_id()+ " " + vo.getCustom_name());
		int ret = rDAO.insertRegister(vo);
		
		if(ret > 0) {
			System.out.println("회원가입 성공");
			return "redirect:main.do";
		}
		
		System.out.println("회원가입 실패");
		return "redirect:register.do";
	}
}
