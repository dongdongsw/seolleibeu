package com.sist.web.bookmark.service;

import org.springframework.stereotype.Service;

import com.sist.web.bookmark.mapper.BookmarkMapper;
import com.sist.web.vo.BookMarkVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class BookmarkServiceImpl implements BookmarkService{
	private final BookmarkMapper bMapper;

	@Override
	public void bookmarkInsert(BookMarkVO vo) {
		bMapper.bookmarkInsert(vo);
	}

	@Override
	public void bookmarkDelete(int id) {
		bMapper.bookmarkDelete(id);
	}
}
