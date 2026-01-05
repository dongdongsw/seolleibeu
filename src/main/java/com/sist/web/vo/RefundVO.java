package com.sist.web.vo;
import lombok.Data;
import java.util.*;
@Data
public class RefundVO {
	private int rf_id,r_id;
	private String transaction_key,rf_msg,rf_status;
	private Double rf_amount;
	private Date rf_requestAt,rf_doneAt;
}
