package com.board.business.dto;

import java.time.LocalDateTime;
import java.time.LocalTime;

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
	private String plan;
	private LocalTime  start_time;
	private LocalTime  end_time;
	private int max_number;
	
	private LocalDateTime start_datetime;
	private LocalDateTime end_datetime;
	
	
	public void setStart_dateTime(LocalDateTime startDateTime) {
		this.start_datetime = startDateTime;
		
	}
	public void setEnd_dateTime(LocalDateTime endDateTime) {
		this.end_datetime =endDateTime;
		
	}
}
