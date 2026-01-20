package com.sist.web.security;

import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;

@Component
public class WebSocketSessionRegistry {

	private final Map<String, Set<String>> map = new ConcurrentHashMap<>();
	
	public void register(String id, String sessionId) {
		
		map.computeIfAbsent(id, k -> ConcurrentHashMap.newKeySet()).add(sessionId);
		
	}
	
	public void unregister(String id, String sessionId) {
		
		Set<String> set = map.get(id);
		
		if(set != null) {
			
			set.remove(sessionId);
			
			if(set.isEmpty()) {
				
				map.remove(id);
				
			}
		}
	}
	
	public Set<String> getSession(String id){
		
		return map.getOrDefault(id, Set.of());
	}
	
	
}
