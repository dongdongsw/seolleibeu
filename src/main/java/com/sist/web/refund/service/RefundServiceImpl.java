package com.sist.web.refund.service;
import org.springframework.stereotype.Service;
import com.sist.web.controller.AdminController;
import com.sist.web.refund.mapper.RefundMapper;
import lombok.RequiredArgsConstructor;
import java.util.*;
import com.sist.web.vo.*;

@Service
@RequiredArgsConstructor
public class RefundServiceImpl implements RefundService{

    private final AdminController adminController;
	private final RefundMapper rmapper;

	// 환불 목록
	@Override
	public List<RefundVO> refundListData(Map map) {
		// TODO Auto-generated method stub
		return rmapper.refundListData(map);
	}
	// 환불 총 페이지
	@Override
	public int refundTotalPage(int uno) {
		// TODO Auto-generated method stub
		return rmapper.refundTotalPage(uno);
	}
	// 사용자 환불 요청
	@Override
	public void refundInsert(RefundVO vo) {
		// TODO Auto-generated method stub
		rmapper.refundInsert(vo);
	}
	// 관리자 환불 승인/거절
	@Override
	public int refundUpdate(Map map) {
		// TODO Auto-generated method stub
		int result=rmapper.refundUpdate(map);
		return result;
	}
	@Override
	public List<RefundVO> adminRefundListData(Map map) {
		// TODO Auto-generated method stub
		return rmapper.adminRefundListData(map);
	}
	@Override
	public int adminRefundTotalPage() {
		// TODO Auto-generated method stub
		return rmapper.adminRefundTotalPage();
	}
}
