package com.sist.web.bookmark.service;

import java.util.List;

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
	public void bookmarkDelete(int uno, int cno) {
		bMapper.bookmarkDelete(uno, cno);
	}

	@Override
	public int bookmarkCheck(int uno, int cno) {
		return bMapper.bookmarkCheck(uno, cno);
	}

	@Override
	public List<BookMarkVO> bookmarkListData(int uno, int start) {
		return bMapper.bookmarkListData(uno, start);
	}

	@Override
	public int bookmarkTotalpage(int uno) {
		return bMapper.bookmarkTotalpage(uno);
	}
}
