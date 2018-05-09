package com.kte.project;

import java.util.ArrayList;
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
import com.kte.project.VO.SortableVO;
import com.kte.project.dao.CustomDAO;
import com.kte.project.dao.RegisterDAO;
import com.kte.project.dao.guestDAO;

@RestController
public class JsonController {
	@Autowired
	private RegisterDAO rdao = null;
	@Autowired
	private CustomDAO cdao = null;
	@Autowired
	private guestDAO gdao = null;
	
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
