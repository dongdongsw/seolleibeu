package com.sist.web.commons;

import java.util.HashMap;
import java.util.Map;

public class Methods {

	public static Map paginationMap(final int BLOCK, int page, int totalpage) {
		
		Map map=new HashMap();
		
		int startPage=((page-1)/BLOCK*BLOCK)+1;
		int endPage=((page-1)/BLOCK*BLOCK)+BLOCK;
		if(endPage>totalpage)
			endPage=totalpage;
		   
		map.put("curpage", page);
		map.put("totalpage", totalpage);
		map.put("startPage", startPage);
		map.put("endPage", endPage);
		
		return map;
	}
}
