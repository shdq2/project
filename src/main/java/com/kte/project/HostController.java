package com.kte.project;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kte.project.VO.HostVO;
import com.kte.project.dao.HostDAO;

@Controller
public class HostController {
	
	@Autowired
	private HostDAO hDAO = null;
	
	@RequestMapping(value="/host_inout.do", method=RequestMethod.GET)
	public String hostcalendar(Model model) {
		
		HostVO vo = new HostVO();
		
		model.addAttribute("vo", vo);
		
		return "host_inout";
	}
	
	@RequestMapping(value="/host_price.do", method=RequestMethod.GET)
	public String hostprice(Model model) {
		
		HostVO vo = new HostVO();
		
		model.addAttribute("vo", vo);
		
		return "host_price";
	}
	
	@RequestMapping(value="/host_create.do", method=RequestMethod.GET)
	public String hostcreate(Model model) {
		
		HostVO vo = new HostVO();
		
		model.addAttribute("vo", vo);
		
		return "host_create";
	}
	
	@RequestMapping(value="/host_create.do", method=RequestMethod.POST)
	public String hostcreate() {
		
		HostVO vo = new HostVO();
		
		
		return "redirect:/host.do";
	}
	
	@RequestMapping(value="/host.do", method=RequestMethod.GET)
	public String hostname(Model model) {
		
		HostVO vo = new HostVO();
		
		/*if(vo.getName_title() != null || vo.getName_content() != null) {
			ret = 1;
		}
		else {
			ret = 0;
		}*/
		
		
		model.addAttribute("vo", vo);
		
		return "host_name";
	}
	
	@RequestMapping(value="/host.do", method=RequestMethod.POST)
	public String hostname(@ModelAttribute("vo") HostVO vo) {
		
		hDAO.insertHostName(vo);
		
		return "redirect:/host_name.do";
	}
	
	@RequestMapping(value="/host_basic.do", method=RequestMethod.GET)
	public String hostbasic(Model model) {
		
		HostVO vo = new HostVO();
		
		model.addAttribute("vo", vo);
		
		return "host_basic";
	}
	
	@RequestMapping(value="/host_location.do", method=RequestMethod.GET)
	public String hostlocation(Model model) {
		
		HostVO vo = new HostVO();
		
		model.addAttribute("vo", vo);
		
		return "host_location";
	}
	
	@RequestMapping(value="/host_amenity.do", method=RequestMethod.GET)
	public String hostamenity(Model model) {
		
		HostVO vo = new HostVO();
		String[] str = {"TV","케이블TV","에어콘","난방","부엌(개인)","부엌(공용)","인터넷","와이파이","전기포트","전자렌지","밥솥","수건","식기(그릇)","다리미","헤어드라이기","냉장고"};
		String[] str1 = {"욕조","세탁기(개인)","수영장","건조기","아침식사","무료 주차 포함","무료 헬스장","엘리베이터","초인종/인터폰","도어락","샴푸","취사","바비큐","대중교통","마당","세탁기(공용)","테라스","바다"};
		String[] str2 = {"가족/어린이 환영","애완동물 가능","애완/반려동물 키우고 있음","휠체어 사용 가능"};
		String[] str3 = {"화재감지기","구급 상자","안전 카드","소화기","실내흡연불가능"};
		model.addAttribute("str", str);
		model.addAttribute("str1", str1);
		model.addAttribute("str2", str2);
		model.addAttribute("str3", str3);
		model.addAttribute("vo", vo);
		
		return "host_amenity";
	}
	
	@RequestMapping(value="/host_imgs.do", method=RequestMethod.GET)
	public String hostimgs(Model model) {
		
		HostVO vo = new HostVO();
		
		model.addAttribute("vo", vo);
		
		return "host_imgs";
	}
}
