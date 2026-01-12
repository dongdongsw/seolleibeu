package com.sist.web.admin.restcontroller;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import lombok.RequiredArgsConstructor;
import java.util.*;
import com.sist.web.admin.service.*;
import com.sist.web.commons.Methods;
import com.sist.web.vo.CourseVO;
import com.sist.web.vo.PlaceVO;
import com.sist.web.vo.UsersVO;

@RestController
@RequiredArgsConstructor
public class AdminRestController {
	private final AdminService aservice;
	
	// 문화 리스트
	@GetMapping("/admin/culture_list_vue/")
	public ResponseEntity<Map> culture_list_vue(@RequestParam("category")String category,@RequestParam("page")int page,@RequestParam("name") String name)
	{
		Map map=new HashMap();
		try
		{
			map.put("start",(page-1)*10);
			map.put("category", category);
			map.put("name", name);
			List<PlaceVO> list=aservice.cultureListData(map);
			int totalpage=aservice.cultureTotalPage(map);
			
			Map pageMap=Methods.paginationMap(10, page, totalpage);
			map.putAll(pageMap);
			map.put("list", list);
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	
	// 문화 모달창
	@GetMapping("/admin/culture_detail_vue/")
	public PlaceVO culture_detail_vue(@RequestParam("pno") int pno)
	{
		PlaceVO vo=aservice.cultureDetailData(pno);
		return vo;
	}
	
	// 식당 리스트
	@GetMapping("/admin/food_list_vue/")
	public ResponseEntity<Map> food_list_vue(@RequestParam("category") String category,@RequestParam("page")int page,@RequestParam("name")String name)
	{
		Map map=new HashMap();
		try
		{
			map.put("start", (page-1)*10);
			map.put("category", category);
			map.put("name", name);
			List<PlaceVO> list=aservice.foodListData(map);
			int totalpage=aservice.foodTotalPage(map);
			
			Map pageMap=Methods.paginationMap(10, page, totalpage);
			map.putAll(pageMap);
			map.put("list", list);
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	
	// 식당 모달창
	@GetMapping("/admin/food_detail_vue/")
	public PlaceVO food_detail_vue(@RequestParam("pno") int pno)
	{
		PlaceVO vo=aservice.foodDetailData(pno);
		return vo;
	}
	
	// 사용자 리스트
	@GetMapping("/admin/users_list_vue/")
	public ResponseEntity<Map> users_list_vue(@RequestParam("page") int page, @RequestParam("name") String name)
	{
		Map map=new HashMap();
		try
		{
			map.put("start", (page-1)*10);
			map.put("name", name);
			List<UsersVO> list=aservice.usersListData(map);
			int totalpage=aservice.usersTotalPage(map);
			
			Map pageMap=Methods.paginationMap(10, page, totalpage);
			map.putAll(pageMap);
			map.put("list", list);
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	
	// 코스 리스트
	@GetMapping("/admin/course_list_vue/")
	public ResponseEntity<Map> course_list_vue(@RequestParam("page") int page, @RequestParam("title") String title)
	{
		Map map=new HashMap();
		try
		{
			map.put("start", (page-1)*10);
			map.put("title", title);
			List<CourseVO> list=aservice.courseListData(map);
			int totalpage=aservice.courseTotalPage(map);
			
			Map pageMap=Methods.paginationMap(10, page, totalpage);
			map.putAll(pageMap);
			map.put("list", list);
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	
	// 코스 상태 수정
	@PutMapping("/admin/course_status_update_vue/")
	public ResponseEntity<CourseVO> course_status_update_vue(@RequestBody CourseVO vo)
	{
		try
		{	
			aservice.courseStatusUpdate(vo);
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(vo,HttpStatus.OK);
	} 
	
	// 코스 모달창
}
