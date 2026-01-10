package com.sist.web.security;

import java.io.IOException;

import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.InternalAuthenticationServiceException;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;
import org.springframework.stereotype.Component;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class LoginFailHandler implements AuthenticationFailureHandler{

	@Override
	public void onAuthenticationFailure(HttpServletRequest request, HttpServletResponse response,
			AuthenticationException exception) throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		String errorMsg = "";
		
		// 일단 보안적인 이슈가 생길 수 있으니 나중에 수정할 예정
		if(exception instanceof UsernameNotFoundException){
			errorMsg = "아이디가 존재하지 않습니다.";
		}
		else if(exception instanceof BadCredentialsException) {
			errorMsg = "비밀번호가 틀립니다.";
		}
		else if(exception instanceof InternalAuthenticationServiceException){
			errorMsg = "시스템 오류 입니다.";
		}
		else if(exception instanceof DisabledException) {
			errorMsg = "휴먼 계정입니다.";
		}
		
		request.setAttribute("errorMsg", errorMsg);
		request.getRequestDispatcher("/auth/login").forward(request, response);
		
	}

	
}
