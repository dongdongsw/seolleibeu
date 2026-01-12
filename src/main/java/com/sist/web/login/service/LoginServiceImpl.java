package com.sist.web.login.service;

import org.springframework.stereotype.Service;

import com.sist.web.login.mapper.LoginMapper;
import com.sist.web.vo.UsersVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class LoginServiceImpl implements LoginService{

	private final LoginMapper mapper;

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
	
	
}
