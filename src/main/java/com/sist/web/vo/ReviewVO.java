package com.sist.web.vo;
import java.util.*;

import lombok.Data;
@Data
public class ReviewVO {
	private int rno,uno,pno,r_depth,r_gid;
	private String r_content,r_img,dbday,r_count,uday;
	private Date r_created_at,r_updated_at;
	private Double r_score;
	// 사용자
	private String profile_img,name;
	// 장소
	private String pname,thumbnail;
}
