package com.sist.web.favorite.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.FavoriteVO;

@Mapper
@Repository
public interface FavoriteMapper {

	public List<FavoriteVO> favoriteListData(Map map);
	
	public int favoriteTotalPage(Map map);
	
	@Insert("INSERT INTO favorite(fno, uno, pno) "
			+ "VALUES(fav_fno_seq.nextval, #{uno}, #{pno})")
	public void fovoriteInsert(FavoriteVO vo);
	
	@Select("SELECT COUNT(*) "
			+ "FROM favorite "
			+ "WHERE uno = #{uno}"
			+ "AND pno = #{pno}")
	public int favoriteDetailDone(FavoriteVO vo);
}
