package com.sist.web.refund.service;
import java.util.*;
import com.sist.web.vo.*;

public interface RefundService {
	// 환불 목록
	public List<RefundVO> refundListData(Map map);
	// 환불 총 페이지
	public int refundTotalPage(int uno);
	// 사용자 환불 요청
	public void refundInsert(RefundVO vo);
	// 관리자 환불 승인/거절
	public int refundUpdate(Map map);
	// 관리자 환불 목록
	public List<RefundVO> adminRefundListData(Map map);
	// 관리자 환불 총 페이지
	public int adminRefundTotalPage();
}
