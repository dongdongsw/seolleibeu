package com.sist.web.commons;

import java.util.*;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@ControllerAdvice
public class CommonsCookie {

	@ModelAttribute("cookieList")
	public List<Map> cookieList(HttpServletRequest request) {
		
		List<Map> cookieList=new ArrayList<>();
		Cookie[] cookies=request.getCookies();
		
		if (cookies == null) 
			return cookieList;
		
		List<String> vList=new ArrayList<>();
		for(Cookie c:cookies) {
			if(!c.getName().startsWith("place_"))
				continue;
			
			vList.add(c.getValue());
		}
		
		for(String v:vList) {
			Map map=new HashMap();
			int idx=v.indexOf("_");
			
			map.put("type", v.substring(0, idx));
			map.put("pno", v.substring(idx+1));
			
			cookieList.add(map);
		}
		
		return cookieList;
	}
	
}
