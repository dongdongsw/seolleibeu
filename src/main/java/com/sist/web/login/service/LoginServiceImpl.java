package com.sist.web.login.service;

import org.springframework.mail.MailException;
import org.springframework.mail.MailSender;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.stereotype.Service;

import com.sist.web.login.mapper.LoginMapper;
import com.sist.web.vo.UsersVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService{

	private final LoginMapper mapper;
	private final MailSender mailSender;
	@Override
	public void registerInsert(UsersVO vo) {
		// TODO Auto-generated method stub
		mapper.registerInsert(vo);
	}

	@Override
	public UsersVO loginInfoData(String id) {
		// TODO Auto-generated method stub
		return mapper.loginInfoData(id);
	}

	@Override
	public int registerUserNameCheck(String name) {
		// TODO Auto-generated method stub
		return mapper.registerUserNameCheck(name);
	}

	@Override
	public int loginIdCheck(String id) {
		// TODO Auto-generated method stub
		return mapper.loginIdCheck(id);
	}

	@Override
	public int registerEmailCheck(String email) {
		// TODO Auto-generated method stub
		return mapper.registerEmailCheck(email);
	}

	@Override
	public void pwdReset(String pwd, String id) {
		// TODO Auto-generated method stub
		mapper.pwdReset(pwd, id);
	}

	@Override
	public Boolean emailSend(String email, HttpSession session) {
		// TODO Auto-generated method stub
		Boolean res = false;
		try {
			SimpleMailMessage message = new SimpleMailMessage();
			int emailCode = (int)(Math.random() * (99999 - 10000 + 1)) +10000;

			message.setTo(email);
			message.setFrom("설레이브 <junseo05111@gmail.com>");
			message.setSubject("설레이브 이메일 인증번호");
			message.setText("인증번호는 " + emailCode + " 입니다.");
			
			session.setAttribute("emailCode", emailCode);
			session.setMaxInactiveInterval(300);
			
			mailSender.send(message);
			res = true;
		} catch (MailException ex) {
			ex.printStackTrace();
			res = false;
		}
		return res;
	}

	@Override
	public Boolean emailCodeCheck(int emailCode,HttpSession session) {
		// TODO Auto-generated method stub
		Boolean res = false;
		
		if(emailCode == (Integer)session.getAttribute("emailCode")) {
			res = true;
		}
		
		return res;
	}

	@Override
	public String findIdOfEmail(String email) {
		// TODO Auto-generated method stub
		return mapper.findIdOfEmail(email);
	}
	
	
}
