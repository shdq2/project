package com.kte.project;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.kte.project.VO.HostVO;
import com.kte.project.VO.HostchkVO;
import com.kte.project.dao.HostDAO;

@Controller
public class HostController {
	
	@Autowired
	private HostDAO hDAO = null;
	
	@RequestMapping(value="/host_create.do", method=RequestMethod.GET)
	public String hostcreate(Model model, HttpSession httpsession) {
		
		System.out.println(httpsession.getAttribute("room_code"));
		httpsession.removeAttribute("room_code"); // 세션에 있는 것 삭제

		HostVO vo = new HostVO();
		
		int room_code = hDAO.selectRoomCode();
		
		vo.setRoom_code(room_code+1);
		
		model.addAttribute("vo", vo);
		
		return "host_create";
	}
	
	@RequestMapping(value="/host_create.do", method=RequestMethod.POST)
	public String hostcreate(@ModelAttribute("vo") HostVO vo,
							 HttpSession httpsession) {
		
		int room_code = vo.getRoom_code();
		httpsession.setAttribute("room_code", room_code);
		System.out.println(httpsession.getAttribute("room_code"));
		/*String a = Integer.toString(vo.getRoom_code());
		vo.setRoom_code1(a);*/
		hDAO.insertHostCreate(vo);
		
		return "redirect:/host_name.do";
	}
	
	@RequestMapping(value="/host_name.do", method=RequestMethod.GET)
	public String hostname(Model model, HttpSession httpsession) {
		
		int room_code = (Integer) httpsession.getAttribute("room_code");
		
		if(room_code == 0) {
			return "redirect:/host_create.do";
		}else {
			HostVO vo = new HostVO();
			vo.setRoom_code(room_code);
			
			model.addAttribute("vo", vo);
			
			return "host_name";
		}
	}
	
	@RequestMapping(value="/host_name.do", method=RequestMethod.POST)
	public String hostname(@ModelAttribute("vo") HostVO vo) {
		
		hDAO.updateHostName(vo);
		
		return "redirect:/host_basic.do";
	}
	
	@RequestMapping(value="/host_basic.do", method=RequestMethod.GET)
	public String hostbasic(Model model, HttpSession httpsession) {
		
		int room_code = (Integer) httpsession.getAttribute("room_code");
		
		HostVO vo = hDAO.selectHostBasic(room_code);
		String[] str = {"원룸","1.5룸","투룸(방1개 + 거실1)","투룸(방2개)","쓰리룸이상","복층","호텔","리조트"};
		String[] str1 = {"빌라","원룸","펜션","민박","아파트","오피스텔","레지던스","쉐어하우스","단독주택(독채)","단독주택(일부 사용)","게스트하우스(개인실)","게스트하우스(도미토리)"};
		
		model.addAttribute("str",str);
		model.addAttribute("str1",str1);
		model.addAttribute("vo", vo);
		
		return "host_basic";
	}
	
	@RequestMapping(value="/host_basic.do", method=RequestMethod.POST)
	public String hostbasic(@ModelAttribute("vo") HostVO vo) {
		
		
		hDAO.updateHostBasic(vo);
		
		return "redirect:/host_location.do";
	}
	
	@RequestMapping(value="/host_location.do", method=RequestMethod.GET)
	public String hostlocation(Model model) {
		
		HostVO vo = new HostVO();
		
		model.addAttribute("vo", vo);
		
		return "host_location";
	}
	
	@RequestMapping(value="/host_amenity.do", method=RequestMethod.GET)
	public String hostamenity(Model model, HttpSession httpsession) {
		try {
			int room_code = (Integer) httpsession.getAttribute("room_code");
			System.out.println(room_code);
			
			String[] str = {"TV","케이블TV","에어콘","난방","부엌(개인)","부엌(공용)","인터넷","와이파이","전기포트","전자렌지","밥솥","수건","식기(그릇)","다리미","헤어드라이기","냉장고"};
			String[] str1 = {"욕조","세탁기(개인)","수영장","건조기","아침식사","무료 주차 포함","무료 헬스장","엘리베이터","초인종/인터폰","도어락","샴푸","취사","바비큐","대중교통","마당","세탁기(공용)","테라스","바다"};
			String[] str2 = {"가족/어린이 환영","애완동물 가능","애완/반려동물 키우고 있음","휠체어 사용 가능"};
			String[] str3 = {"화재감지기","구급 상자","안전 카드","소화기","실내흡연불가능"};
			HostVO vo = new HostVO();
			HostchkVO vo1 = hDAO.selectRoomAmenity(room_code);
			
			String a = vo1.getRoom_option();
			String b = vo1.getRo_plus();
			String c = vo1.getRo_special();
			String d = vo1.getRo_security();
			System.out.println(a);
			System.out.println(b);
			System.out.println(c);
			System.out.println(d);
			
			String[] room_option = a.split(";");
			String[] room_option1 = b.split(";");
			String[] room_option2 = c.split(";");
			String[] room_option3 = d.split(";");
			
			for(String tmp : room_option) {
				System.out.println(tmp);
			}
			model.addAttribute("room_option", room_option);
			model.addAttribute("room_option1", room_option1);
			model.addAttribute("room_option2", room_option2);
			model.addAttribute("room_option3", room_option3);
			//room_option = {"TV","dd"....}
			 
			model.addAttribute("str", str);
			model.addAttribute("str1", str1);
			model.addAttribute("str2", str2);
			model.addAttribute("str3", str3);
			model.addAttribute("vo", vo);
			
			return "host_amenity";
		} catch (Exception e) {
			return "host_amenity";
		}
	}
	
	@RequestMapping(value="/host_amenity.do", method=RequestMethod.POST)
	public String hostamenity(@ModelAttribute("vo") HostVO vo,
							  @RequestParam("str[]") String[] chk,
							  @RequestParam("str1[]") String[] chk1,
							  @RequestParam("str2[]") String[] chk2,
							  @RequestParam("str3[]") String[] chk3,
							  HttpSession httpsession) {
		
		int room_code = (Integer) httpsession.getAttribute("room_code");
		int room_code1 = hDAO.selectOptionRoomCode();
		String str = "";
		String str1 = "";
		String str2 = "";
		String str3 = "";
		
		HostchkVO vo1 = new HostchkVO();
		for(String tmp : chk) {
			str += tmp+ ";";
		}
		vo1.setRoom_option(str);
		
		for(String tmp : chk1) {
			str1 += tmp+ ";";
		}
		vo1.setRo_plus(str1);
		
		for(String tmp : chk2) {
			str2 += tmp+ ";";
		}
		vo1.setRo_special(str2);
		
		for(String tmp : chk3) {
			str3 += tmp+ ";";
		}
		vo1.setRo_security(str3);
		
		System.out.println(vo1.getRo_security()+"1");
		System.out.println(vo1.getRo_special()+"2");
		
		vo1.setRoom_code(room_code);
		
		if(room_code == room_code1) {
			hDAO.updateRoomAmenity(vo1);
		}else {
			hDAO.insertRoomAmenity(vo1);
		}
		
		return "redirect:/host_imgs.do";
	}
	
	@RequestMapping(value="/host_imgs.do", method=RequestMethod.GET)
	public String hostimgs(Model model,HttpSession httpsession) {
		
		int room_img_code = hDAO.selectLastRoomImgCode();
		
		System.out.println(httpsession.getAttribute("room_code"));
		
		HostVO vo = new HostVO();
		vo.setRoom_img_code(room_img_code+1);
		
		int room_code = (Integer) httpsession.getAttribute("room_code");
		
		List<HostVO> list = hDAO.selectRoomImgList(room_code);
		
		model.addAttribute("list", list);
		model.addAttribute("vo", vo);
		
		return "host_imgs";
	}
	
	@RequestMapping(value = "/host_imgs_img.do", method = RequestMethod.GET)
	   public ResponseEntity<byte[]> selectEventImg(@RequestParam("room_img_code") int room_img_code){
	     
	      HostVO vo = hDAO.selectRoomImg(room_img_code);
	      
	      byte[] roomImg = vo.getRoom_img();
	      
	      try {
	         final HttpHeaders headers = new HttpHeaders();
	         headers.setContentType(MediaType.IMAGE_JPEG);
	         
	         return new ResponseEntity<byte[]>(roomImg, headers, HttpStatus.OK);
	         
	      } catch (Exception e) {
	         System.out.println(e.getMessage());
	         return null;
	      }
	   }
	   
	@RequestMapping(value="/host_imgs.do", method=RequestMethod.POST)
	public String hostimgs(MultipartHttpServletRequest request,
						   HttpSession httpsession,
						   @ModelAttribute("vo") HostVO vo) {
		
		try {
			int room_code = (Integer) httpsession.getAttribute("room_code");
			System.out.println("ROOM:"+ room_code);
			
			vo.setRoom_code(room_code);
			
			MultipartFile file = request.getFile("img1");
			
			if(file != null && !file.getOriginalFilename().equals("")) {
				vo.setRoom_img(file.getBytes());
			}
			
			System.out.println(vo.getRoom_img_code());
			
			hDAO.insertHostImg(vo);
			
			return "redirect:host_imgs.do";
			
		} catch (Exception e) {
			System.out.println("bb");
			return "redirect:host_imgs.do";
		}
	}
	
	@RequestMapping(value="/host_img_delete.do", method=RequestMethod.GET)
	public String hostimgdelete(@RequestParam("room_img_code") int room_img_code) {
		hDAO.deleteRoomImg(room_img_code);
		
		return "redirect:host_imgs.do";
	}
	
	@RequestMapping(value="/host_price.do", method=RequestMethod.GET)
	public String hostprice(Model model, HttpSession httpsession) {
		
		int room_code = (Integer)httpsession.getAttribute("room_code");
		HostVO vo = hDAO.selectHostPrice(room_code);
		
		model.addAttribute("vo", vo);
		
		return "host_price";
	}
	
	@RequestMapping(value="/host_price1.do", method=RequestMethod.POST)
	public String hostprice1(@ModelAttribute("HostVO") HostVO vo, HttpSession httpsession,
							@RequestParam("room_price_show") String room_price_show) {
		
		int room_code = (Integer)httpsession.getAttribute("room_code");

		vo.setRoom_code(room_code);
		vo.setRoom_price_show(room_price_show);
		
		hDAO.updateHostPrice_MinMax(vo);
		
		return "redirect:host_price.do";
	}
	
	@RequestMapping(value="/host_price2.do", method=RequestMethod.POST)
	public String hostprice2(@ModelAttribute("HostVO") HostVO vo, HttpSession httpsession,
							 @RequestParam("room_plus_price_apply") String room_plus_price_apply) {
		
		int room_code = (Integer)httpsession.getAttribute("room_code");

		vo.setRoom_code(room_code);
		vo.setRoom_plus_price_apply(room_plus_price_apply);
		
		hDAO.updateHostPrice_Basic(vo);
		
		return "redirect:host_price.do";
	}
	
	
	@RequestMapping(value="/host_inout.do", method=RequestMethod.GET)
	public String hostcalendar(Model model, HttpSession httpsession) {
		
		int room_code = (Integer)httpsession.getAttribute("room_code");
		System.out.println(room_code);
		
		HostVO vo = new HostVO();
		vo.setRoom_code(room_code);
		System.out.println(vo.getRoom_code()+"!");
		
		HostVO vo1 = hDAO.selectRoomInOut(room_code);
		
		System.out.println(vo1.getRoom_in());
		if(vo.getRoom_in() == null) {
			if(vo.getRoom_out() == null) {
				vo.setRoom_out("09:00:00");
			}else {
				
			};
			vo.setRoom_in("09:00:00");
		}else{
			if(vo.getRoom_out() == null) {
				vo.setRoom_out("09:00:00");
			}else {
				
			};
		};
		
		
		System.out.println();
		
		String[] str = {"09:00:00","10:00:00","11:00:00","12:00:00","13:00:00","14:00:00","15:00:00","16:00:00",
						"17:00:00",	"18:00:00","19:00:00","20:00:00","21:00:00","22:00:00","23:00:00","00:00:00"};
		
		model.addAttribute("str",str);
		model.addAttribute("vo", vo);
		
		return "host_inout";
	}
	
	@RequestMapping(value="/host_inout.do", method=RequestMethod.POST)
	public String hostcalendar(@ModelAttribute("vo") HostVO vo, HttpSession httpsession) {
		
		int room_code = (Integer) httpsession.getAttribute("room_code");
		
		vo.setRoom_code(room_code);
		
		hDAO.updateRoomInOut(vo);
		
		return "redirect:host_inout.do";
	}
	
}
