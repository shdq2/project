package com.kte.project;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kte.project.VO.CustomVO;
import com.kte.project.dao.adminDAO;
import com.kte.project.dao.adminmemberDAO;

@RestController
public class JSON_Admin_member_Controller {
	@Autowired
	private adminmemberDAO amdao=null; 
	
	@RequestMapping(value = "/Json_member_block.do", method = RequestMethod.GET)
	public @ResponseBody int member_block(Model model,
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
}
