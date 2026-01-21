package com.sist.web.reserve.service;

import java.util.*;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.sist.web.reserve.mapper.*;
import com.sist.web.vo.*;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReserveServiceImpl implements ReserveService {
	private final ReserveMapper mapper;
	private final OptionsMapper oMapper;

	@Override
	public List<ReserveVO> myReservedListData(Map map) {
		// TODO Auto-generated method stub
		return mapper.myReservedListData(map);
	}

	@Override
	public int myReservedTotalPage(int uno) {
		// TODO Auto-generated method stub
		return mapper.myReservedTotalPage(uno);
	}

	@Override
	public ReserveVO myReservedDetailData(int rvno) {
		// TODO Auto-generated method stub
		return mapper.myReservedDetailData(rvno);
	}

	@Override
	public void myReservedChangeExposure(int rvno) {
		// TODO Auto-generated method stub
		mapper.myReservedChangeExposure(rvno);
	}
	
	@Transactional
	@Override
	public int createReserve(ReserveVO vo) {
		// TODO Auto-generated method stub
		Map map = new HashMap();
		map.put("opno", vo.getOpno());
		map.put("rv_amount", vo.getRv_amount());
		
		int ok = oMapper.bookedIncrement(map);
		if(ok == 0) {
			return -1;
		}
		
		mapper.reserveInsert(vo);
		
		return vo.getRvno();
	}

	@Override
	public ReserveVO reserveResultData(int rvno) {
		// TODO Auto-generated method stub
		return mapper.reserveResultData(rvno);
	}

	@Transactional
	@Override
	public void cancelReserve() {
		// TODO Auto-generated method stub
		List<ReserveVO> list = mapper.reserveWaitList();
		for(ReserveVO rvo : list) {
			int change = mapper.reserveCancel(rvo.getRvno());
			if(change == 1) {
				Map map = new HashMap();
				map.put("opno", rvo.getOpno());
				map.put("rv_amount", rvo.getRv_amount());
				oMapper.bookedDecrement(map);
			}
		}
	}

	@Transactional
	@Override
	public void refundApproved() {
		// TODO Auto-generated method stub
		List<ReserveVO> list = mapper.refundReserveList();
		
		for(ReserveVO rvvo : list) {
			int changed = mapper.refundReserveCancel(rvvo.getRvno());
			
			if(changed == 1) {
				Map map = new HashMap();
				map.put("opno", rvvo.getOpno());
				map.put("rv_amount", rvvo.getRv_amount());
				oMapper.bookedDecrement(map);
			}
		}
	}
}