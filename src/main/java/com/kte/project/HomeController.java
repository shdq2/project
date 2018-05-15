package com.kte.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
			vdao.visit_insert(id);
		}
		
		http.setAttribute("chk", "1");
		String url = (String)http.getAttribute("_path");
		if(url != null)
			return "redirect:"+url;
		else
			return "redirect:main.do";
	}
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String main(Locale locale, Model model,HttpSession http) {
		if((String)http.getAttribute("chk") == null) {
			return "redirect:/";
		}else {			
			CustomVO vo = (CustomVO)http.getAttribute("custom");
			return "home";	
		}
	}
	@RequestMapping(value = "block.do", method = RequestMethod.GET)
	public String block(Model model,HttpSession http) {
		String id= (String)http.getAttribute("custom_id");
		int block = adao.block_chk(id);
		http.setAttribute("block", block+"");
		if(block != 999)
			return "redirect:/";
		else
			return "redirect:admin/admin.do";
	}
}
