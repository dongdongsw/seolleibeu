package com.sist.web.mypage.service;

import org.springframework.security.core.Authentication;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sist.web.mypage.mapper.MypageMapper;
import com.sist.web.vo.UsersVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class MypageServiceImpl implements MypageService{
	private final MypageMapper mMapper;
	private final PasswordEncoder passwordEncoder;

	@Override
	public UsersVO mypageData(int uno) {
		return mMapper.mypageData(uno);
	}

	@Override
	public boolean mypagePwd(String pwd) {
		Authentication auth = SecurityContextHolder.getContext().getAuthentication();

		String id = auth.getName();
	    String dbPwd = mMapper.mypagePwd(id);

	    return passwordEncoder.matches(pwd, dbPwd);
	}

	@Override
	public boolean mypagNameChk(String name, int uno) {
		return mMapper.mypagNameChk(name, uno) == 0;
	}

	@Override
	public boolean mypagPhoneChk(String phone, int uno) {
		return mMapper.mypagPhoneChk(phone, uno) == 0;
	}

	@Override
	public void mypageUpdate(UsersVO vo) {
		String encodedPwd = passwordEncoder.encode(vo.getPwd());
	    vo.setPwd(encodedPwd);

	    mMapper.mypageUpdate(vo);
		
	}

	@Override
	public void profile_update(String profile_img, int uno) {
		mMapper.profile_update(profile_img, uno);
	}

	@Transactional(rollbackFor = Exception.class)
	@Override
	public void userDelete(int uno) {
		mMapper.userBookmarkDelete(uno);
		mMapper.userReplyDelete(uno);
		mMapper.userFavoriteDelete(uno);
		mMapper.userUserLikeDelete(uno);
		mMapper.userUserReviewDelete(uno);
		mMapper.userCourseBookmarkDelete(uno);
		mMapper.userCourseReplyDelete(uno);
		mMapper.userCourseDelete(uno);
		mMapper.userDelete(uno);
		
	}
}
