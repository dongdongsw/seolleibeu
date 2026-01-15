package com.sist.web.vo;
import lombok.Data;
import java.util.*;
@Data
public class RefundVO {
	private int rf_id,p_id,rf_amount;
	private String transactionKey,receiptKey,rf_msg,rf_status;
	private Date rf_requestAt,rf_doneAt;
	private String doneday,reqday;
	
	// 장소
	private String pname,thumbnail;
}
