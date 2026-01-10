package com.sist.web.mypage.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.UsersVO;

@Mapper
@Repository
public interface MypageMapper {
	@Select("SELECT uno,id,name,email,phone, "
		   +"created_at,updated_at,profile_img "
		   +"FROM users WHERE uno=#{uno}")
	public UsersVO mypageData(int uno);
}
