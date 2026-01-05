package com.sist.web.vo;
import java.util.*;

import lombok.Data;
@Data
public class ReviewVO {
	private int rno,uno,pno,r_depth,r_gid;
	private String r_content,r_img;
	private Date r_createdAt,r_updatedAt;
}
