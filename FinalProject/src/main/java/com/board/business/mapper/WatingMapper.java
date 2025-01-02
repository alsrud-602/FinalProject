package com.board.business.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.board.business.dto.StoreStatusDto;
import com.board.business.dto.WaitingDto;

@Mapper
public interface WatingMapper {

	void insertWatingList(WaitingDto watingDto);

	List<WaitingDto> getWatingList(int store_idx);

	void updateWatingList(WaitingDto waitingDto);

	void updateWaitingOrder(int store_idx, String wating_order, int newOrder);

	int getStore_idxWaiting(int waiting_idx);

	void updateOnsiteUse(StoreStatusDto storeStatusDTO);

	StoreStatusDto getStoreStauts(int store_idx);

	

}
