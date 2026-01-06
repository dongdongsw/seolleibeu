package com.sist.web.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PlaceVO {

	private int pno, uno;
	private String name, phone, addr, company, category, type, thumbnail, imgs, hours, seat, parking, intro, runtime, rating, ticket, menu;
	private Date created_at, updated_at;
	
	// 조회수
	private int hit;
	
	// 즐겨찾기 개수
	private int f_count;
	
	// 리뷰 개수
	private int r_count;
	
	// 좋아요 개수
	private int l_count;
	
	private PlaceOptionsVO povo = new PlaceOptionsVO();
}
