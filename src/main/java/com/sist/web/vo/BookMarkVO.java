package com.sist.web.vo;

import java.sql.Date;

import lombok.Data;
@Data
public class BookMarkVO {
	private int id;
	private int cno;
	private int uno;
	private Date bm_pushat;
	
	private String title;
	private int hit;
	private String thumbnail;
	private int replyCount;
}
