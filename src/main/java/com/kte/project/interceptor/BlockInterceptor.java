package com.kte.project.interceptor;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kte.project.VO.CustomVO;

public class BlockInterceptor extends HandlerInterceptorAdapter {

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		// TODO Auto-generated method stub
		HttpSession http = request.getSession();
		CustomVO vo = (CustomVO) http.getAttribute("custom");
		if(vo == null) {
			return true;
		}else {
			String block = (String)http.getAttribute("block");
			if(block == null) {
				response.sendRedirect("/project/block.do");
				return false;
			}
			if(block == "1") {				
				System.out.println("차단되었습니다");
				http.invalidate();
				response.sendRedirect("/project/");
				return false;			
			}else {				
				return true;
			}
		}
	}
	
}
