package com.sist.web.pay.mapper;
import org.apache.ibatis.annotations.Mapper;
import org.springframework.stereotype.Repository;

import com.sist.web.vo.PayVO;

@Mapper
@Repository
public interface PayMapper {
	
	public void paymentInsert(PayVO vo);
	
	public void rv_statusUpdate(int rvno);
}
