package com.sist.web.login.service;

import com.sist.web.vo.UsersVO;

public interface LoginService {
	public void registerInsert(UsersVO vo);
	
	public UsersVO loginInfoData(String id);
	
}
