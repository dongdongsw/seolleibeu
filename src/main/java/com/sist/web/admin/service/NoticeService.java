package com.sist.web.admin.service;

import java.util.List;

import com.sist.web.vo.NoticeVO;

public interface NoticeService {
	public void noticeInsert(NoticeVO vo);
	public List<NoticeVO> noticeListData(int start);
	public int noticeTotalPage();
	public NoticeVO noticeDetailData(int n_id);
	public void noticeUpdate(NoticeVO vo);
	public void noticeDelete(int n_id);
}
