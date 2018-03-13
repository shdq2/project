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
		
		int today = adao.today();
		int yesterday= adao.yesterday();
		int ret = today-yesterday;
		http.setAttribute("_ucount", ucount);	
		model.addAttribute("clist", list);
		model.addAttribute("ret", ret);
		return "admin";
	}
	
	@RequestMapping(value = "/admin_member.do", method = RequestMethod.GET)
	public String member(Model model) {
		List<CustomVO> list = adao.AdminUserMain();
		for(int i=0;i<list.size();i++) {
			list.get(i).setRoom_count(adao.room_count(list.get(i).getCustom_id()));
		}
		model.addAttribute("list", list);
		return "admin_member";
	}
	
}
