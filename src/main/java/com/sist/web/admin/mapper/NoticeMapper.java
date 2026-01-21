package com.sist.web.admin.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.NoticeVO;

@Mapper
@Repository
public interface NoticeMapper {
	@Select("SELECT n_id, n_title, hit, "
		   +"TO_CHAR(n_created_at,'YYYY-MM-DD') as created_at "
		   +"FROM notice ORDER BY n_id DESC "
		   +"OFFSET #{start} ROWS FETCH NEXT 10 ROWS ONLY")
	public List<NoticeVO> noticeListData(int start);
	
	@Select("SELECT CEIL(COUNT(*)/10.0) FROM notice")
	public int noticeTotalPage();
	
	@Insert("INSERT INTO notice(n_id,uno,n_title,n_content,n_created_at,n_updated_at,hit) "
		   +"VALUES(noti_no_seq.nextval,#{uno},#{n_title},#{n_content},SYSDATE,NULL,0)")
	public void noticeInsert(NoticeVO vo);
	
	@Select("SELECT n_id, n_title, hit, n_content,  "
		   +"TO_CHAR(n_created_at,'YYYY-MM-DD') as created_at "
		   +"FROM notice WHERE n_id = #{n_id}")
	public NoticeVO noticeDetailData(int n_id);
	
	@Update("UPDATE notice SET "
		   +"hit=hit+1 "
		   +"WHERE n_id=#{n_id}")
	public void noticeHitIncrement(int n_id);
	
	@Update("UPDATE notice SET "
		   +"n_title = #{n_title}, n_content=#{n_content}, n_updated_at=SYSDATE "
		   +"WHERE n_id=#{n_id}")
	public void noticeUpdate(NoticeVO vo);
	
	@Delete("DELETE FROM notice WHERE n_id=#{n_id}")
	public void noticeDelete(int n_id);
	
}
