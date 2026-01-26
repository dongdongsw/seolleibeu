package com.sist.web.mypage.mapper;

import org.apache.ibatis.annotations.Delete;
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
	         +"pwd = #{pwd}, "
	         +"updated_at = SYSDATE "
	         +"WHERE uno = #{uno}")
	public void mypageUpdate(UsersVO vo);
	
	@Update("UPDATE users SET profile_img = #{profile_img} WHERE uno = #{uno}")
	public void profile_update(@Param("profile_img") String profile_img, @Param("uno") int uno);
	
	// 유저 기타 삭제
	@Delete("DELETE FROM bookmark WHERE uno = #{uno}")
	public void userBookmarkDelete(@Param("uno") int uno);
	
	@Delete("DELETE FROM reply WHERE uno = #{uno}")
	public void userReplyDelete(@Param("uno") int uno);
	
	@Delete("DELETE FROM favorite WHERE uno = #{uno}")
	public void userFavoriteDelete(@Param("uno") int uno);
	
	@Delete("DELETE FROM userlike WHERE uno = #{uno}")
	public void userUserLikeDelete(@Param("uno") int uno);
	
	@Delete("DELETE FROM review WHERE uno = #{uno}")
	public void userUserReviewDelete(@Param("uno") int uno);
	
	// 코스 삭제
	@Delete("DELETE FROM bookmark WHERE cno IN(select cno from course where uno= #{uno})")
	public void userCourseBookmarkDelete(@Param("uno") int uno);
	
	@Delete("DELETE FROM reply WHERE cno IN(select cno from course where uno= #{uno})")
	public void userCourseReplyDelete(@Param("uno") int uno);
	
	@Delete("DELETE FROM course WHERE uno = #{uno}")
	public void userCourseDelete(@Param("uno") int uno);
	
	@Delete("DELETE FROM notification WHERE uno = #{uno}")
	public void userNotificationDelete(@Param("uno") int uno);
	
	// 유저 삭제
	@Delete("DELETE FROM users WHERE uno = #{uno}")
	public void userDelete(@Param("uno") int uno);
}
