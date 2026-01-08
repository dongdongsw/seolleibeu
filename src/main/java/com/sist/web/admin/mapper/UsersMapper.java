package com.sist.web.admin.mapper;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;
import com.sist.web.vo.*;
import java.util.*;

@Repository
@Mapper
public interface UsersMapper {
	// 사용자 리스트
	public List<UsersVO> usersListData(Map map);
	
	// 사용자 총 페이지
	public int usersTotalPage(Map map);
	
}
