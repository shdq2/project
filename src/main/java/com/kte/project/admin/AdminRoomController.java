package com.kte.project.admin;

import java.io.InputStream;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.IOUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
	
	@RequestMapping(value = "/admin/admin_room.do", method = RequestMethod.GET)
	public String home(Model model,HttpSession http,
			@RequestParam(value="id",defaultValue="")String id) {
		int count =0;
		if(id =="") {
			count = ardao.room_count();
		}else {
			RoomVO vo = new RoomVO();		
			vo.setTxt(id);
			vo.setState(5);
			count = ardao.room_search_count(vo);	
		}
		
		count = ((count-1)/10)+1;		
		model.addAttribute("count", count);		
		model.addAttribute("url_id", id);		
		
		return "admin_room";
	}
	
	@SuppressWarnings("finally")
	@RequestMapping(value="admin/admin_room_img.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> show_img(Model model,
			@RequestParam("id")String id,
			HttpServletRequest request,
			HttpSession http) {
		 ResponseEntity<byte[]> r_data = null;
		 HttpHeaders header = new HttpHeaders();
		 header.setContentType(MediaType.IMAGE_JPEG);
		byte[] imgs=null;
		try {
			RoomVO vo = ardao.room_img(id);
				imgs=vo.getRoom_img();
		} catch (Exception e) {
			InputStream is = request.getSession().getServletContext().getResourceAsStream("/resources/imgs/default.jpg");
			imgs = IOUtils.toByteArray(is);
		}finally {
			r_data = new ResponseEntity<byte[]>(imgs,header,HttpStatus.OK);
			return r_data;
		}
	}
}
