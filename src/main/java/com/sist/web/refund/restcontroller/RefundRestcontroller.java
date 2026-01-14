package com.sist.web.refund.restcontroller;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import lombok.RequiredArgsConstructor;
import java.util.*;
import com.sist.web.vo.*;
import com.sist.web.refund.service.*;

@RestController
@RequiredArgsConstructor
public class RefundRestcontroller {
	private RefundService rservice;
	
	@GetMapping("/refund_list_vue/")
	public ResponseEntity<Map> refund_list_vue(@RequestParam("uno") int uno, @RequestParam("page") int page)
	{
		Map map=new HashMap();
		try
		{
			
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
}
