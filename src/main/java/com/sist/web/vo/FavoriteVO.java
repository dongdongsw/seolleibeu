package com.sist.web.vo;

import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class FavoriteVO {

	private int fno, uno, pno;
	private Date pushed_at;
	
	// 장소 조인용
	private PlaceVO pvo;
}
