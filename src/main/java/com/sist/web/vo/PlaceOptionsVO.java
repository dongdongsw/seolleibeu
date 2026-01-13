package com.sist.web.vo;

import java.util.Date;

import lombok.Data;

@Data
public class PlaceOptionsVO {

	private int opno, pno, op_price, op_amount, op_booked;
	private String op_time, op_type;
	private Date op_date;
}
