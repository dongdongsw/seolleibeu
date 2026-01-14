package com.sist.web.refund.mapper;
import java.util.*;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;
import com.sist.web.vo.*;

@Mapper
@Repository
public interface RefundMapper {
	// 환불 목록
	public List<RefundVO> refundListData(Map map);
	// 환불 총 페이지
	public int refundTotalPage(int uno);
	// 환불 요청
}
