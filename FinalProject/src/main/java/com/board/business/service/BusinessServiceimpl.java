package com.board.business.service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.business.dto.ReservationDateDto;
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
	public void setReservation(HashMap<String, Object> map,String[] start_time,String[] end_time,String[] max_number,String[] rp_plan,
			                   String[] rd_plan,String[] reservation_end_date,String[] reservation_start_date  ) {
    //1. 기본정보
    businessMapper.insertReservationStore(map);
    
    // 2. 플랜별 시간대
	List<ReservationPlanDto> rpList = new ArrayList<>();
   for (int i = 0; i < rp_plan.length; i++) {
	   

       // 현재 날짜를 가져옴
       LocalDate currentDate = LocalDate.now();
        System.out.println("n번 end time" + end_time[i]);
       // 문자열을 LocalTime으로 변환
       LocalTime localTimeend = LocalTime.parse(end_time[i], DateTimeFormatter.ofPattern("HH:mm"));
       LocalTime localTimestart = LocalTime.parse(start_time[i], DateTimeFormatter.ofPattern("HH:mm"));
       // LocalDate와 LocalTime을 결합하여 LocalDateTime 생성
       LocalDateTime DateTimeEnd = LocalDateTime.of(currentDate, localTimeend);
       LocalDateTime DateTimeStart = LocalDateTime.of(currentDate, localTimestart);
       System.out.println("!!!!!!!데이트 타임 엔드"+ DateTimeEnd);  	   	   
	   
	   ReservationPlanDto rpDto = new ReservationPlanDto();
	   rpDto.setEnd_time(DateTimeEnd);
	   rpDto.setMax_number(Integer.parseInt(max_number[i]));
	   rpDto.setPlan(rp_plan[i]);
	   rpDto.setStart_time(DateTimeStart);
	   rpList.add(rpDto);
	   
	   
    }   
    
    businessMapper.insertReservationPlan(rpList);
    // 3. 예약 날짜별 플랜
    List<ReservationDateDto> rdList = new ArrayList<>();
    SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
    for (int i = 0; i < reservation_start_date.length; i++) {
        try {
            // 입력 데이터 디버깅 출력
            System.out.println("디버깅: reservation_start_date[" + i + "] = " + reservation_start_date[i]);
            System.out.println("디버깅: reservation_end_date[" + i + "] = " + reservation_end_date[i]);

            // date 형식 변환
            Date startDate = dateFormat.parse(reservation_start_date[i]);
            Date endDate = dateFormat.parse(reservation_end_date[i]);
            System.out.println("!!!!!!!startDate: " + startDate);
            System.out.println("!!!!!!!endDate: " + endDate);

            // DTO 생성 및 데이터 설정
            ReservationDateDto rdDto = new ReservationDateDto();
            rdDto.setPlan(rd_plan[i]);
            rdDto.setReservation_end_date(endDate);
            rdDto.setReservation_start_date(startDate);

            // 리스트에 추가
            rdList.add(rdDto);
            System.out.println("현재 rdList 크기: " + rdList.size());

            // 데이터베이스 삽입
            
        } catch (ParseException e) {
            System.out.println("ParseException 발생! 데이터 포맷 확인 필요.");
            e.printStackTrace();
        } catch (Exception e) {
            System.out.println("예기치 못한 오류 발생!");
            e.printStackTrace();
        }
        
    }
    
    businessMapper.insertReservationDate(rdList);
    
    
    
		
	}
	
	

}
