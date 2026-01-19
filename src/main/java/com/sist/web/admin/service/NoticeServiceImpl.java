package com.sist.web.admin.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sist.web.admin.mapper.NoticeMapper;
import com.sist.web.vo.NoticeVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class NoticeServiceImpl implements NoticeService{
	private final NoticeMapper nMapper;

	@Override
	public void noticeInsert(NoticeVO vo) {
		nMapper.noticeInsert(vo);
	}

	@Override
	public List<NoticeVO> noticeListData(int start) {
		return nMapper.noticeListData(start);
	}

	@Override
	public int noticeTotalPage() {
		return nMapper.noticeTotalPage();
	}

	@Override
	public NoticeVO noticeDetailData(int n_id) {
		nMapper.noticeHitIncrement(n_id);
		return nMapper.noticeDetailData(n_id);
	}

	@Override
	public void noticeUpdate(NoticeVO vo) {
		nMapper.noticeUpdate(vo);
	}

	@Override
	public void noticeDelete(int u_id) {
		nMapper.noticeDelete(u_id);
	}
}
