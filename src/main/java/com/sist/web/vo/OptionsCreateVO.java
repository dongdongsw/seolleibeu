package com.sist.web.vo;

import java.util.*;

import lombok.Data;

@Data
public class OptionsCreateVO {
	private PlaceVO pvo;
	private String op_date_start;
	private String op_date_end;
	private List<String> op_time;
	private String[] op_type;
	private String[] op_price;
}
