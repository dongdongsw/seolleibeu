package com.sist.web.refund.service;
import java.util.*;
import com.sist.web.vo.*;

public interface RefundService {
	// 환불 목록
		public List<RefundVO> refundListData(Map map);
		// 환불 총 페이지
		public int refundTotalPage(int uno);
}
