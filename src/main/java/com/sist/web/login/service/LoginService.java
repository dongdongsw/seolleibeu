package com.sist.web.login.service;

import org.apache.ibatis.annotations.Param;

import com.sist.web.vo.UsersVO;

public interface LoginService {
	public void registerInsert(UsersVO vo);
	
	public UsersVO loginInfoData(String id);
	
	public int registerUserNameCheck(String name);
	
	public int loginIdCheck(String id);	
	
	public int registerEmailCheck(String email);
	
	public void pwdReset(String pwd, String id);
}
