package com.sist.web.login.service;

import com.sist.web.vo.UsersVO;

public interface LoginService {
	public void registerInsert(UsersVO vo);
	
	public UsersVO loginInfoData(String id);
	
	public int registerUserNameCheck(String name);
	
	public int loginIdCheck(String id);	
	
	public int registerEmailCheck(String email);
}
