package com.board.business.dto;

import lombok.Data;

@Data
public class WaitingDelayDto {	
    
	private int myOrder;
	private int newMyOrder;
	private int store_idx;
	private int waiting_idx;

}
