package com.sist.web.refund.service;
import org.springframework.stereotype.Service;
import com.sist.web.refund.mapper.RefundMapper;
import lombok.RequiredArgsConstructor;
import java.util.*;
import com.sist.web.vo.*;

@Service
@RequiredArgsConstructor
public class RefundServiceImpl implements RefundService{
	private RefundMapper rmapper;

	@Override
	public List<RefundVO> refundListData(Map map) {
		// TODO Auto-generated method stub
		return rmapper.refundListData(map);
	}

	@Override
	public int refundTotalPage(int uno) {
		// TODO Auto-generated method stub
		return rmapper.refundTotalPage(uno);
	}
}
