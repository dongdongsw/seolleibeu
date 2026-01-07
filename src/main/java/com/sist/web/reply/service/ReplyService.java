package com.sist.web.reply.service;

import java.util.List;

import com.sist.web.vo.ReplyVO;

public interface ReplyService {
		// 댓글 조회
		public List<ReplyVO> replyListData(int cno);
		
		// 댓글 삽입
		public void replyInsert(ReplyVO vo);
		
		// 댓글 수정
		public void replyUpdate(int id, String cr_content);
		// 댓글 삭제
		public void replyDelete(int id);
}
