package com.sist.web.pay.service;
import org.springframework.stereotype.Service;
import lombok.RequiredArgsConstructor;
import java.util.*;
import com.sist.web.vo.*;
import com.sist.web.pay.mapper.*;

@Service
@RequiredArgsConstructor
public class PayServiceImpl implements PayService{
	private final PayMapper mapper;

	@Override
	public void paymentInsert(PayVO vo) {
		// TODO Auto-generated method stub
		mapper.paymentInsert(vo);
	}

	@Override
	public void rv_statusUpdate(int rvno) {
		// TODO Auto-generated method stub
		mapper.rv_statusUpdate(rvno);
	}
}
