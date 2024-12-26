package com.board.business.service;

import java.util.HashMap;

public interface BusinessService {

	void setRegistration(HashMap<String, Object> map, String[] tag_name);

	void setReservation(HashMap<String, Object> map,String[] start_time,String[] end_time,String[] max_number,
			String[] rp_plan,String[] rd_plan,String[] reservation_end_date,String[] reservation_start_date);

}
