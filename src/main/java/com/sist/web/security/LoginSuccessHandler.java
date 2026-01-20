package com.sist.web.security;

import java.io.IOException;

import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;
import org.springframework.stereotype.Component;

import com.sist.web.login.service.LoginService;
import com.sist.web.vo.UsersVO;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class LoginSuccessHandler implements AuthenticationSuccessHandler{

	private final LoginService lService;
	
	private final LoginSessionRegistry loginRegistry;
	private final WebSocketSessionRegistry wsRegistry;
	private final SimpMessagingTemplate template;

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication authentication) throws IOException, ServletException {
		
		
		HttpSession session = request.getSession();
		
		
		String userid = authentication.getName();
		String newSessionId = session.getId();
		
		
		String oldSessionId = loginRegistry.get(userid);
		
		if(oldSessionId != null && !oldSessionId.equals(newSessionId)) {
			
			wsRegistry.getSession(userid).forEach(sid -> {
				template.convertAndSendToUser(userid,"/queue/force-logout","DUPLICATE_LOGIN");
			});
			
			SessionUtils.invalidate(oldSessionId);
		}
		
		loginRegistry.registry(userid, newSessionId);
		
		UsersVO vo = lService.loginInfoData(authentication.getName());
		session.setAttribute("uno", vo.getUno());
		session.setAttribute("id", vo.getId());
		session.setAttribute("name", vo.getName());
		session.setAttribute("phone", vo.getPhone());
		session.setAttribute("email", vo.getEmail());
		
		response.sendRedirect("/");
	}
	
	
}
