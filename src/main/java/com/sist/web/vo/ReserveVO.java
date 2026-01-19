package com.sist.web.vo;

import java.util.*;

import lombok.Data;

@Data
public class ReserveVO {
	private int rvno, pno, opno, uno, rv_price, rv_amount;
	private String rv_status, rv_time, rv_option, userid, nickname, phone, email, rv_exposure, createday, form_price, opday;
	private Date rv_date, rv_created_at;
	
	private PlaceVO pvo = new PlaceVO();
	private PlaceOptionsVO povo = new PlaceOptionsVO();
	
	private PayVO pyvo = new PayVO();
	private RefundVO rfvo = new RefundVO();
}
