package com.sist.web.review.mapper;
import java.util.*;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;
import com.sist.web.vo.*;

@Mapper
@Repository
public interface ReviewMapper {
	// 리뷰 리스트
	@Select("SELECT r.rno,r.uno,pno,name,r_content,r_img,r_score,TO_CHAR(r_created_at,'yyyy-mm-dd HH24:MI:SS') as dbday,u.profile_img "
			+ "FROM review r "
			+ "JOIN users u ON r.uno=u.uno "
			+ "WHERE pno=#{pno} "
			+ "ORDER BY r_gid DESC,r_created_at ASC "
			+ "OFFSET #{start} ROWS FETCH NEXT 10 ROWS ONLY")
	public List<ReviewVO> reviewListData(Map map);
	// 리뷰 총 페이지
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM review "
			+ "WHERE pno=#{pno}")
	public int reviewTotalPage(int pno);
	// 리뷰 갯수
	@Select("SELECT COUNT(*) FROM review WHERE pno=#{pno}")
	public int reviewCount(int pno);
	// 리뷰 작성 
	@Insert("INSERT INTO review VALUES(REV_NO_SEQ.NEXTVAL, #{uno},#{pno},#{r_content},#{r_img},#{r_depth},(SELECT NVL(MAX(r_gid)+1,1),SYSDATE,NULL,#{r_score})")
	public void reviewInsert(ReviewVO vo);
	// 리뷰 수정
	// 리뷰 삭제
}
