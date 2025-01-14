package com.board.business.dto;

import lombok.Data;

@Data
public class ReservationDateListDto {

	
	private String  reservation_date; 
	private String  rd_idx; 
	private String plan; 
	private String rp_idx;
	private String time_range; 
	private String max_number; 
	private String time_slot;
	
}
