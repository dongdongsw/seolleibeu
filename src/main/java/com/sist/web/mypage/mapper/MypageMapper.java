package com.sist.web.mypage.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.UsersVO;

@Mapper
@Repository
public interface MypageMapper {
	@Select("SELECT uno,id,name,email,phone, "
		   +"created_at,updated_at,profile_img "
		   +"FROM users WHERE uno=#{uno}")
	public UsersVO mypageData(int uno);
	
	@Select("SELECT pwd FROM users WHERE id = #{id}")
	public String mypagePwd(String id);
	
	@Select("SELECT COUNT(*) FROM users WHERE name = #{name} AND uno != #{uno}")
	public int mypagNameChk(@Param("name") String name, @Param("uno") int uno);
	
	@Select("SELECT COUNT(*) FROM users WHERE phone = #{phone} AND uno != #{uno}")
	public int mypagPhoneChk(@Param("phone") String phone, @Param("uno") int uno);
	
	@Update("UPDATE users SET "
		   +"name = #{name}, "
		   +"phone = #{phone}, "
		   +"pwd = #{pwd} "
		   +"WHERE uno = #{uno}")
	public void mypageUpdate(UsersVO vo);
	
	@Update("UPDATE users SET profile_img = #{profile_img} WHERE uno = #{uno}")
	public void profile_update(@Param("profile_img") String profile_img, @Param("uno") int uno);

}
