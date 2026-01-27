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
import com.sist.web.vo.MailVO;
import com.sist.web.vo.UsersVO;

import jakarta.servlet.http.HttpSession;
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
			if(name.length() == 0) {
				map.put("nickNameCheckCount", 2);
			}
			else {
				Integer nickNameCheckCount = lService.registerUserNameCheck(name);
				map.put("nickNameCheckCount", nickNameCheckCount);
			}
		} catch (Exception e) {
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK );
	}
	
	@GetMapping("/idCheck_vue/")
	public ResponseEntity<Map> auth_idCheck_vue(@RequestParam("id") String id){
		
		Map map = new HashMap<>();
		String idEnglish = "^(?=.*[a-zA-Z]).+$";
		String idNumber = "^(?=.*[0-9]).+$";
		try {
			if(id.length() <= 12 && id.length() >= 6) {
				
				if(id.matches(idNumber) && id.matches(idEnglish)) {
					Integer idCheckCount = lService.loginIdCheck(id);
					if(id.equals(1)) {
						map.put("idCheckCount", 1);
					}
					else {
						map.put("idCheckCount", idCheckCount);
					}
				}
				else {
					map.put("idCheckCount", 3);
				}
				
			}
			else {
				map.put("idCheckCount", 3);
			}
			
		} catch (Exception e) {
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK );
	}
	
	@GetMapping("/emailCheck_vue/")
	public ResponseEntity<Map> auth_emailCheck_vue(@RequestParam("email") String email){
		
		Map map = new HashMap<>();
		
		try {
			if(email.length() == 0) {
				map.put("emailCheckCount", 2);
			}
			else {
				Integer emailCheckCount = lService.registerEmailCheck(email);
				map.put("emailCheckCount", emailCheckCount);
			}
			
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
	
	@PostMapping("/pwdReset_vue/")
	public ResponseEntity<Void> auth_pwdReset_vue(@RequestBody UsersVO vo){
		
		try {
			lService.pwdReset(vo.getPwd(), vo.getId());
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return ResponseEntity.ok().build();
	}
	
	@PostMapping("/email_send_vue/")
	public ResponseEntity<Map> auth_mail_send(
			@RequestBody MailVO vo,
			HttpSession session){

		Map map = new HashMap<>();
		try {
			Boolean res = lService.emailSend(vo.getEmail(), session);
			if(res.equals(true)) {
				map.put("emailCheckCount", 1);
			}else {
				map.put("emailCheckCount", 3);
			}
			
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map, HttpStatus.OK);
	}
	
	@GetMapping("/emailCode_check_vue/")
	public ResponseEntity<Map> auth_email_check(
			@RequestParam("emailCode") Integer emailCode,
			HttpSession session){
		
		Map map = new HashMap<>();
		try {
			Boolean res = lService.emailCodeCheck(emailCode, session);
			if(res.equals(true)) {
				map.put("emailCodeSuccess", 1);
			}
			else {
				map.put("emailCodeSuccess", 3);
			}
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	
	@GetMapping("/find_id_vue/")
	public ResponseEntity<String> auth_find_id(@RequestParam("email") String email){
		String id = "";
		try {
			id = lService.findIdOfEmail(email);
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(id,HttpStatus.OK);
	}
	
}
