package com.board.business.dto;

import java.util.HashMap;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class ReservationPlanWrapper {
    private List<ReservationPlanDto> rpList;
}