package com.board.business.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.board.business.dto.ReservationDateListDto;
import com.board.business.dto.ReservationUserListDto;
import com.board.business.service.BusinessService;

@RestController
public class BusinessApiController {
     
	@Autowired
	private BusinessService businessService;
	
	@RequestMapping("/Reservation/Date")
	public ResponseEntity<List<ReservationDateListDto>> reservationDate(@RequestParam HashMap<String, Object> map) {
	
		List <ReservationDateListDto> rdList = businessService.getReservationDateList(map);		
		
		System.out.println("확인" + map.get("rs_idx"));
		System.out.println("확인year" + map.get("year"));
		System.out.println("확인month" + map.get("month"));
		System.out.println("확인day" + map.get("day"));
		return    ResponseEntity.status(HttpStatus.OK).body( rdList );
	}
	
	@RequestMapping("/Reservation/UserView")
	public ResponseEntity<List<ReservationUserListDto>> reservationUserView(@RequestParam HashMap<String, Object> map) {
	
		List <ReservationUserListDto> ruList = businessService.getReservationUserList(map);		
		
		System.out.println("확인" + map.get("rp_idx"));
		System.out.println("확인" + map.get("rs_idx"));
		System.out.println("확인year" + map.get("date"));
;
		return    ResponseEntity.status(HttpStatus.OK).body( ruList );
	}	
	

}
