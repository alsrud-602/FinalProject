package com.board.business.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.board.business.dto.CategoryDto;
import com.board.business.dto.CompanyDto;
import com.board.business.dto.ImageStoreDTO;
import com.board.business.dto.RequestDto;
import com.board.business.dto.ReservationDateDto;
import com.board.business.dto.ReservationDateListDto;
import com.board.business.dto.ReservationPlanDto;
import com.board.business.dto.ReservationStoreDto;
import com.board.business.dto.ReservationUserListDto;
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

	StoreUpdateDto getStoreUpdateinfo(int store_idx);

	List<StoreTagDto> getStoreTag(int store_idx);

	List<CategoryDto> getStoreCategory(int store_idx);

	ReservationStoreDto getReservationStore(int store_idx);

	List<ReservationDateDto> getReservationDate(int rs_idx);

	List<ReservationPlanDto> getReservationPlan(String plan);

	void updateStore(HashMap<String, Object> map);

	void updateStoreDetail(HashMap<String, Object> map);

	void deleteStoreCategory(int store_idx);

	void deleteStoreTage(int store_idx);

	void updateStoreOperation(HashMap<String, Object> map);

	void insertStoreCategoryListUpdate(@Param("scList")List<StoreCategoryDto> scList);

	void insertStoreTageUpdate(@Param("tagList")List<StoreTagDto> tagList);

	void insertReservationDateUpdate(@Param("rdList")List<ReservationDateDto> rdList);

	int getReservationRs_idx(int store_idx);

	void updateReservationStore(HashMap<String, Object> map);

	void deleteReservationPlan(String plan);

	void deleteReservationDate(int rs_idx);

	void insertReservationPlanUpdate(@Param("rpList")List<ReservationPlanDto> rpList);

	List<ImageStoreDTO> getImageStorList(int store_idx);

	ImageStoreDTO getImageStore(int is_idx);

	void deleteImageStore(int is_idx);

	List<StoreListDto> getStoreOperationView(int company_idx);

	List<ReservationDateListDto> getReservationDateList(HashMap<String, Object> map);

	List<ReservationUserListDto> getReservationUserList(HashMap<String, Object> map);




	



}
