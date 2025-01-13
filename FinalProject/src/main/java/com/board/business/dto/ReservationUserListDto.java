package com.board.business.dto;

import lombok.Data;

@Data
public class ReservationUserListDto {
	
    private String reservation_date;
    private int rd_idx;
    private String plan;
    private int rp_idx;
    private String time_range;
    private String max_number;
    private String  time_slot;
    private String social_id;
    private String id;
    private String name;
    private String status;
    private int reservation_number;
}
