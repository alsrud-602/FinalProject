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
public class StoreOperationDto {

	private int operation_idx;
	private int store_idx;
	private Date SMON;
	private Date STUE;
	private Date SWED;
	private Date STHU;
	private Date SFRI;
	private Date SSAT;
	private Date SSUN;
	private Date EMON;
	private Date ETUE;
	private Date EWED;
	private Date ETHU;
	private Date EFRI;
	private Date ESAT;
	private Date ESUN;
	private String onotes;
}
