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
import org.springframework.web.bind.annotation.RequestParam;

import com.kte.project.VO.CustomVO;
import com.kte.project.dao.adminDAO;
import com.kte.project.dao.adminmemberDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminMemberController {
	@Autowired
	private adminmemberDAO amdao = null; 
	
	@RequestMapping(value = "/admin_member.do", method = RequestMethod.GET)
	public String member(Model model) {
		List<CustomVO> list = amdao.AdminUserMain();
		for(int i=0;i<list.size();i++) {
			list.get(i).setRoom_count(amdao.room_count(list.get(i).getCustom_id()));
		}
		model.addAttribute("list", list);
		return "admin_member";
	}
	
	@RequestMapping(value = "/member_room_list.do", method = RequestMethod.GET)
	public String room_list(Model model,@RequestParam("id")String id) {
		
		model.addAttribute("id", id);
		return "member_room_list";
	}
}
