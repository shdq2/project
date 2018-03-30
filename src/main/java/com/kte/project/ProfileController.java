package com.kte.project;

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
import com.kte.project.dao.CustomDAO;

@Controller
public class ProfileController {
	@Autowired
	private CustomDAO cdao = null;
	
	@RequestMapping(value="/profile.do", method = RequestMethod.GET)
	public String profile(HttpSession http,Model model) {
		CustomVO vo =(CustomVO)http.getAttribute("custom");
		
		if(vo == null) {
			return "redirect:login.do";
		}
		
		CustomVO cvo = cdao.selectmember(vo.getCustom_id());
		model.addAttribute("cvo", cvo);
		
		return "profile_view";
	}

	@RequestMapping(value="/certification.do", method = RequestMethod.GET)
	public String certification(HttpSession http,Model model) {
		CustomVO vo =(CustomVO)http.getAttribute("custom");
		
		if(vo == null) {
			return "redirect:login.do";
		}
		
		CustomVO cvo = cdao.selectmember(vo.getCustom_id());
		model.addAttribute("cvo", cvo);
		
		return "certification";
	}
	
	@RequestMapping(value="/picture.do", method = RequestMethod.GET)
	public String picture(HttpSession http,Model model) {
		CustomVO vo =(CustomVO)http.getAttribute("custom");
		
		if(vo == null) {
			return "redirect:login.do";
		}
		
		List<CustomVO> list = cdao.select_profile(vo.getCustom_id());
		model.addAttribute("list", list);
		
		return "picture";
	}
	
	@SuppressWarnings("finally")
	@RequestMapping(value="show_img.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> show_img(Model model,
			@RequestParam("code")int code,
			HttpServletRequest request,
			HttpSession http) {
		 ResponseEntity<byte[]> r_data = null;
		 HttpHeaders header = new HttpHeaders();
		 header.setContentType(MediaType.IMAGE_JPEG);
		byte[] imgs=null;
		try {
			 
			 CustomVO vo = cdao.show_profile(code);
			 imgs=vo.getCustom_img();
			 r_data = new ResponseEntity<byte[]>(imgs,header,HttpStatus.OK);
			 
			return r_data;
		} catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
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
