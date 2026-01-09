package com.sist.web.vo;

import java.util.Date;
import java.util.List;
import java.util.Map;

import lombok.Data;

@Data
public class PlaceVO {

	private int pno, uno;
	private String name, phone, addr, company, category, type, dbday, 
		thumbnail, imgs, hours, seat, parking, intro, runtime, rating, ticket, menu, createday;
	private Date created_at, updated_at;
	
	// 조회수
	private int hit;
	
	// 즐겨찾기 개수
	private int f_count;
	
	// 리뷰 개수
	private int r_count;
	
	// 좋아요 개수
	private int l_count;
	
	// 메뉴 분리를 위해서 만든 필드
	private List<Map> menuList;
	
	// 이미지 분리를 위해서 만든 필드
	private List<Map> imgList;
	
	// 장소 옵션 조인용
	private PlaceOptionsVO povo = new PlaceOptionsVO();
	
	
}
