package com.board.business.dto;

import java.time.LocalDateTime;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReservationPlanDto {

	
	private int rp_idx;
	private int store_idx;
	private String plan;
	private LocalDateTime  start_time;
	private LocalDateTime  end_time;
	private Integer max_number;
	

}
