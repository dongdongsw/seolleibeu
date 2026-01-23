package com.sist.web.notification.service;

import java.util.List;
import java.util.Map;

import com.sist.web.vo.NotificationVO;

public interface NotificationService {

	public void NotificationInsert(NotificationVO vo);
	public List<NotificationVO> notificationListData(int uno);
	public void notificationRead(int nono);
	public void notificationDelete(int nono);
	public int noReadExist(int uno);
	public List<Integer> selectAllUno();
	public void noticeNotiInsert(Map map);
}
