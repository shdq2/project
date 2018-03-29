package com.kte.project;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kte.project.VO.CustomVO;
import com.kte.project.dao.CustomDAO;
import com.kte.project.dao.RegisterDAO;

@RestController
public class JsonController {
	@Autowired
	private RegisterDAO rdao = null;
	@Autowired
	private CustomDAO cdao = null;
	
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
	
	@RequestMapping(value = "/Json_delete_phone.do", produces="application/json", method = {RequestMethod.GET,RequestMethod.POST})
	public @ResponseBody int delete_phone(Model model,
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
