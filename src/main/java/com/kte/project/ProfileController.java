package com.kte.project;

import java.io.FileReader;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.fasterxml.jackson.core.JsonParser;
import com.kte.project.VO.CustomVO;
import com.kte.project.dao.CustomDAO;

@Controller
public class ProfileController {
	@Autowired
	private CustomDAO cdao = null;
	
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
		CustomVO cvo = cdao.selectmember(vo.getCustom_id());
		cvo.setOrigin_id(vo.getCustom_id());
		model.addAttribute("cvo", cvo);	
		
		List<CustomVO> bank_list= cdao.bank_list();
		model.addAttribute("bank", bank_list);
		return "profile_edit";
	}
	@RequestMapping(value="/profileEdit.do", method = RequestMethod.POST)
	public String profileEdit_post(HttpSession http,Model model,@ModelAttribute("cvo")CustomVO cvo) {
		CustomVO vo =(CustomVO)http.getAttribute("custom");
		
		if(vo == null) {
			return "redirect:login.do";
		}
		System.out.println(cvo.getOrigin_id());
		int ret = cdao.customedit(cvo);
		if(ret==1) {
			model.addAttribute("url", "profileEdit.do");
			model.addAttribute("msg", "프로필이 저장되었습니다");
			model.addAttribute("ret", "y");
			http.setAttribute("custom", cvo);
		}else {
			model.addAttribute("url", "profileEdit.do");
			model.addAttribute("msg", "프로필이 저장되지 않았습니다");
			model.addAttribute("ret", "n");
		}
		return "alert";
	}
	
}
