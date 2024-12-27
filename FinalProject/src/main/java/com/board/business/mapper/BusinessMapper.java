package com.board.business.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.board.business.dto.CategoryDto;
import com.board.business.dto.CompanyDto;
import com.board.business.dto.RequestDto;
import com.board.business.dto.ReservationDateDto;
import com.board.business.dto.ReservationPlanDto;
import com.board.business.dto.StoreCategoryDto;
import com.board.business.dto.StoreListDto;
import com.board.business.dto.StoreTagDto;
import com.board.business.dto.StoreUpdateDto;

@Mapper
public interface BusinessMapper {

	void insertStore(HashMap<String, Object> map);

	void insertStoreDetail(HashMap<String, Object> map);

	void insertStoreTage(@Param("tagList") List<StoreTagDto> tagList);

	void insertStoreOperation(HashMap<String, Object> map);

	void insertReservationStore(HashMap<String, Object> map);

	void insertReservationPlan(@Param("rpList")List<ReservationPlanDto> rpList);

	void insertReservationDate(@Param("rdList")List<ReservationDateDto> rdList);

	List<CategoryDto> getCategoryList();

	void insertStoreCategoryList(@Param("scList")List<StoreCategoryDto> scList);

	int getStoreIdxMax();

	void setFileWriter(HashMap<String, Object> map);

	List<StoreListDto> getStoreHistoryList(int company_idx);

	List<StoreListDto> getStoreOpertaionList(int company_idx);

	StoreListDto getStoreRequest(int store_idx);

	void insertRequest(RequestDto requstDto);

	List<StoreListDto> getStoreRequestList(int company_idx);

	RequestDto getRequest(int request_idx);

	CompanyDto getCompany(int company_idx);

	int getCompanyIdxByStoreIdx(int store_idx);

	void updateCompany(CompanyDto companydto);

	StoreUpdateDto getStoreUpdateInfo(int store_idx);


	



}
