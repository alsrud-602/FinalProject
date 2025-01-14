package com.board.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.board.users.dto.UsersDto;

@Mapper
public interface StoreMapper {
	List<Map<String, UsersDto>> getStoreListByCity();
	

}
