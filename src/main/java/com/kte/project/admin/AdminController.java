package com.kte.project.admin;

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
import com.kte.project.dao.admin_wishDAO;
import com.kte.project.dao.adminmemberDAO;
import com.kte.project.dao.adminroomDAO;
import com.kte.project.dao.visitDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminController {
	@Autowired
	private adminDAO adao = null; 
	@Autowired
	private adminmemberDAO amdao = null; 
	@Autowired
	private admin_wishDAO wdao = null;
	@Autowired
	private adminroomDAO ardao = null;
	@Autowired
	private visitDAO vdao = null;
	
	@RequestMapping(value = "/admin.do", method = RequestMethod.GET)
	public String home(Model model,HttpSession http) {
		
		List<CustomVO> list = amdao.AdminUserMain();
		model.addAttribute("clist", list);
		
		int ucount = adao.usercount();
		http.setAttribute("_ucount", ucount);
		
		int today = adao.today();
		int yesterday= adao.yesterday();
		int ret = today-yesterday;
		model.addAttribute("ret", ret);
		
		int rcount = ardao.room_count();
		http.setAttribute("_rcount", rcount);
		
		int wcount = wdao.wish_count();
		http.setAttribute("_wcount", wcount);	
		model.addAttribute("wcount", wcount);
		
		int today_visit = vdao.today_visit();
		int month_visit = vdao.month_visit();
		model.addAttribute("vtoday", today_visit);
		model.addAttribute("vmonth", month_visit);
		return "admin";
	}
}
