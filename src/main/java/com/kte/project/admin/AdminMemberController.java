package com.kte.project.admin;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

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
import com.kte.project.VO.ReservationVO;
import com.kte.project.VO.RoomVO;
import com.kte.project.dao.adminDAO;
import com.kte.project.dao.adminmemberDAO;
import com.kte.project.dao.adminroomDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminMemberController {
	@Autowired
	private adminmemberDAO amdao = null; 
	@Autowired
	private adminroomDAO ardao = null;
	@Autowired
	private adminDAO adao = null;
	@RequestMapping(value = "/admin/admin_member.do", method = RequestMethod.GET)
	public String member(Model model,HttpServletRequest request) {
		if(request.getHeader("referer")==null) {
			return "redirect:admin.do";
		}else {
			List<CustomVO> list = amdao.AdminUserMain(0);
			for(int i=0;i<list.size();i++) {
				list.get(i).setRoom_count(amdao.room_count(list.get(i).getCustom_id()));			
			}
			int count = adao.usercount();
			int tot = ((count-1)/10)+1;
			model.addAttribute("list", list);
			model.addAttribute("tot", tot);
			return "admin_member";	
		}
		
	}
	
	@RequestMapping(value = "/admin/admin_member_detail.do", method = RequestMethod.GET)
	public String admin_member_detail(Model model,HttpServletRequest request,
			@RequestParam("id")String id) {
		if(request.getHeader("referer")==null) {
			return "redirect:admin.do";
		}else {
		CustomVO vo = amdao.admin_member_select(id);
		int count = ardao.total_room_count(id);
		model.addAttribute("vo", vo);
		RoomVO rvo = new RoomVO();
		rvo.setCustom_id(id);
		rvo.setPage(0);
		List<RoomVO> list = ardao.roomList(rvo);
		for(int i=0;i<list.size();i++) {
			int num = count - i;			
			list.get(i).setRoom_count(num);
		}
		model.addAttribute("list", list);
		
		
		model.addAttribute("count", count);
		
		ReservationVO revo = new ReservationVO();
		revo.setCustom_id(id);
		revo.setPage(0);		
		
		List<ReservationVO> rlist = amdao.reser_list(revo);
		model.addAttribute("rlist", rlist);
		
		int rcount=rlist.size();
		for(int i=0;i<rlist.size();i++) {
			int num = rcount - i;			
			rlist.get(i).setReser_count(num);
		}
		model.addAttribute("rcount",rcount);
		
		return "admin_member_detail";
		}
	}
}
