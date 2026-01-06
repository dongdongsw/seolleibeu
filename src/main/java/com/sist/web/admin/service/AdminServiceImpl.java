package com.sist.web.admin.service;
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;
import java.util.*;
import com.sist.web.place.mapper.*;
import com.sist.web.vo.PlaceVO;

@Service
@RequiredArgsConstructor
public class AdminServiceImpl implements AdminService{
	private final PlaceMapper pmapper;

	@Override
	public List<PlaceVO> cultureListData(Map map) {
		// TODO Auto-generated method stub
		return pmapper.cultureListData(map);
	}

	@Override
	public int cultureTotalPage(Map map) {
		// TODO Auto-generated method stub
		return pmapper.cultureTotalPage(map);
	}
}
