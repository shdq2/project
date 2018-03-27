package com.kte.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HostController {
	
	@RequestMapping(value="/host.do", method=RequestMethod.GET)
	public String hostname() {
		
		return "host_name";
	}
}
