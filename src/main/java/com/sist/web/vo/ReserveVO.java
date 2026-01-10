package com.sist.web.vo;

import java.util.*;

import lombok.Data;

@Data
public class ReserveVO {
	private int rvno, pno, opno, uno, rv_price, rv_amount;
	private String rv_status, rv_time, rv_option1, rv_option2, userid, nickname, phone, email, rv_exposure;
	private Date rv_date, rv_created_at;
	
	private PlaceVO pvo = new PlaceVO();
	private PlaceOptionsVO povo = new PlaceOptionsVO();
}
