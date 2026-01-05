package com.sist.web.vo;
import lombok.Data;
import java.util.*;
@Data
public class PayVO {
	private int p_id,rvno;
	private String order_id,payment_key,p_status,receipt_url;
	private Double total_amount,balance_amount;
	private Date requested_At,paid_At,created_At;
}
