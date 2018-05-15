package com.kte.project;

import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kte.project.VO.CustomVO;
import com.kte.project.VO.ReservationVO;
import com.kte.project.VO.RoomVO;
import com.kte.project.VO.SortableVO;
import com.kte.project.VO.paymentVO;
import com.kte.project.dao.CustomDAO;
import com.kte.project.dao.RegisterDAO;
import com.kte.project.dao.adminreservationDAO;
import com.kte.project.dao.guestDAO;
import com.kte.project.dao.paymentDAO;

@RestController
public class JsonController {
	@Autowired
	private RegisterDAO rdao = null;
	@Autowired
	private CustomDAO cdao = null;
	@Autowired
	private guestDAO gdao = null;
	@Autowired
	private paymentDAO pdao = null;
	@Autowired
	private adminreservationDAO aredao=null;
	
	@RequestMapping(value = "Json_reser_payment.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Map<String,Object> payment(Model model,
		HttpSession http,
		@RequestParam(value="payment_type")int payment_type,
		@RequestParam(value="state")int state,
		@RequestParam(value="code")int code,
		@RequestParam(value = "name",defaultValue="")String name,
		@RequestParam(value = "card",defaultValue="")String card,
		@RequestParam(value = "card_type",defaultValue="0")int card_type,
		@RequestParam(value = "monthly",defaultValue="0")int monthly,
		@RequestParam(value = "money",defaultValue="0")int money) {		

		Map<String,Object> map = new HashMap<String,Object>();
		ReservationVO vo = new ReservationVO();
		
		paymentVO pvo =new paymentVO();
		pvo.setPayment_type(payment_type); // 결제방식   =  계좌이체/카드결제
		pvo.setReservation_code(code); // 예약번호
		
		pvo.setPayment_card_type(card_type); // 카드결제 방식 = 안전결제, 일반결제
		pvo.setPayment_card(card); // 카드이름
		pvo.setPayment_money(money); // 예약금
		pvo.setPayment_monthly(monthly); // 할부
		pvo.setPayment_name(name); // 계좌이체 입금자명
		
		pdao.payment(pvo);
		pvo = pdao.select_payment(code);
		map.put("pvo", pvo);
		vo.setReser_code(state);
		vo.setReservation_code(code);
		int ret = aredao.update_state(vo);
		map.put("ret", ret);
		
		return map;
	}
	
	@RequestMapping(value = "Json_reser_accept.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Map<String,Object> accept(Model model,
		HttpSession http,
		@RequestParam(value="state")int state,
		@RequestParam(value="code")int code) {		

		Map<String,Object> map = new HashMap<String,Object>();
		ReservationVO vo = new ReservationVO();		
		ReservationVO reser = gdao.select_guest_reser(code);
		CustomVO host = gdao.host_info(reser.getHost_id());
		CustomVO guestvo = gdao.host_info(reser.getGuest_id());
		RoomVO mvo = gdao.mapSearch(reser.getRoom_code());
		vo.setReser_code(state);
		vo.setReservation_code(code);
		int ret = aredao.update_state(vo);
		
		map.put("ret", ret);
		map.put("reser", reser);
		map.put("host", host);
		map.put("gvo", guestvo);
		map.put("map", mvo);
		
		return map;
	}
	
	
	@RequestMapping(value = "/Json_guest_reser.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<ReservationVO> select_reser_guest(Model model,
		HttpSession http,
		@RequestParam("state")int state) {		
		List<ReservationVO> list = new ArrayList<ReservationVO>();
		String id = (String)http.getAttribute("custom_id");
		if(state == -1) {
			list = gdao.guest_reser_list(id);
		}else {
			ReservationVO vo = new ReservationVO();
			vo.setCustom_id(id);
			vo.setState_count(state);
			list = gdao.select_guest_reser_list(vo);
		}
		return list;
	}
	
	@RequestMapping(value = "/Json_host_reser.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<ReservationVO> select_reser_host(Model model,
		HttpSession http,
		@RequestParam("state")int state) {		
		List<ReservationVO> list = new ArrayList<ReservationVO>();
		String id = (String)http.getAttribute("custom_id");
		if(state == -1) {
			list = gdao.host_reser_list(id);
		}else {
			ReservationVO vo = new ReservationVO();
			vo.setCustom_id(id);
			vo.setState_count(state);
			list = gdao.select_host_reser_list(vo);
		}
		return list;
	}
	
	@RequestMapping(value = "/Json_id_check.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Boolean id_check(Model model,
		HttpSession http,
		@RequestParam("custom_id")String id) {		
		int ret = rdao.id_check(id);
		if(ret == 1) {
			return false;
		}else {
			return true;
		}
	}
	
	@RequestMapping(value = "/Json_upload_img.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<CustomVO> Json_upload_img(Model model,
		HttpSession http,
		MultipartHttpServletRequest request) {
		try {
		String custom_id = (String)http.getAttribute("custom_id");
		Map<String, MultipartFile> map = request.getFileMap();
		CustomVO vo = new CustomVO();
		vo.setCustom_id(custom_id);
		MultipartFile tmp = map.get("upload_img");
		
			if(tmp != null && !tmp.getOriginalFilename().equals("")) {
				vo.setCustom_img(tmp.getBytes());
			}
			List<CustomVO> list = cdao.upload_profile(vo);
			
			return list;
		}catch (Exception e) {
			System.out.println(e.getMessage());
			return null;
		}
	}
	
	@RequestMapping(value = "/Json_delete_profile.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<CustomVO> Json_delete_profile(Model model,
			@RequestParam("code")int code,
		HttpSession http) {
		String id = (String) http.getAttribute("custom_id");
		CustomVO vo = new CustomVO();
		vo.setImg_code(code);
		vo.setCustom_id(id);
		List<CustomVO> list = cdao.delete_profile(vo);
		
		return list;
	}

	@RequestMapping(value = "/Json_sortable.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody List<CustomVO> Json_sortable(Model model,
			@RequestParam("val2")List<String> val2,
		HttpSession http) {
		String id = (String) http.getAttribute("custom_id");
		List<CustomVO> ilist = cdao.select_profile(id);
		String[] v2 = val2.get(0).split("/");
		
		for(int i=0;i<v2.length;i++) {
			
			int idx = 0;
			for(int j= 0; j<v2.length;j++) {
				if(ilist.get(j).getImg_code() == Integer.parseInt(v2[i])) {
					idx = j;
					break;
				}
			}
			
			SortableVO vo = new SortableVO();
			vo.setIdx1(ilist.get(i).getImg_code());
			vo.setImg1(ilist.get(idx).getCustom_img());
			cdao.profile_sortable(vo);
		}
		List<CustomVO> list = cdao.select_profile(id);		
		return list;
	}
	
	@RequestMapping(value = "/Json_delete_phone.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int Json_delete_phone(Model model,
		HttpSession http) {
		
		String id = (String) http.getAttribute("custom_id");
		int ret = cdao.delete_phone(id);
		return ret;
	}
	
	
	@RequestMapping(value = "/Json_guest_hope_remove.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody Map<String,Object> Json_guest_hope_remove(
			Model model,
			@RequestParam("code")String code,
			HttpSession http) {		
			Map<String,Object> map = new HashMap<String, Object>();
			CustomVO id = (CustomVO)http.getAttribute("custom");
			RoomVO vo = new RoomVO();
			vo.setCustom_id(id.getCustom_id());
			vo.setRoom_code(code);
			
			gdao.like_remove(vo);
			
			String like = gdao.custom_like(id.getCustom_id());
			String[] array = like.split(";");
			List<RoomVO> list = gdao.hope_list(array);
			map.put("size", list.size());
			map.put("list", list);
			return map;
	}
	@RequestMapping(value = "/Json_phone_update.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int edit_phone(Model model,
		HttpSession http,@RequestParam("custom_phone")String phone) {
		CustomVO vo = new CustomVO();		
		String id = (String) http.getAttribute("custom_id");
		vo.setCustom_phone(phone);
		vo.setCustom_id(id);
		int ret = cdao.phone_edit(vo);
		return ret;
	}
}
