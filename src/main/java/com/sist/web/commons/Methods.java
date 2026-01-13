package com.sist.web.commons;

import java.io.*;
import java.util.*;

import org.springframework.web.multipart.MultipartFile;

import com.sist.web.vo.*;

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
}
