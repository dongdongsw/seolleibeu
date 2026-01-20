package com.sist.web.security;

import java.security.Principal;

import org.springframework.context.event.EventListener;
import org.springframework.messaging.simp.stomp.StompHeaderAccessor;
import org.springframework.stereotype.Component;
import org.springframework.web.socket.messaging.SessionConnectEvent;
import org.springframework.web.socket.messaging.SessionDisconnectEvent;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class WebSocketListener {

	private final WebSocketSessionRegistry wsRegistry;
	
	@EventListener
	public void connect(SessionConnectEvent event) {
		StompHeaderAccessor  acc = StompHeaderAccessor.wrap(event.getMessage());
		
		Principal p = acc.getUser();
		if(p == null) {
			return;
		}
		
		String id = p.getName();
		String sessionId = acc.getSessionId();
		
		wsRegistry.register(id, sessionId);
	}
	
	@EventListener
	public void disconnect(SessionDisconnectEvent event) {
		StompHeaderAccessor  acc = StompHeaderAccessor.wrap(event.getMessage());
		
		Principal p = acc.getUser();
		if(p == null) {
			return;
		}
		String id = p.getName();
		String sessionId = acc.getSessionId();
		
		wsRegistry.unregister(id, sessionId);
	}
}
