package com.sist.web.bookmark.mapper;

import java.util.List;

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
	
	@Select("SELECT c.cno,c.title,c.hit, "
		   +"TO_CHAR(b.bm_pushat,'yyyy-mm-dd') as bm_pushat, "
		   +"(SELECT COUNT(*) FROM reply r WHERE r.cno = c.cno) AS replyCount, "
		   +"(SELECT thumbnail FROM place "
		   +"WHERE pno = TO_NUMBER(SUBSTR(c.pnos, 1, INSTR(c.pnos, ',') - 1))) AS thumbnail "
		   +"FROM bookmark b "
		   +"JOIN course c ON b.cno = c.cno "
		   +"WHERE b.uno = #{uno} "
		   +"ORDER BY b.id DESC "
		   +"OFFSET #{start} ROWS FETCH NEXT 3 ROWS ONLY")
	public List<BookMarkVO> bookmarkListData(@Param("uno") int uno, @Param("start") int start);
	
	@Select("SELECT CEIL(COUNT(*)/3.0) FROM bookmark WHERE uno = #{uno}")
	public int bookmarkTotalpage(@Param("uno") int uno);
}
