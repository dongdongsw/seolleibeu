package com.sist.web.reserve.service;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import lombok.RequiredArgsConstructor;

@Component
@RequiredArgsConstructor
public class ReserveScheduler {
	private final ReserveService rvService;
	
	@Scheduled(fixedDelay = 120000)
	public void reserveAutoCancel() {
		rvService.cancelReserve();
		
		rvService.refundApproved();
	}
}