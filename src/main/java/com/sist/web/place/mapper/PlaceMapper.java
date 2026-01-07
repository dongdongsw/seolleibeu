package com.sist.web.place.mapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import java.util.*;
import com.sist.web.vo.*;

@Repository
@Mapper
public interface PlaceMapper {
	public List<PlaceVO> cultureListData(Map map);
	public int cultureTotalPage(Map map);
	public List<PlaceVO> foodListData(Map map);
	public int foodTotalPage(Map map);
	
	@Select("SELECT * FROM place "
			+ "WHERE pno=#{pno}")
	public PlaceVO cultureDetailData(int pno);
}
