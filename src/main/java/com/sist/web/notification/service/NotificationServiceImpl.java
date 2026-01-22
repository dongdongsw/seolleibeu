package com.sist.web.notification.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sist.web.notification.mapper.NotificationMapper;
import com.sist.web.vo.NotificationVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NotificationServiceImpl implements NotificationService {
	
	private final NotificationMapper mapper;

	@Override
	public void NotificationInsert(NotificationVO vo) {
		// TODO Auto-generated method stub
		mapper.NotificationInsert(vo);
	}

	@Override
	public List<NotificationVO> notificationListData(int uno) {
		// TODO Auto-generated method stub
		return mapper.notificationListData(uno);
	}

	@Override
	public void notificationRead(int nono) {
		// TODO Auto-generated method stub
		mapper.notificationRead(nono);
	}

	@Override
	public void notificationDelete(int nono) {
		// TODO Auto-generated method stub
		mapper.notificationDelete(nono);
	}

	@Override
	public int noReadExist(int uno) {
		// TODO Auto-generated method stub
		return mapper.noReadExist(uno);
	}

}
