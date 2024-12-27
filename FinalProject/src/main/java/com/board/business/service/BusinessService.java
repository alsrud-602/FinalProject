package com.board.business.service;

import java.util.HashMap;
import java.util.List;

import com.board.business.dto.CategoryDto;

public interface BusinessService {

	void setRegistration(HashMap<String, Object> map, String[] tag_name, String[] category_id);

	void setReservation(HashMap<String, Object> map,String[] start_time,String[] end_time,String[] max_number,
			String[] rp_plan,String[] rd_plan,String[] reservation_end_date,String[] reservation_start_date);

	List<CategoryDto> getCategoryList();

}
