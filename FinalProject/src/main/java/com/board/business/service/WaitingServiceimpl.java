package com.board.business.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.board.business.dto.StoreStatusDto;
import com.board.business.dto.WaitingDto;
import com.board.business.mapper.WatingMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class WaitingServiceimpl  implements WaitingService {
	
	@Autowired
	private WatingMapper watingMapper;
	
	@Override
	public void insertWatingList(WaitingDto watingDto) {
		watingMapper.insertWatingList(watingDto);
		
	}

	@Override
	public List <WaitingDto> getWatingList(int store_idx) {
		List <WaitingDto> watingList = watingMapper.getWatingList(store_idx);
		return watingList;
	}
	
	@Override
	@Transactional
	public List<WaitingDto> updateWatingList(WaitingDto waitingDto) {
		
    	//해당 건 취소 업데이트
		watingMapper.updateWatingList(waitingDto);
		
		//store 구하기
		int store_idx =watingMapper.getStore_idxWaiting(waitingDto.getWaiting_idx());
		
	     
        // 순번 업데이트
        List<WaitingDto> updatedListConfig = watingMapper.getWatingList(store_idx);   
        System.out.println("확인요방");
        System.out.println(updatedListConfig);
        int newOrder = 1;
        for (WaitingDto waiting : updatedListConfig) {
        	watingMapper.updateWaitingOrder(store_idx, waiting.getWating_order(), newOrder);
            newOrder++;
        }  
        //최종 대기 리스트 추출
        List<WaitingDto> updatedList = watingMapper.getWatingList(store_idx);
		
        System.out.println(updatedList);
		
		return updatedList;
		
	}

	@Override
	public List<WaitingDto> sendWatingList(WaitingDto waitingDto) {
		
		//해당건 현재순번으로 업데이트
		watingMapper.updateWatingList(waitingDto);
        System.out.println("확인요망합니다");
        System.out.println(waitingDto);
		//store 구하기
		int store_idx =watingMapper.getStore_idxWaiting(waitingDto.getWaiting_idx());
		List<WaitingDto> updatedList = watingMapper.getWatingList(store_idx);
		
		return updatedList;
	}

	@Override
	public void updateOnsiteUse(StoreStatusDto storeStatusDTO) {
		System.out.println("한번더 확인" + storeStatusDTO);
		watingMapper.updateOnsiteUse(storeStatusDTO);
		
	}

	@Override
	public StoreStatusDto getStoreStauts(int store_idx) {
		StoreStatusDto onsiteDto = watingMapper.getStoreStauts(store_idx);
		return onsiteDto;
	}


	
	
	
}