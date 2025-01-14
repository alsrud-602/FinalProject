package com.board.business.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
public class ReservationDateDto {
	
	private int rd_idx;
	private int rs_idx;
	private int store_idx;
	private String plan;
	private Date reservation_start_date;
	private Date reservation_end_date;
}
