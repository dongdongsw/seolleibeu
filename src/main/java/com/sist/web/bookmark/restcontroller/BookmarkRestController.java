package com.sist.web.bookmark.restcontroller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import com.sist.web.commons.Methods;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.sist.web.bookmark.service.BookmarkService;
import com.sist.web.vo.BookMarkVO;

import jakarta.servlet.http.HttpSession;
import lombok.RequiredArgsConstructor;

@RestController
@RequiredArgsConstructor
public class BookmarkRestController {
	private final BookmarkService bService;
	
	@PostMapping("/bookmark/insert_vue/")
	public ResponseEntity<Map> bookmark_insert_vue(
			@RequestBody BookMarkVO vo,HttpSession session
	)
	{
		Map map=new HashMap();
		try
		{
			bService.bookmarkInsert(vo);
			map.put("cno", vo.getCno());
			map.put("uno", vo.getUno());
			map.put("sessionId", session.getAttribute("id"));
		}catch(Exception ex)
		{
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	@DeleteMapping("/bookmark/delete_vue/")
	public ResponseEntity<Map> bookmark_delete_vue(
		@RequestParam("uno") int uno, @RequestParam("cno") int cno
	)
	{
		Map map=new HashMap();
		try
		{
			bService.bookmarkDelete(uno, cno);
			map.put("cno", cno);
			map.put("uno", uno);
		}catch(Exception ex)
		{
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	@GetMapping("/bookmark/bookmarkCheck_vue/")
	public String bookmarkCheck_vue(@RequestParam("uno") int uno, @RequestParam("cno") int cno)
	{
		int count=bService.bookmarkCheck(uno, cno);
		return String.valueOf(count);
	}
	@GetMapping("/mypage/my_bookmark_vue/")
	public ResponseEntity<Map> my_bookmark_vue(@RequestParam("page") int page,HttpSession session)
	{
		Map map=new HashMap();
		try
		{
			Integer uno = (Integer)session.getAttribute("uno");
			
			List<BookMarkVO> list=bService.bookmarkListData(uno,(page-1)*3);
			int totalpage=bService.bookmarkTotalpage(uno);
			   
			Map pageMap=Methods.paginationMap(5, page, totalpage);
			   	   
			map.putAll(pageMap);
			   
			map.put("list", list);
			
		}catch(Exception ex)
		{
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
}
