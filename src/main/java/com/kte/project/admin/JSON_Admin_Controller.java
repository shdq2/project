package com.kte.project.admin;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
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
import com.kte.project.dao.adminreservationDAO;
import com.kte.project.dao.adminroomDAO;

@RestController
public class JSON_Admin_Controller {
	@Autowired
	private adminmemberDAO amdao=null; 
	@Autowired
	private admin_wishDAO wdao=null; 
	@Autowired
	private adminroomDAO ardao=null; 
	@Autowired
	private adminreservationDAO aredao = null;
	
	// json member ///////
	@RequestMapping(value = "/admin/Json_member_block.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
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
	
	@RequestMapping(value = "/admin/Json_member_room.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Map<String,Object> member_room(Model model,
			HttpSession http,HttpServletResponse response,
			@RequestParam("id")String id,
			@RequestParam("page")int page) {
		response.setHeader("Access-Control-Allow-Methods", "POST, GET, OPTIONS, DELETE");
		response.setHeader("Access-Control-Max-Age", "3600");
		response.setHeader("Access-Control-Allow-Headers", "x-requested-with");
		response.setHeader("Access-Control-Allow-Origin", "*");
		response.setContentType("application/json");
		response.setCharacterEncoding("UTF-8");

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
	
	@RequestMapping(value = "/admin/Json_member_travel.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
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
	
	///////// json reser ////////////
	@RequestMapping(value = "/admin/Json_update_state.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int update_state(Model model,	
			HttpSession http,
			@RequestParam("code")int code,
			@RequestParam("state")int state) {		
		
		ReservationVO vo = new ReservationVO();
		vo.setReser_code(state);
		vo.setReservation_code(code);
		int ret = aredao.update_state(vo);
		
		return ret;
	}
	
	@RequestMapping(value = "/admin/Json_select_reser.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody ReservationVO select_reser(Model model,	
			HttpSession http,
			@RequestParam("code")int code) {	
		ReservationVO vo = aredao.select_reser(code);
		
		return vo;
	}
	
	@RequestMapping(value = "/admin/Json_member_reser.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody CustomVO member(Model model,	
			HttpSession http,
			@RequestParam("id")String id) {
		CustomVO vo = aredao.admin_custom(id);
		
		try {
			int count = aredao.reser_member_count(id);
			vo.setReser_count(count);
		} catch (Exception e) {
			System.out.println(e.getMessage());
		}
		
		return vo;
	}
	////////////////
	
	//////////////////// json room///////////////
	
	@RequestMapping(value = "/admin/json_room.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<RoomVO> room(Model model,	
			HttpSession http,
			@RequestParam("page")int p) {		
		int page = (p-1)*10;
		List<RoomVO> list = ardao.allroomList(page);
		return list;
	}
	
	@RequestMapping(value = "/admin/json_room_state_change.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int room_state_change(Model model,	
			HttpSession http,
			@RequestParam("code")String code,
			@RequestParam("value")int value) {		
		RoomVO vo= new RoomVO();
		vo.setRoom_block(value);
		vo.setRoom_code(code);
		int ret = ardao.state_change(vo);
		return ret;
	}
	//////////////////////////
	
	// json wish /////////////
	@RequestMapping(value = "/admin/json_wish.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
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
