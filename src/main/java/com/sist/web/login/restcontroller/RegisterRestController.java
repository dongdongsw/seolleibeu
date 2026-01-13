package com.sist.web.login.restcontroller;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.login.service.LoginService;
import com.sist.web.vo.UsersVO;

import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
@RequestMapping("/auth")
public class RegisterRestController {

	private final LoginService lService;
	private final BCryptPasswordEncoder Encoder;
	
	@GetMapping("/nickNameCheck_vue/")
	public ResponseEntity<Map> auth_nickNameCheck_vue(@RequestParam("name") String name){
		
		Map map = new HashMap<>();
		
		try {
			Integer nickNameCheckCount = lService.registerUserNameCheck(name);
			map.put("nickNameCheckCount", nickNameCheckCount);
		} catch (Exception e) {
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK );
	}
	
	@GetMapping("/idCheck_vue/")
	public ResponseEntity<Map> auth_idCheck_vue(@RequestParam("id") String id){
		
		Map map = new HashMap<>();
		
		try {
			Integer idCheckCount = lService.loginIdCheck(id);
			map.put("idCheckCount", idCheckCount);
		} catch (Exception e) {
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK );
	}
	
	@GetMapping("/emailCheck_vue/")
	public ResponseEntity<Map> auth_emailCheck_vue(@RequestParam("email") String email){
		
		Map map = new HashMap<>();
		
		try {
			Integer emailCheckCount = lService.registerEmailCheck(email);
			map.put("emailCheckCount", emailCheckCount);
		} catch (Exception e) {
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK );
	}
	
	@PostMapping("/register_vue/")
	public ResponseEntity<Void> auth_register_vue(@RequestBody UsersVO vo){
		
		try {
			vo.setPwd(Encoder.encode(vo.getPwd()));
			lService.registerInsert(vo);
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return ResponseEntity.ok().build();
	}
}
