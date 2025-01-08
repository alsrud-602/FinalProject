package com.board.business.dto;

import lombok.Data;

@Data
public class ReservationTimeSlotDto {

	
	private String  reservation_date; 
	private int  rd_idx; 
	private String plan; 
	private int rp_idx;
	private String time_range; 
	private int max_number; 
	private String time_slot;
	private int store_idx;
	
}
