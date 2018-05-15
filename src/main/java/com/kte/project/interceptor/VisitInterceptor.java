package com.kte.project.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kte.project.VO.CustomVO;

public class VisitInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession http = request.getSession();
		String ip = request.getRemoteAddr();
		String ret = (String)http.getAttribute("ret1");
		if(ret == null || ret == "0") {
			response.sendRedirect("visit.do");
			return false;
		}
		else {
			return true;
		}
		
	}

	
}
