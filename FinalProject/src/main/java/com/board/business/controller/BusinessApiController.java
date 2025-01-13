package com.board.business.controller;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
		return    ResponseEntity.status(HttpStatus.OK).body( rdList );
	}
	
	@RequestMapping("/Reservation/UserView")
	public ResponseEntity<List<ReservationUserListDto>> reservationUserView(@RequestParam HashMap<String, Object> map) {
	
		List <ReservationUserListDto> ruList = businessService.getReservationUserList(map);		
		
		return    ResponseEntity.status(HttpStatus.OK).body( ruList );
	}	
	@PostMapping("/Reservation/MaxNum/Update")
	public ResponseEntity<Integer> reservationMaxNum(@RequestBody HashMap<String, Object> map) {
		
		System.out.println("확인rp_idx" + map.get("rp_idx"));
		Integer UpdateNum = businessService.updateMaxNumer(map);		
		System.out.println("확인UpdateNum" + UpdateNum);
		
		return    ResponseEntity.status(HttpStatus.OK).body( UpdateNum );
	}	
	

}
