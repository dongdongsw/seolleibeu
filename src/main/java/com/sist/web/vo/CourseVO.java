package com.sist.web.vo;

import java.util.*;
import lombok.Data;

@Data
public class CourseVO {
	
	private int cno, uno, hit;
	private String pnos, title, content, is_public;
	private Date created_at, updated_at;
}
