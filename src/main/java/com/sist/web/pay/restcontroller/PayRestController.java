package com.sist.web.pay.restcontroller;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RestController;
import com.sist.web.pay.service.*;
import lombok.RequiredArgsConstructor;
import java.util.*;
import com.sist.web.vo.*;

@RestController
@RequiredArgsConstructor
public class PayRestController {
	private final PayService service;
	
	// 결제 성공
	@PostMapping("/pay/success/")
	public ResponseEntity<Map> pay_success(@RequestBody PayVO vo)
	{
		Map map=new HashMap();
		try
		{
		String paymentKey=(String)vo.getPaymentKey();
		String orderId=(String)vo.getOrderId();
		long totalAmount=vo.getTotalAmount();
		int rvno=vo.getRvno();
		
		service.paymentInsert(vo);
		
		map.put("result", "success");
		}catch(Exception ex)
		{
			ex.printStackTrace();
			return new ResponseEntity<>(null,HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return new ResponseEntity<>(map,HttpStatus.OK);
	}
	
	// 결제 실패
}
