package com.kte.project.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kte.project.VO.CustomVO;

public class UrlInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession http = request.getSession();
		String root = request.getContextPath();
		String path = request.getServletPath();
		String query = request.getQueryString();
		
		
		
		if(query == null) {
			http.setAttribute("_url", root+path);
			http.setAttribute("_path", path);
		}
		else {
			http.setAttribute("_url", root+path+"?"+query);
			http.setAttribute("_path", path+"?"+query);
		}		
		return true;
	}
	
}
