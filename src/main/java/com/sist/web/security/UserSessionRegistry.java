package com.sist.web.security;

import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;

import org.springframework.stereotype.Component;

@Component
public class UserSessionRegistry {

	private final Set<String> users = ConcurrentHashMap.newKeySet();
	
	public void add(String userid) {
		users.add(userid);
	}
	
	public void remove(String usuerid) {
		users.remove(usuerid);
	}
	
	public Set<String> getUsers(){
		return users;
	}
}
