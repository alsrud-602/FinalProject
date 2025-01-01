package com.board.business.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

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
	

}
