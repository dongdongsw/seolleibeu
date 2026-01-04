package com.sist.web.vo;

import java.util.Date;

import lombok.Data;

@Data
public class UsersVO {

	private int uno, failed_count;
	private String id, pwd, name, phone, email, profile_img, role, status, required_agree, optional_agree; 
	private Date created_at, updated_at;
}
