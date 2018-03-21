package com.kte.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kte.project.VO.CustomVO;
import com.kte.project.dao.visitDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private visitDAO vdao = null;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpSession http) {
		CustomVO vo = (CustomVO)http.getAttribute("custom");
		if(vo == null) {
			String id = http.getId();
			http.setAttribute("id", id);	
		}
		int ret = vdao.visit_chk((String)http.getAttribute("id"));
		if(ret == 0) {
			return "redirect:visit.do";
		}else {
			return "home";
		}
		
	}
	
	@RequestMapping(value = "visit.do", method = RequestMethod.GET)
	public String visit(Locale locale, Model model,HttpSession http) {
		CustomVO vo = (CustomVO)http.getAttribute("custom");
		String ret1=null;
		int ret = 0;
		if(vo != null) {
			ret = vdao.visit_chk(vo.getCustom_id());
			if(ret == 0) {
				vdao.visit_insert(vo.getCustom_id());
			}
			
		}else {
			ret = vdao.visit_chk((String)http.getAttribute("id"));
			if(ret == 0) {
				vdao.visit_insert((String)http.getAttribute("id"));
			}
		}
		ret1 = ret+"";
		System.out.println("ret : "+ ret1);
		http.setAttribute("ret1", ret1);
		return "redirect:/";
	}
}
