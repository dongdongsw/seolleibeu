package com.sist.web.course.mapper;

import java.util.List;

import java.util.Map;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.CourseVO;
import com.sist.web.vo.PlaceVO;

@Mapper
@Repository
public interface CourseMapper {

	public List<PlaceVO> placeListDataInCourse(@Param("type") String type, @Param("keyword") String keyword);
	
	public void courseInsert(CourseVO vo);
	
	public List<CourseVO> courseListData(Map map);
	
	public int courseListTotalPage(String keyword);
	
	public CourseVO courseDetailData(int cno);
	
	// 코스 게시판 상세보기 조회수 증가
	@Update("UPDATE course SET hit=hit+1 "
		   + "WHERE cno = #{cno}")
	public void courseHitIncrement(int cno);
	
	// 코스에 대한 장소 상세정보
	@Select("SELECT pno, thumbnail, name, addr, type, category, intro "
			+ "FROM place "
			+ "WHERE pno = #{pno}")
	public PlaceVO getPlaceData(int pno);
	
	public int courseGetFirstPlace(int cno);
	
	public void courseUpdate(CourseVO vo);
	
	// 코스 삭제
	@Delete("DELETE FROM course "
			+ "WHERE cno = #{cno}")
	public void courseDelete(int cno);
	
	// 코스 삭제 시 해당 코스 댓글 삭제
	@Delete("DELETE FROM reply "
			+ "WHERE cno = #{cno}")
	public void courseReplyDelete(int cno);
}
