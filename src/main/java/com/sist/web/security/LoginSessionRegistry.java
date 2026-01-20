package com.sist.web.security;

import java.util.Map;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;

@Component
public class LoginSessionRegistry {

	private final Map<String, String> sessions = new ConcurrentHashMap<>();
	
	public String get(String userid) {
		
		return sessions.get(userid);
		
	}
	
	public void registry(String userid, String sessionId) {
		
		sessions.put(userid, sessionId);
		
	}
	
	public void remove(String userid) {
		
		sessions.remove(userid);
		
	}
	
}
