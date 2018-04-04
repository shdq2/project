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
import com.kte.project.VO.RoomVO;
import com.kte.project.dao.adminDAO;
import com.kte.project.dao.admin_wishDAO;
import com.kte.project.dao.adminmemberDAO;
import com.kte.project.dao.adminroomDAO;
import com.kte.project.dao.visitDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminRoomController {
	@Autowired
	private adminDAO adao = null; 
	@Autowired
	private adminmemberDAO amdao = null; 
	@Autowired
	private admin_wishDAO wdao = null;
	@Autowired
	private adminroomDAO ardao = null;
	
	@RequestMapping(value = "/admin_room.do", method = RequestMethod.GET)
	public String home(Model model,HttpSession http) {
		int count = ardao.room_count();
		count = ((count-1)/10)+1;
		model.addAttribute("count", count);
		List<RoomVO> list = ardao.allroomList(1);
		model.addAttribute("list",list);
		return "admin_room";
	}
}
