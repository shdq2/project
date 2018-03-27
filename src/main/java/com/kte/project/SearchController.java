package com.kte.project;

import java.text.DecimalFormat;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kte.project.VO.RoomVO;
import com.kte.project.dao.RoomDAO;

@Controller
public class SearchController {
	@Autowired
	RoomDAO rDAO = null;
	
	@RequestMapping(value="/roomSearch.do", method = RequestMethod.GET)
	public String roomSearch(Model model) {
		List<RoomVO> list = rDAO.selectRoomData();
		
		for(int i=0; i<list.size(); i++) {
			DecimalFormat df = new DecimalFormat("#,##0");
			
			int e = Integer.parseInt(list.get(i).getRoom_day());
			list.get(i).setRoom_day(df.format(e));
			
			e = Integer.parseInt(list.get(i).getRoom_month());
			list.get(i).setRoom_month(df.format(e));
		}
		
		model.addAttribute("list", list);
		
		return "room_search";
	}
}
