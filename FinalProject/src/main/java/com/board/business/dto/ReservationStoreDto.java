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
public class ReservationStoreDto {

	
	private int rs_idx;
	private int store_idx;
	private String notes;
	private Date open_date;
	private String status;
	private String link;

}
