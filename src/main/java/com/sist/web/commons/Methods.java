package com.sist.web.commons;

import java.io.*;
import java.time.*;
import java.util.*;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;

import com.sist.web.vo.*;

@Component
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
	
	public static void imageUpload(PlaceVO vo, MultipartFile thumbnailFile, 
			List<MultipartFile> imgFiles, String uploadDir) throws Exception {
		File dir = new File(uploadDir);
		if(!dir.exists()) {
			dir.mkdirs();
		}
		
		// 썸네일
		if(thumbnailFile != null && !thumbnailFile.isEmpty()) {
			String thumbName = UUID.randomUUID()+"_"+thumbnailFile.getOriginalFilename();
			File thumbFile = new File(dir, thumbName);
			thumbnailFile.transferTo(thumbFile);
			
			vo.setThumbnail(thumbName);
		}
		
		// 상세이미지
		if(imgFiles != null && !imgFiles.isEmpty()) {
			List<String> imgNames = new ArrayList<>();
			
			for(MultipartFile mf : imgFiles) {
				if(mf.isEmpty()) {
					continue;
				}
				
				String imgName = UUID.randomUUID()+"_"+mf.getOriginalFilename();
				File imgFile = new File(dir, imgName);
				mf.transferTo(imgFile);
				
				imgNames.add(imgName);
			}
			
			vo.setImgs(String.join("|", imgNames));
		}
	}
	
	public static List<PlaceOptionsVO> saveOptions(OptionsCreateVO ocvo) {
		List<PlaceOptionsVO> list = new ArrayList<>();
		LocalDate start = LocalDate.parse(ocvo.getOp_date_start());
		LocalDate end = LocalDate.parse(ocvo.getOp_date_end());
		
		for(LocalDate date=start;!date.isAfter(end);date=date.plusDays(1)) {
			for(int i=0;i<ocvo.getOp_type().length;i++) {
				String type = ocvo.getOp_type()[i];
				String priceStr = ocvo.getOp_price()[i];
				
				if(type == null || type.isEmpty() || priceStr == null || priceStr.isEmpty()) {
					continue;
				}
				
				int price = Integer.parseInt(priceStr);
				
				for(String time : ocvo.getOp_time()) {
					PlaceOptionsVO ovo = new PlaceOptionsVO();
					ovo.setOp_date(java.sql.Date.valueOf(date));
					ovo.setOp_time(time);
					ovo.setOp_type(type);
					ovo.setOp_price(price);
					
					list.add(ovo);
				}
			}
		}
		
		return list;
	}
}
