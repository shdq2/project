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
		String root = request.getContextPath();
		String path = request.getServletPath();
		String query = request.getQueryString();
		http.setAttribute("_path", path);
		if(query == null) {
			http.setAttribute("_url", root+path);
		}
		else {
			http.setAttribute("_url", root+path+"?"+query);
		}
		String ret = (String)http.getAttribute("ret1");
		System.out.println("ret1 : " + ret);
		if(ret == null || ret == "0") {
			System.out.println("test1");
			response.sendRedirect("visit.do");
			return false;
		}
			
		else {
			System.out.println("test2");
			String url = (String)http.getAttribute("_url"); 
			return true;
		}
		
	}

	
}
