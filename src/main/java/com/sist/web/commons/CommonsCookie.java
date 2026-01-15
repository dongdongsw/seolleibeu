package com.sist.web.commons;

import java.util.*;

import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.sist.web.mainpage.service.MainpageService;
import com.sist.web.vo.PlaceVO;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@ControllerAdvice
@RequiredArgsConstructor
public class CommonsCookie {

	private final MainpageService mService;
	
	@ModelAttribute("cookieList")
	public List<PlaceVO> cookieList(HttpServletRequest request) {
		
		List<PlaceVO> cookieList=new ArrayList<>();
		Cookie[] cookies=request.getCookies();
		if (cookies == null) return cookieList;
		
		for(Cookie c:cookies) {
			if(!c.getName().startsWith("place_"))
				continue;
			
			PlaceVO vo=mService.placeDataForCookie(Integer.parseInt(c.getValue()));
			
			// 마지막 제거 
			if (cookieList.size() >= 3) {
				cookieList.remove(0);
			}
			
			cookieList.add(vo);
			
		}
		return cookieList;
	}
	
}
