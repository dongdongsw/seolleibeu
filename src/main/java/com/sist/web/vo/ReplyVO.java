package com.sist.web.vo;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyVO {
	private int id;
	private int cno;
	private int uno;
	private String cr_content;
	private Date cr_created_at;
	private Date cr_update_at;
}
