package com.sist.web.vo;
import lombok.Data;
import java.util.*;
@Data
public class NoticeVO {
	private int n_id,uno,hit;
	private String n_title,n_content;
	private Date n_created_at,n_updated_at;
}
