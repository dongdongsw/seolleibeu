package com.sist.web.bookmark.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.BookMarkVO;

@Mapper
@Repository
public interface BookmarkMapper {
	@Insert("INSERT INTO bookmark VALUES( "
		   +"b_id_seq.nextval, "
		   +"#{cno},#{uno},SYSDATE)")
	public void bookmarkInsert(BookMarkVO vo);
	
	@Delete("DELETE FROM bookmark "
		   +"WHERE uno = #{uno} AND cno = #{cno}")
	public void bookmarkDelete(@Param("uno") int uno,@Param("cno") int cno);
	
	@Select("SELECT COUNT(*) "
		   +"FROM bookmark "
		   +"WHERE uno=#{uno} AND cno=#{cno}")
	public int bookmarkCheck(@Param("uno") int uno,@Param("cno") int cno);
}
