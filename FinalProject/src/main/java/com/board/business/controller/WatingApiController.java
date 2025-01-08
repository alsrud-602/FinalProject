package com.board.business.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.board.business.dto.ReservationTimeSlotDto;
import com.board.business.dto.ReservationUserDto;
import com.board.business.dto.StoreStatusDto;
import com.board.business.dto.WaitingDto;
import com.board.business.service.WaitingService;

@RestController
@RequestMapping("/api/waiting")
public class WatingApiController {
     
    @Autowired
    private WaitingService waitingService;
	
    // 대기 리스트 조회
    @GetMapping("/list")
    public List<WaitingDto> getWaitingList(@RequestParam("store_idx") int store_idx) {
        return waitingService.getWatingList(store_idx);
    }
	//현장대기 기능 사용여부
    @GetMapping("/status")
    public StoreStatusDto getStoreStatus(@RequestParam("store_idx") int store_idx) {
        return waitingService.getStoreStauts(store_idx);
    }
    
    //유저 사전예약 리스트
    @GetMapping("/advance")
    public List<ReservationUserDto> getadvanceList(@RequestParam("user_idx") int user_idx) {
        return waitingService.getadvanceList(user_idx);
    }

    //유저 현장대기 리스트
    @GetMapping("/onsite")
    public List<WaitingDto> getonSiteList(@RequestParam HashMap<String, Object> Map) {
        return waitingService.getonStieList(0);
    }
 
    //예약 확인 로직
    @GetMapping("/check")
    public List<WaitingDto> getcheckWaiting(@RequestParam("user_idx") int user_idx) {
        return waitingService.getcheckWaiting(user_idx);
    }

    @GetMapping("/timegrape")
    public  List<Map<String, Object>>  gettimegrape(@RequestParam("store_idx") int store_idx) {
        return waitingService.getTimeGrape(store_idx);
    }  
    @GetMapping("/timeslot")
    public  List<ReservationTimeSlotDto>  gettimeslot(@RequestParam("store_idx") int store_idx) {
    	return waitingService.getadvanceTimeSlotList(store_idx);
    }  
    @GetMapping("/reservationwrite")
    public  void reservationwrite(@RequestParam("store_idx") int store_idx) {
    waitingService.getReservationWrite(store_idx);
    }  
    
    
}
