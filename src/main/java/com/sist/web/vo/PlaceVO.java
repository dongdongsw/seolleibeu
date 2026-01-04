package com.sist.web.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PlaceVO {

	private int pno, uno;
	private String name, phone, addr, company, category, type, thumbnail, imgs, hours, seat, parking, intro, runtime, rating, ticket, menu;
	private Date created_at, updated_at;
}
