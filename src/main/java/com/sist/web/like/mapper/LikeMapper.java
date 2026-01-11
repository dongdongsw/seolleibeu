package com.sist.web.like.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.UserLikeVO;

@Repository
@Mapper
public interface LikeMapper {

	@Select("SELECT COUNT(*) "
			+ "FROM userlike "
			+ "WHERE pno = #{pno} AND uno = #{uno}")
	public int userLikeCheck(UserLikeVO vo);
	
	@Insert("INSERT INTO userlike(l_id, uno, pno) "
			+ "VALUES(like_no_seq.nextval, #{uno}, #{pno})")
	public void userLikeInsert(UserLikeVO vo);
	
	@Delete("DELETE userlike "
			+ "WHERE uno = #{uno} "
			+ "AND pno = #{pno}")
	public void userLikeDelete(UserLikeVO vo);
	
	@Select("SELECT COUNT(*) "
			+ "FROM userlike "
			+ "WHERE pno = #{pno}")
	public int userLikeCount(int pno);
}
