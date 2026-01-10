package com.sist.web.bookmark.service;

import com.sist.web.vo.BookMarkVO;

public interface BookmarkService {
	public void bookmarkInsert(BookMarkVO vo);
	public void bookmarkDelete(int id);
}
