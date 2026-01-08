package com.sist.web.reply.service;

import java.util.List;

import org.springframework.stereotype.Service;

import com.sist.web.reply.mapper.ReplyMapper;
import com.sist.web.vo.ReplyVO;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class ReplyServiceImpl implements ReplyService{
	private final ReplyMapper rMapper;

	@Override
	public List<ReplyVO> replyListData(int cno) {
		return rMapper.replyListData(cno);
	}
	@Override
	public void replyInsert(ReplyVO vo) {
		rMapper.replyInsert(vo);
	}

	@Override
	public void replyUpdate(int id, String cr_content) {
		rMapper.replyUpdate(id, cr_content);
	}

	@Override
	public void replyDelete(int id) {
		rMapper.replyDelete(id);
	}

}
