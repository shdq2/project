package com.kte.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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

/**
 * Handles requests for the application home page.
 */
@Controller
public class adminController {
	@Autowired
	private adminDAO adao = null; 
	
	@RequestMapping(value = "/admin.do", method = RequestMethod.GET)
	public String home(Model model,HttpSession http) {
		int ucount = adao.usercount();
		List<CustomVO> list = adao.AdminUserMain();
		http.setAttribute("_ucount", ucount);	
		model.addAttribute("clist", list);
		return "admin";
	}
	
	@RequestMapping(value = "/admin_member.do", method = RequestMethod.GET)
	public String member(Model model) {
		int ucount = adao.usercount();
		List<CustomVO> list = adao.AdminUserMain();
		model.addAttribute("ucount", ucount);
		model.addAttribute("clist", list);
		return "admin";
	}
	
}
