package com.sist.web.admin.restcontroller;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PatchMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import lombok.RequiredArgsConstructor;
import java.util.*;
import com.sist.web.admin.service.*;
import com.sist.web.commons.Methods;
import com.sist.web.place.mapper.PlaceMapper;
import com.sist.web.vo.CourseVO;
import com.sist.web.vo.OptionsCreateVO;
import com.sist.web.vo.PlaceOptionsVO;
import com.sist.web.vo.PlaceVO;
import com.sist.web.vo.UsersVO;

@RestController
@RequiredArgsConstructor
public class AdminRestController {

    private final Methods methods;
	private final AdminService aservice;
	
	@Value("${file.upload.place:/uploads/place}")
	private String uploadDir;

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
			map.put("start", (page-1)*6);
			map.put("name", name);
			List<UsersVO> list=aservice.usersListData(map);
			int totalpage=aservice.usersTotalPage(map);
			
			Map pageMap=Methods.paginationMap(6, page, totalpage);
			map.putAll(pageMap);
			map.put("list", list);
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	
	// 사용자 상태 변경
	@PostMapping("/admin/users_enabled_vue/")
	public ResponseEntity<Void> users_enabled_vue(@RequestBody UsersVO vo){
		
		try {
			
			aservice.usersEnabledUpdate(vo.getEnabled(), vo.getUno());
			
		} catch (Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		
		return ResponseEntity.ok().build();
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
	
	// 식당 장소 생성
	@PostMapping("/admin/restaurant_create_vue/")
	public ResponseEntity<PlaceVO> restaurant_create_vue(@ModelAttribute PlaceVO vo, 
						@RequestParam(value = "thumbnailFile", required = false) MultipartFile thumbnailFile,
						@RequestParam(value = "imgFiles", required = false) List<MultipartFile> imgFiles) {
		try {
			Methods.imageUpload(vo, thumbnailFile, imgFiles, uploadDir);
			aservice.restaurantCreate(vo);
		} catch(Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(vo, HttpStatus.OK);
	}
	
	// 문화체험 장소 생성
	@PostMapping("/admin/culture_create_vue/")
	public ResponseEntity<Void> culture_create_vue(@ModelAttribute PlaceVO pvo, 
							@RequestParam(value = "op_date_start", required = false) String op_date_start,
							@RequestParam(value = "op_date_end", required = false) String op_date_end,
							@RequestParam(value = "op_time", required = false) List<String> op_time,
							@RequestParam(value = "op_type", required = false) String[] op_type,
							@RequestParam(value = "op_price", required = false) String[] op_price,
							@RequestParam(value = "thumbnailFile", required = false) MultipartFile thumbnailFile,
							@RequestParam(value = "imgFiles", required = false) List<MultipartFile> imgFiles) {
		try {
			Methods.imageUpload(pvo, thumbnailFile, imgFiles, uploadDir);
			
			OptionsCreateVO ocvo = new OptionsCreateVO();
			ocvo.setPvo(pvo);
			ocvo.setOp_date_start(op_date_start);
			ocvo.setOp_date_end(op_date_end);
			ocvo.setOp_time(op_time);
			ocvo.setOp_type(op_type);
			ocvo.setOp_price(op_price);
			
			List<PlaceOptionsVO> opList = Methods.saveOptions(ocvo);
			
			aservice.cultureCreate(pvo, opList);
		} catch(Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(HttpStatus.OK);
	}
	
	// 관광명소 장소 생성
	@PostMapping("/admin/attraction_create_vue/")
	public ResponseEntity<PlaceVO> attraction_create_vue(@ModelAttribute PlaceVO pvo,
						@RequestParam(value = "thumbnailFile", required = false) MultipartFile thumbnailFile,
						@RequestParam(value = "imgFiles", required = false) List<MultipartFile> imgFiles) {
		try {
			Methods.imageUpload(pvo, thumbnailFile, imgFiles, uploadDir);
			aservice.attractionCreate(pvo);
		} catch(Exception ex) {
			ex.printStackTrace();
			return new ResponseEntity<>(null, HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(pvo, HttpStatus.OK);
	}
}
