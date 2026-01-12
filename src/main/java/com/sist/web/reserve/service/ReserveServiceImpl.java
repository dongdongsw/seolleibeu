package com.sist.web.reserve.service;

import java.util.*;

import org.springframework.stereotype.Service;

import com.sist.web.reserve.mapper.*;
import com.sist.web.vo.*;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReserveServiceImpl implements ReserveService {
	private final ReserveMapper mapper;

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

//	@Override
//	public ReserveVO reserveResultPage(int rvno) {
//		// TODO Auto-generated method stub
//		return mapper.reserveResultPage(rvno);
//	}
}
