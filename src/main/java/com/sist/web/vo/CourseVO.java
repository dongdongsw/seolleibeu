package com.sist.web.vo;

import java.util.*;
import lombok.Data;

@Data
public class CourseVO {
	
	private int cno, uno, hit;
	private String pnos, title, content, is_public, dbday;
	private Date created_at, updated_at;
	
	private List<Integer> pnosList;
	
	private UsersVO uvo=new UsersVO();
	private PlaceVO pvo=new PlaceVO();
}
