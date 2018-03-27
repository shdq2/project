package com.kte.project.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kte.project.VO.CustomVO;
import com.kte.project.VO.ReservationVO;
import com.kte.project.VO.RoomVO;
import com.kte.project.VO.WishVO;
import com.kte.project.dao.adminDAO;
import com.kte.project.dao.admin_wishDAO;
import com.kte.project.dao.adminmemberDAO;
import com.kte.project.dao.adminroomDAO;

@RestController
public class JSON_Admin_Controller {
	@Autowired
	private adminmemberDAO amdao=null; 
	@Autowired
	private admin_wishDAO wdao=null; 
	@Autowired
	private adminroomDAO ardao=null; 
	
	// json member ///////
	@RequestMapping(value = "/Json_member_block.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int member_block(Model model,
			HttpSession http,
			@RequestParam("id")String id,
			@RequestParam("block")int block) {
		System.out.println("테스트 : " + id);
		System.out.println("test : " + block);
		CustomVO vo = new CustomVO();
		vo.setCustom_id(id);
		vo.setCustom_block(block);
		int ret = amdao.member_block(vo);
		return ret;
	}
	
	@RequestMapping(value = "/Json_member_room.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Map<String,Object> member_room(Model model,
			HttpSession http,
			@RequestParam("id")String id,
			@RequestParam("page")int page) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		int p = (page-1)*4;
		
		RoomVO vo = new RoomVO(); 
		
		vo.setCustom_id(id);
		vo.setPage(p);
		int total = ardao.total_room_count(id);
		int tot = ((total-1)/4)+1;
		List<RoomVO> list = ardao.roomList(vo);
		map.put("data", list);
		map.put("page", tot);
		return map;
	}
	
	@RequestMapping(value = "/Json_member_travel.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Map<String,Object> member_travel(Model model,
			HttpSession http,
			@RequestParam("id")String id,
			@RequestParam("page")int page) {
		
		Map<String,Object> map = new HashMap<String,Object>();
		int p = (page-1)*6;
		
		ReservationVO vo = new ReservationVO(); 
		
		vo.setCustom_id(id);
		vo.setPage(p);
		int total = amdao.reser_total(id);
		int tot = ((total-1)/6)+1;
		List<ReservationVO> list = amdao.reser_list(vo);
		map.put("data", list);
		map.put("page", tot);
		return map;
	}
	////////////////////////
	
	// json wish /////////////
	@RequestMapping(value = "/json_wish.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<WishVO> wish(Model model,	
			HttpSession http,
			@RequestParam("page")int p) {		
		int page = (p-1)*10;
		List<WishVO> list = wdao.wish_list(page);
		int wcount = wdao.wish_count();
		http.setAttribute("_wcount", wcount);
		return list;
	}
	////////////
}
