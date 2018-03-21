package com.kte.project;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.kte.project.VO.CustomVO;
import com.kte.project.dao.CustomDAO;
import com.kte.project.dao.LoginDAO;

@Controller
public class SearchController {
	@RequestMapping(value="/roomSearch.do", method = RequestMethod.GET)
	public String passwordEdit() {		
		return "room_search";
	}
}
