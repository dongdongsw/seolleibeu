package com.sist.web.pay.vo;
import lombok.Data;
import java.util.*;

@Data
public class PayVO {
	/*
	 *  P_ID           NOT NULL NUMBER        
		RVNO                    NUMBER        
		ORDER_ID       NOT NULL VARCHAR2(64)  
		PAYMENT_KEY    NOT NULL VARCHAR2(200) 
		TOTAL_AMOUNT   NOT NULL NUMBER(9,2)   
		BALANCE_AMOUNT NOT NULL NUMBER(9,2)   
		P_STATUS                VARCHAR2(30)  
		REQUESTED_AT            DATE          
		PAID_AT                 DATE          
		RECEIPT_URL             VARCHAR2(500) 
		CREATED_AT              DATE
	 */
	private int p_id,rvno,total_amount,balance_amount;
	private String order_id,payment_key,p_status,receipt_url,reqday,pday,dbday;
	private Date requested_at,paid_at,created_at;
}
