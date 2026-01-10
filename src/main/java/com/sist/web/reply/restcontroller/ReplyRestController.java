package com.sist.web.reply.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.reply.service.ReplyService;
import com.sist.web.vo.ReplyVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class ReplyRestController {
	private final ReplyService rService;
	
	@GetMapping("/reply/list_vue/")
	public ResponseEntity<Map> reply_list_vue(@RequestParam("cno") int cno)
	{
		Map map=new HashMap();
		try
		{
			List<ReplyVO> list=rService.replyListData(cno);
			map.put("rList", list);
			map.put("cno", cno);
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	@PostMapping("/reply/insert_vue/")
	public ResponseEntity<Map> reply_insert_vue(
	   @RequestBody ReplyVO vo,HttpSession session
	)
	{
		Map map=new HashMap();
		try
		{
			int uno=(int)session.getAttribute("uno");
			String name=(String)session.getAttribute("name");
			vo.setUno(uno);
			vo.setName(name);
			
			rService.replyInsert(vo);
			List<ReplyVO> list=rService.replyListData(vo.getCno());
			map.put("rList", list);
			map.put("cno", vo.getCno());
			map.put("sessionId", session.getAttribute("id"));
		}catch(Exception ex)
		{
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	@PutMapping("/reply/update_vue/")
	public ResponseEntity<Map> reply_update_vue(
	  @RequestBody ReplyVO vo
	)
	{
		Map map=new HashMap();
		try
		{
			rService.replyUpdate(vo);
			
			List<ReplyVO> list=rService.replyListData(vo.getCno());
			map.put("rList", list);
			map.put("cno", vo.getCno());
		}catch(Exception ex)
		{
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	@DeleteMapping("/reply/delete_vue/")
	public ResponseEntity<Map> reply_delete_vue(
	  @RequestParam("cno") int cno, @RequestParam("id") int id		
	)
	{
		Map map=new HashMap();
		try
		{
			rService.replyDelete(id);
			List<ReplyVO> list=rService.replyListData(cno);
			map.put("rList", list);
			map.put("cno", cno);
		}catch(Exception ex)
		{
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
}
