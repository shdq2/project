package com.kte.project;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.kte.project.VO.RoomVO;
import com.kte.project.VO.boundVO;
import com.kte.project.dao.SearchDAO;

@RestController
public class ajaxSearchController {
	@Autowired
	SearchDAO sDAO = null;
	
	boundVO vo = new boundVO();
	
	@RequestMapping(value="/boundsInMarker.do", method=RequestMethod.POST)
	public @ResponseBody List<RoomVO> BoundsInMarker(
			@RequestParam("ne_lat") double ne_lat, @RequestParam("ne_lng") double ne_lng,
			@RequestParam("sw_lat") double sw_lat, @RequestParam("sw_lng") double sw_lng,
			@RequestParam("active_tab") String active_tab, @RequestParam("day_type") String day_type, @RequestParam("page") int page) {
		
		vo.setNe_lat(ne_lat);
		vo.setNe_lng(ne_lng);
		vo.setSw_lat(sw_lat);
		vo.setSw_lng(sw_lng);	
		vo.setDay_type(day_type);
		vo.setActive_tab(active_tab);
		vo.setPage(page);
		
		List<RoomVO> list = null;
		
		try {
			list = sDAO.getMarker(vo);
		} catch(Exception e) {
			System.out.println("list is null");
		}
		if(list != null) {
			list.get(0).setRoom_count(sDAO.getCount(vo));
		}
		
		return list;
	}
	
	@RequestMapping(value="/moveSlider.do", method=RequestMethod.POST)
	public @ResponseBody List<RoomVO> moveSlider(
			@RequestParam("min_price") int min_price, @RequestParam("max_price") int max_price,
			@RequestParam("active_tab") String active_tab, @RequestParam("day_type") String day_type, @RequestParam("page") int page) {
		
		vo.setMin_price(min_price);
		vo.setMax_price(max_price);
		vo.setPage(page);
		
		List<RoomVO> list = null;
		
		try {
			list = sDAO.getMarker(vo);
		} catch(Exception e) {
			System.out.println("list is null");
		}
		
		if(list != null) {
			list.get(0).setRoom_count(sDAO.getCount(vo));
		}
		
		return list;
	}
	
	@RequestMapping(value="/changePage.do", method=RequestMethod.POST)
	public @ResponseBody List<RoomVO> changePage(@RequestParam("active_tab") String active_tab, @RequestParam("day_type") String day_type, @RequestParam("page") int page) {
		System.out.println(page);
		vo.setPage(page);
		List<RoomVO> list = sDAO.getMarker(vo);
		
		if(list != null) {
			list.get(0).setRoom_count(sDAO.getCount(vo));
		}
		
		return list;
	}
}
