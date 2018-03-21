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
public class CustomController {
	@Autowired
	CustomDAO cDAO = null;
	
	@Autowired
	LoginDAO lDAO = null;
	
	@RequestMapping(value="/passwordEdit.do", method = RequestMethod.GET)
	public String passwordEdit() {		
		return "password_edit";
	}
	
	@RequestMapping(value="/passwordEdit.do", method = RequestMethod.POST)
	public String p_passwordEdit(HttpServletRequest request, @Param(value="pre_pw") String pre_pw, @Param(value="pw1") String pw1, @Param(value="pw2") String pw2) {	
		HttpSession httpsession = request.getSession();
		CustomVO cvo = new CustomVO();
		cvo.setCustom_id((String)httpsession.getAttribute("custom_id"));
		cvo.setCustom_pw(pre_pw);
		
		int c = lDAO.confirmPw(cvo);
		
		if(c > 0) {
			if(pw1.equals(pw2)) {
				int ret = cDAO.passwordEdit(pw1);
				if(ret > 0) {
					return "redirect:/";
				}
			}
		}
		return "redirect:passwordEdit.do";
	}
	
	@RequestMapping(value="/paymentsLog.do", method = RequestMethod.GET)
	public String paymentsLog() {		
		return "payments_log";
	}
}
