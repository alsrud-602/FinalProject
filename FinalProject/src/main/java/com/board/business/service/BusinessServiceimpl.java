package com.board.business.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.business.dto.ReservationPlanDto;
import com.board.business.dto.StoreTagDto;
import com.board.business.mapper.BusinessMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BusinessServiceimpl  implements BusinessService{
	
	
	@Autowired
	private BusinessMapper businessMapper;
	
	@Override
	public void setRegistration(HashMap<String, Object> map, String[] tag_name) {
	
	//1. 기본정보	
    businessMapper.insertStore(map);
    //2. 상세정보
    businessMapper.insertStoreDetail(map);   
    //3. 태그 정보
	List<StoreTagDto> TagList = new ArrayList<>();
    for (String tag : tag_name) {
    	StoreTagDto tagDto = new StoreTagDto(tag);
    	TagList.add(tagDto);           
    }   
    businessMapper.insertStoreTage(TagList);
	//4. 운영정보
    businessMapper.insertStoreOperation(map);
    //5. 카테고리
    
    //6. 파일정보
    
	}

	@Override
	public void setReservation(HashMap<String, Object> map,List<ReservationPlanDto> rpList) {
    //1. 기본정보
    businessMapper.insertReservationStore(map);
    
    // 2. 플랜별 시간대
    for (ReservationPlanDto rp : rpList) {
        // 현재 날짜와 LocalTime을 결합하여 LocalDateTime 생성
        LocalDateTime startDateTime = LocalDateTime.of(LocalDate.now(), rp.getStart_time());
        LocalDateTime endDateTime = LocalDateTime.of(LocalDate.now(), rp.getEnd_time());
        
        // 변환된 LocalDateTime을 출력 (디버깅용)
        System.out.println("Start DateTime: " + startDateTime);
        System.out.println("End DateTime: " + endDateTime);
        
        // 필요에 따라 rp 객체에 LocalDateTime을 설정할 수 있습니다.
        rp.setStart_dateTime(startDateTime); 
        rp.setEnd_dateTime(endDateTime); 
    }   
    
    businessMapper.insertReservationPlan(rpList);
    // 3. 예약 날짜별 플랜
    	
		
	}
	
	

}
