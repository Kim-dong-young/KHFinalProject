package com.kh.T3B1.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.web.servlet.HandlerInterceptor;

import com.kh.T3B1.member.model.vo.Member;

public class MentorInterceptor implements HandlerInterceptor{

	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		HttpSession session = request.getSession();
		
		if(((Member)session.getAttribute("loginMember")).getMentorStatus().equals("Y")) {
			return true;
		} else {
			return false;
		}
	}
}
