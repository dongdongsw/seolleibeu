package com.sist.web.pay.restcontroller;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import com.sist.web.pay.service.*;
import com.sist.web.reserve.service.ReserveService;

import lombok.RequiredArgsConstructor;
import java.util.*;
import com.sist.web.vo.*;

@RestController
@RequiredArgsConstructor
public class PayRestController {
	private final PayService service;
	private final ReserveService rservice;

	// 결제 성공
	@GetMapping("/pay/success/")
	public ResponseEntity<Map> pay_success(@RequestParam("paymentKey") String paymentKey,@RequestParam("orderId") String orderId, @RequestParam(name="amount") long amount,@RequestParam("rvno") int rvno)
	{
		System.out.println(">>> 서버 접속 성공!");
	    System.out.println(">>> rvno: " + rvno + ", amount: " + amount);
		Map map=new HashMap();
		try
		{
			PayVO vo=new PayVO();
			vo.setPaymentKey(paymentKey);
			vo.setOrderId(orderId);
			vo.setTotalAmount(amount);
			vo.setRvno(rvno);
			
			ReserveVO rvo=rservice.myReservedDetailData(rvno);
			vo.setOrderName(orderId);
			
			vo.setOrderName("예약번호"+rvno+"결제");
			vo.setMethod("CARD");
			vo.setBalanceAmount(amount);
			vo.setStatus("결제완료");

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
