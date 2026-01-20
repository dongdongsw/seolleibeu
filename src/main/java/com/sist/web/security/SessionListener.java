package com.sist.web.security;

import jakarta.servlet.http.HttpSessionEvent;
import jakarta.servlet.http.HttpSessionListener;

public class SessionListener implements HttpSessionListener{

	@Override
	public void sessionCreated(HttpSessionEvent se) {
		
		SessionUtils.add(se.getSession());
	}

	@Override
	public void sessionDestroyed(HttpSessionEvent se) {
		
		SessionUtils.remove(se.getSession());
	}

	
}
