package com.sist.web.mypage.service;

import com.sist.web.vo.UsersVO;

public interface MypageService {
	public UsersVO mypageData(int uno);
	
	boolean mypagePwd(String pwd);
	
	public boolean mypagNameChk(String name, int uno);
	public boolean mypagPhoneChk(String phone, int uno);
	public void mypageUpdate(UsersVO vo);
	public void profile_update(String profile_img, int uno);
	public void userDelete(int uno);
}
