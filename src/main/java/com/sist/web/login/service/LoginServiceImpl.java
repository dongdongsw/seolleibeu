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
	
	
}
