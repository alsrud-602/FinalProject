package com.board.business.dto;

import lombok.Data;

@Data
public class ReservationUserDto {
	
    
    private int reservation_idx;
    private int user_idx;
    private String status;
    private int reservation_number;
    private String  cdate;
    private int rp_idx;
    private String reservation_date;
    private int store_idx;
    private String title;
    private String time_slot;

}
