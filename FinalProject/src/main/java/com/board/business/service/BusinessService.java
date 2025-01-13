package com.board.business.service;

import java.util.HashMap;
import java.util.List;

import com.board.business.dto.CategoryDto;
import com.board.business.dto.CompanyDto;
import com.board.business.dto.RequestDto;
import com.board.business.dto.ReservationDateDto;
import com.board.business.dto.ReservationDateListDto;
import com.board.business.dto.ReservationPlanDto;
import com.board.business.dto.ReservationStoreDto;
import com.board.business.dto.ReservationUserListDto;

import com.board.business.dto.ResponseDto;
import com.board.business.dto.StoreCategoryDto;
import com.board.business.dto.StoreDto;
import com.board.business.dto.StoreListDto;
import com.board.business.dto.StoreTagDto;
import com.board.business.dto.StoreUpdateDto;

public interface BusinessService {

	void setRegistration(HashMap<String, Object> map, String[] tag_name, String[] category_id);

	void setReservation(HashMap<String, Object> map,String[] start_time,String[] end_time,String[] max_number,
			String[] rp_plan,String[] rd_plan,String[] reservation_end_date,String[] reservation_start_date);

	List<CategoryDto> getCategoryList();

	List<StoreListDto> getStoreHistoryList(int company_idx);

	List<StoreListDto> getStoreOpertaionList(int company_idx);

	StoreListDto getStoreRequest(int store_idx);

	void insertRequest(RequestDto requstDto);

	List<StoreListDto> getStoreRequestList(int company_idx);

	RequestDto getRequest(int request_idx);

	CompanyDto getCompany(int company_idx);

	int getCompanyIdxByStoreIdx(int store_idx);

	void updateCompany(CompanyDto companydto);

	StoreUpdateDto getStoreUpdateinfo(int store_idx);

	List<StoreTagDto> getStoreTag(int store_idx);

	List<CategoryDto> getStoreCategory(int store_idx);

	ReservationStoreDto getReservationStore(int store_idx);

	List<ReservationDateDto> getReservationDate(int rs_idx);

	List<ReservationPlanDto> getReservationPlan(String plan);

	void updateStore(HashMap<String, Object> map, String[] tag_name, String[] category_id);

	void updateReservation(HashMap<String, Object> map, String[] start_time, String[] end_time, String[] max_number,
			String[] rp_plan, String[] rd_plan, String[] reservation_end_date, String[] reservation_start_date);

	List<StoreListDto> getStoreOperationView(int company_idx);

	List<ReservationDateListDto> getReservationDateList(HashMap<String, Object> map);

	List<ReservationUserListDto> getReservationUserList(HashMap<String, Object> map);

	StoreDto ApprovalUpdate(StoreDto storeDto);

	StoreDto ApprovalBan(StoreDto storeDto);

	List<ResponseDto> getRequestList(int store_idx);

	RequestDto UpdateResponse(RequestDto requestDto);

	void updateAdminStore(HashMap<String, Object> map, String[] tag_name, String[] category_id);

	Integer updateMaxNumer(HashMap<String, Object> map);

	

}
