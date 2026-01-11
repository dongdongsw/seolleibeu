package com.sist.web.bookmark.service;

import java.util.List;

import com.sist.web.vo.BookMarkVO;

public interface BookmarkService {
	public void bookmarkInsert(BookMarkVO vo);
	public void bookmarkDelete(int uno, int cno);
	public int bookmarkCheck(int uno, int cno);
	
	public List<BookMarkVO> bookmarkListData(int uno, int start);
	public int bookmarkTotalpage(int uno);
}
