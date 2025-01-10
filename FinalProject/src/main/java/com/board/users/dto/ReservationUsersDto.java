package com.board.users.dto;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ReservationUsersDto {
    private Long reservationIdx;
    private Long userIdx;
    private String status;
    private Long reservation_number;
    private Date cdate;
    private Long rpIdx;
    private String reservationDate;
    private Long store_idx;

    
}
