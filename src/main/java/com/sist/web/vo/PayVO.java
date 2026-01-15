package com.sist.web.vo;
import lombok.Data;
import java.util.*;
@Data
public class PayVO {
	private int p_id,rvno;
	private String orderId,orderName,method,paymentKey,status,receiptUrl;
	private long totalAmount,balanceAmount;
	private Date requestedAt,approvedAt;
}
