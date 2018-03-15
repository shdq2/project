package com.kte.project;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ProfileController {
	//@Autowired
	
	@RequestMapping(value="/profile.do", method = RequestMethod.GET)
	public String profile() {
		
		
		return "profile_view";
	}

	@RequestMapping(value="/profile_edit.do", method = RequestMethod.GET)
	public String profileEdit() {
		
		
		return "profile_edit";
	}
}
