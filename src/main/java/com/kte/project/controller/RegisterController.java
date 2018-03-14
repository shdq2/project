package com.kte.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class RegisterController {
	@RequestMapping(value="/register.do", method = RequestMethod.GET)
	public String register() {
		
		return "register";
	}
}
