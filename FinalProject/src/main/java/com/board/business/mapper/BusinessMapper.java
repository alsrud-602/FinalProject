package com.board.business.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.board.business.dto.StoreTagDto;

@Mapper
public interface BusinessMapper {

	void insertStore(HashMap<String, Object> map);

	void insertStoreDetail(HashMap<String, Object> map);

	void insertStoreTage(@Param("tagList") List<StoreTagDto> tagList);

	void insertStoreOperation(HashMap<String, Object> map);


	



}
