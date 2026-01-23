package com.sist.web.vo;
import lombok.Data;
import java.util.*;
@Data
public class RefundVO {
	private int rf_id,p_id;
	private String transactionKey,receiptKey,rf_msg,rf_status;
	private Date rf_requestAt,rf_doneAt;
	private String doneday,reqday;
	private long rf_amount;
	
	// 장소
	private String pname,thumbnail;
	
	// 사용자
	private String name;
	private int uno;
}
