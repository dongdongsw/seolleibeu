package com.sist.web.place.mapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.web.vo.*;

@Repository
@Mapper
public interface PlaceMapper {
	// 문화 리스트
	public List<PlaceVO> cultureListData(Map map);
	// 문화 총 페이지
	public int cultureTotalPage(Map map);
	// 식당 리스트
	public List<PlaceVO> foodListData(Map map);
	// 식당 총 페이지
	public int foodTotalPage(Map map);
	// 문화 모달창
	@Select("SELECT * FROM place "
			+ "WHERE pno=#{pno}")
	public PlaceVO cultureDetailData(int pno);
	// 식당 모달창
	@Select("SELECT * FROM place "
			+ "WHERE pno=#{pno}")
	public PlaceVO foodDetailData(int pno);
	// 코스 리스트
	public List<CourseVO> courseListData(Map map);
	// 코스 총 페이지
	public int courseTotalPage(Map map);
	// 코스 상태 변경
	public void courseStatusUpdate(CourseVO vo);
	
	// 식당 장소 생성
	public void restaurantCreate(PlaceVO vo);

	// 문화체험 장소 생성
	public void cultureCreate(PlaceVO vo);
	
	// 문화체험 옵션 생성
	public void cultureOptionCreate(PlaceOptionsVO vo);	
	
	// 관광명소 장소 생성
	public void attractionCreate(PlaceVO vo);
	
	@Select("SELECT COUNT(*) FROM reserve " +
	        "WHERE pno = #{pno} AND uno = #{uno} AND rv_status = '예약완료' " +
	        "AND NOT EXISTS (SELECT 1 FROM review WHERE pno = #{pno} AND uno = #{uno})")
	public int reviewCheck(Map map);
}
