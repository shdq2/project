package com.kte.project;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kte.project.VO.WishVO;
import com.kte.project.VO.WishchkVO;
import com.kte.project.dao.MainDAO;


@Controller
public class MainController {
	
	@Autowired
	private MainDAO mDAO = null;
	
	@RequestMapping(value="/main.do", method=RequestMethod.POST)
	public String main(@ModelAttribute("vo") WishVO vo,
					   @RequestParam("str[]") String[] chk) {
		
		System.out.println(vo.getWish_code());
		System.out.println(vo.getWish_start());
		System.out.println(vo.getWish_number());
		
		int no = mDAO.selectLastWishcNo();
		int i = 0;
		List<WishchkVO> list = new ArrayList<WishchkVO>();
		for(String tmp : chk) {
			i++;
			WishchkVO vo1 = new WishchkVO();
			vo1.setWish_code(vo.getWish_code());
			vo1.setWishc_title(tmp);
			vo1.setWishc_no(no+i);
			System.out.println(tmp);
			list.add(vo1);

		}
		
		vo.setList(list);
		
		mDAO.insertWish(vo);
		
		return "redirect:main.do";
	}
	
	@RequestMapping(value="/main.do", method=RequestMethod.GET)
	public String main(Model model) {
		WishVO vo = new WishVO();
		String[] str = {"원룸", "1.5룸", "투룸(방1+거실1)","투룸(방2개)","쓰리룸이상", "복층"};
		int ret = mDAO.selectLastWishcode();
		vo.setWish_code(ret+1);
		model.addAttribute("str",str);
		model.addAttribute("vo",vo);
		return "main";
	}
}
