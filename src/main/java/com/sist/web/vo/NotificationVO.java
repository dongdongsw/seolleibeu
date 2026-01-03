package com.sist.web.vo;

import java.util.*;
import lombok.Data;

@Data
public class NotificationVO {

	private int nono, uno, target_id;
	private String target_type, is_read;
	private Date created_at;
}
