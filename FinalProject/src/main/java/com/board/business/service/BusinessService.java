package com.board.business.service;

import java.util.HashMap;
import java.util.List;

import com.board.business.dto.ReservationPlanDto;

public interface BusinessService {

	void setRegistration(HashMap<String, Object> map, String[] tag_name);

	void setReservation(HashMap<String, Object> map,List<ReservationPlanDto> rpList);

}
