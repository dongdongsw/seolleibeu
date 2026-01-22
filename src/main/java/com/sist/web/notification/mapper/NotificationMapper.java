package com.sist.web.notification.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.NotificationVO;

@Mapper
@Repository
public interface NotificationMapper {

	// 이벤트 발생 시 알림 저장
	@Insert("INSERT INTO notification "
			+ "(nono, uno, target_id, target_type, is_read, msg, created_at) VALUES "
			+ "(noti_no_seq.nextval, #{uno}, #{target_id}, #{target_type}, 'N', #{msg}, SYSDATE)")
	public void NotificationInsert(NotificationVO vo);
	
	// 내 알림 목록
	@Select("SELECT * FROM notification "
			+ "WHERE uno = #{uno} "
			+ "ORDER BY nono DESC "
			+ "OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY")
	public List<NotificationVO> notificationListData(int uno);
	
	// 읽음 처리
	@Update("UPDATE notification SET is_read = 'Y' WHERE nono = #{nono}")
	public void notificationRead(int nono);
	
	// 알림 삭제
	@Delete("DELETE FROM notification WHERE nono = #{nono}")
	public void notificationDelete(int nono);
	
	// 읽지 않은 알림 존재 확인
	@Select("SELECT COUNT(*) FROM "
			+ "(SELECT * FROM notification "
			+ "WHERE uno = #{uno} "
			+ "ORDER BY nono DESC "
			+ "OFFSET 0 ROWS FETCH NEXT 10 ROWS ONLY) "
			+ "WHERE is_read = 'N'")
	public int noReadExist(int uno);
}
