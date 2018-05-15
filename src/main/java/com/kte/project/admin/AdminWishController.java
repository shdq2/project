package com.kte.project.admin;

import java.text.DateFormat;
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
import com.kte.project.VO.WishVO;
import com.kte.project.VO.WishchkVO;
import com.kte.project.dao.adminDAO;
import com.kte.project.dao.admin_wishDAO;
import com.kte.project.dao.adminmemberDAO;

/**
 * Handles requests for the application home page.
 */
@Controller
public class AdminWishController {
	@Autowired
	private admin_wishDAO wdao = null;
	
	@RequestMapping(value = "/admin/admin_wish.do", method = RequestMethod.GET)
	public String home(Model model,HttpSession http,HttpServletRequest request) {
		if(request.getHeader("referer")==null) {
			return "redirect:admin.do";
		}else {
			List<WishVO> list = wdao.wish_list(0);
			model.addAttribute("wlist", list);
			int tot = ((wdao.wish_all()-1)/10)+1;
			model.addAttribute("tot", tot);
			int wcount = wdao.wish_count();
			http.setAttribute("_wcount", wcount);
			return "admin_wish";
		}
	}
	

	@RequestMapping(value = "/admin/admin_wish_detail.do", method = RequestMethod.GET)
	public String wish_detail(Model model,HttpSession http,
			@RequestParam("code")int code,HttpServletRequest request) {
		if(request.getHeader("referer")==null) {
			return "redirect:admin.do";
		}else {
		wdao.wish_update(code);
		WishVO vo = wdao.wish_One(code);
		int pre = wdao.wish_pre(code);
		int next=wdao.wish_next(code);
		model.addAttribute("vo", vo);
		model.addAttribute("pre", pre);
		model.addAttribute("next", next);
		
		String req= "";
		List<WishchkVO> list  = wdao.wish_require(code);
		int wcount = wdao.wish_count();
		http.setAttribute("_wcount", wcount);
		if(list.size() == 0)
			req = "없음";
		else
			for(int i=0;i<list.size();i++) {
				if(i<list.size()-1)
					req +=list.get(i).getWishc_title() + ", ";
				else
					req +=list.get(i).getWishc_title();
			}
			
		model.addAttribute("req", req);
		return "admin_wish_detail";
		}
	}
}
