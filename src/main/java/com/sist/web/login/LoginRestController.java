package com.sist.web.login;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.login.service.LoginService;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/auth")
public class LoginRestController {

	private final LoginService lService;
	
	@GetMapping("/nickNameCheck_vue/")
	public ResponseEntity<Map> auth_nickNameCheck_vue(@RequestParam("nickname") String name){
		
		Map map = new HashMap<>();
		
		try {
			Integer nickNameCheckCount = lService.registerUserNameCheck(name);
			map.put("nickNameCheckCount", nickNameCheckCount);
		} catch (Exception e) {
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK );
	}
}
