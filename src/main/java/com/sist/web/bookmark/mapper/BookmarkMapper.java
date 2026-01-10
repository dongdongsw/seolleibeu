package com.sist.web.bookmark.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
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
		   +"WHERE id=#{id}")
	public void bookmarkDelete(int id);
}
