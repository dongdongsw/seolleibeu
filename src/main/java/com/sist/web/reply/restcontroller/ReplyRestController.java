package com.sist.web.reply.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.reply.service.ReplyService;
import com.sist.web.vo.ReplyVO;

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
}
