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
import com.kte.project.dao.adminDAO;
import com.kte.project.dao.visitDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	@Autowired
	private visitDAO vdao = null;
	@Autowired
	private adminDAO adao = null;
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model,HttpSession http) {
		CustomVO vo = (CustomVO)http.getAttribute("custom");
		if(vo == null) {
			String id = http.getId();
			http.setAttribute("custom_id", id);	
		}
		int ret = vdao.visit_chk((String)http.getAttribute("custom_id"));
		if(ret == 0) {
			return "redirect:visit.do";
		}else {
			return "home";
		}
		
	}
	
	@RequestMapping(value = "visit.do", method = RequestMethod.GET)
	public String visit(Locale locale, Model model,HttpSession http) {
		String url = (String)http.getAttribute("_url");
		CustomVO vo = (CustomVO)http.getAttribute("custom");
		String ret1=null;
		int ret = 0;
		if(vo != null) {
			ret = vdao.visit_chk(vo.getCustom_id());
			if(ret == 0) {
				vdao.visit_insert(vo.getCustom_id());
			}
			ret1 = ret+"";
			http.setAttribute("ret1", ret1);
			
			model.addAttribute("url", url);
			if(url == null) {
				model.addAttribute("url", "/project/");
			}
			
			model.addAttribute("msg", "환영합니다");
			model.addAttribute("ret", "y");
			
			return "alert";	
		}else {
			String custom_id = (String)http.getAttribute("custom_id");
			if(custom_id == null) {
				custom_id = (String)http.getId();
			}
			ret = vdao.visit_chk(custom_id);
			if(ret == 0) {
				vdao.visit_insert(custom_id);
			}
			ret1 = ret+"";
			http.setAttribute("ret1", ret1);
			return "redirect:/";
		}
		
		
	}
	
	@RequestMapping(value = "block.do", method = RequestMethod.GET)
	public String block(Model model,HttpSession http) {
		String id= (String)http.getAttribute("custom_id");
		System.out.println("custom_id : " + id);
		int block = adao.block_chk(id);
		http.setAttribute("block", block+"");
		return "redirect:/";
	}
}
