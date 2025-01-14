package com.board.business.controller;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.board.business.service.NaverTalkService;
@RestController
@RequestMapping("/reservation")
public class ReservationController {

    private final NaverTalkService naverTalkService;

    public ReservationController(NaverTalkService naverTalkService) {
        this.naverTalkService = naverTalkService;
    }

    @PostMapping("/sendTestNotification")
    public ResponseEntity<String> sendTestNotification() {
        // 임의의 예약 정보 설정
        String reservationId = "testReservationId";
        String userId = "testUserId";
        String reservationDetails = "예약이 확정되었습니다. 예약 상세: 예약일: 2025-01-20, 예약 시간: 14:00";

        // Naver TalkTalk 메시지 전송
        String response = naverTalkService.sendReservationConfirmation(userId, reservationDetails);

        // 메시지 전송 결과 반환
        return ResponseEntity.ok(response);  // 응답 메시지
    }
}

