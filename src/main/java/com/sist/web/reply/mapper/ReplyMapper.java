package com.sist.web.reply.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.ReplyVO;

import lombok.Data;

@Mapper
@Repository
public interface ReplyMapper {
	// 댓글 조회
	@Select("SELECT r.id,cno,r.uno,name,cr_content,TO_CHAR(cr_update_at,'yyyy-mm-dd HH24:MI:SS') as dbday "
		   +"FROM reply r "
		   +"JOIN users u ON r.uno = u.uno "
		   +"WHERE cno=#{cno} "
		   +"ORDER BY id DESC ")
	public List<ReplyVO> replyListData(int cno);
	
	// 댓글 삽입
	@Insert("INSERT INTO reply VALUES( "
		   +"(SELECT NVL(MAX(id)+1,1) FROM reply), "
		   +"#{cno},#{uno},#{cr_content},SYSDATE,SYSDATE)")
	public void replyInsert(ReplyVO vo);
	
	// 댓글 수정
	@Update("UPDATE reply SET "
		   +"cr_content=#{cr_content},cr_update_at=SYSDATE "
		   +"WHERE id=#{id}")
	public void replyUpdate(ReplyVO vo);
	// 댓글 삭제
	@Delete("DELETE FROM reply "
		   +"WHERE id=#{id}")
	public void replyDelete(int id);

	public int replyTotalpage(@Param("uno") int uno, @Param("cr_content") String cr_content);

	public List<ReplyVO> replyFindData(@Param("uno") int uno, @Param("start") int start, @Param("cr_content") String cr_content);
	
}
