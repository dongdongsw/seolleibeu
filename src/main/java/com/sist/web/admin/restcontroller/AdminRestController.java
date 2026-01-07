package com.sist.web.admin.restcontroller;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import lombok.RequiredArgsConstructor;
import java.util.*;
import com.sist.web.admin.service.*;
import com.sist.web.commons.Methods;
import com.sist.web.vo.PlaceVO;

@RestController
@RequiredArgsConstructor
public class AdminRestController {
	private final AdminService aservice;
	
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
	
	@GetMapping("/admin/culture_detail_vue/")
	public PlaceVO culture_detail_vue(@RequestParam("pno")int pno)
	{
		PlaceVO vo=aservice.cultureDetailData(pno);
		return vo;
	}
	
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
}
