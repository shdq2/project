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
import com.kte.project.VO.ReservationVO;
import com.kte.project.VO.RoomVO;
import com.kte.project.dao.adminDAO;
import com.kte.project.dao.admin_wishDAO;
import com.kte.project.dao.adminmemberDAO;
import com.kte.project.dao.adminreservationDAO;
import com.kte.project.dao.adminroomDAO;
import com.kte.project.dao.visitDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminReserController {

	@Autowired
	private adminreservationDAO aredao = null;
	
	@RequestMapping(value = "/admin/admin_reser.do", method = RequestMethod.GET)
	public String home(Model model,HttpSession http) {
		List<ReservationVO> list = aredao.reservation_all(0);
		
		for(int i = 0;i<list.size();i++) {
			String host_id = list.get(i).getHost_id();
			String guest_id = list.get(i).getGuest_id();
			
			list.get(i).setHost_img_code(aredao.profile_img(host_id));
			list.get(i).setGuest_img_code(aredao.profile_img(guest_id));
			
		}
		List<ReservationVO> list2 = aredao.state_count();
		int tot = ((aredao.reser_count()-1)/10)+1;	
		
		model.addAttribute("list2", list2);
		model.addAttribute("list", list);
		model.addAttribute("tot", tot);
		return "admin_reservation";
	}
		
	@SuppressWarnings("finally")
	@RequestMapping(value="admin/admin_show_profile.do", method=RequestMethod.GET)
	public ResponseEntity<byte[]> show_img(Model model,
			@RequestParam("id")String id,
			HttpServletRequest request,
			HttpSession http) {
		 ResponseEntity<byte[]> r_data = null;
		 HttpHeaders header = new HttpHeaders();
		 header.setContentType(MediaType.IMAGE_JPEG);
		byte[] imgs=null;
		try {
			CustomVO vo = aredao.admin_show_profile(id);
				imgs=vo.getCustom_img();
		} catch (Exception e) {
			InputStream is = request.getSession().getServletContext().getResourceAsStream("/resources/imgs/user.png");
			imgs = IOUtils.toByteArray(is);
		}finally {
			r_data = new ResponseEntity<byte[]>(imgs,header,HttpStatus.OK);
			return r_data;
		}
	}
}
