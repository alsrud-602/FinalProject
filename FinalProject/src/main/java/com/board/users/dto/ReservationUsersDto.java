package com.board.users.dto;

import java.util.Date;
import lombok.Data;

@Data
public class ReservationUsersDto {
    private Long reservationIdx;
    private Long userIdx;
    private String status;
    private Long reservationNumber;
    private Date cdate;
    private Long rpIdx;
    private String reservationDate;
    private Long storeIdx;

    // 기본 생성자
    public ReservationUsersDto() {}

    // 모든 필드를 포함하는 생성자
    public ReservationUsersDto(Long reservationIdx, Long userIdx, String status, 
                               Long reservationNumber, Date cdate, Long rpIdx, 
                               String reservationDate, Long storeIdx) {
        this.reservationIdx = reservationIdx;
        this.userIdx = userIdx;
        this.status = status;
        this.reservationNumber = reservationNumber;
        this.cdate = cdate;
        this.rpIdx = rpIdx;
        this.reservationDate = reservationDate;
        this.storeIdx = storeIdx;
    }
}
