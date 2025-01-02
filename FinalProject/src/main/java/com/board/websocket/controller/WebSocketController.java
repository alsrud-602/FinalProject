package com.board.websocket.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;

import com.board.business.dto.WaitingDto;
import com.board.business.mapper.WatingMapper;
import com.board.business.service.WaitingService;

@Controller
public class WebSocketController {
	@Autowired
	private WatingMapper watingMapper;
	@Autowired
	private WaitingService waitingService;
    @Autowired
    private SimpMessagingTemplate messagingTemplate;
	   // 대기 리스트 업데이트 메시지
    @MessageMapping("/Waiting/Update") // 클라이언트가 보낼 경로
    public void updateWaitingList(WaitingDto waitingDto) {
        System.out.println("확인이요");
        System.out.println(waitingDto);

        // 대기 리스트를 데이터베이스에 저장
        waitingService.insertWatingList(waitingDto);

        // 저장 후, 해당 가게의 대기 리스트를 가져옴
        List<WaitingDto> updatedList = waitingService.getWatingList(waitingDto.getStore_idx());

        // 특정 구독 경로로 메시지 전송
        String topic = "/topic/Waiting/" + waitingDto.getStore_idx();
        messagingTemplate.convertAndSend(topic, updatedList);
    }
 
    
    @MessageMapping("/Waiting/Delete") // 클라이언트가 보낼 경로
    public void deleteWaitingList(WaitingDto waitingDto) {
        System.out.println("확인이요");
        System.out.println(waitingDto);

        // 해당 번호 업데이트(방문완료,노쇼,취소)
        List<WaitingDto> updatedList =  waitingService.updateWatingList(waitingDto);
        int store_idx =watingMapper.getStore_idxWaiting(waitingDto.getWaiting_idx());
        // 특정 구독 경로로 메시지 전송
        String topic = "/topic/Waiting/" + store_idx;
        messagingTemplate.convertAndSend(topic, updatedList);
    }    
    
    
    @MessageMapping("/Store/Status") 
    @SendTo("/topic/StoreStatus/{storeIdx}") 
    public String  updateWaitingStatus(String message) {
 	
        return message;
    }
    
    
}
