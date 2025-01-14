package com.board.fcm;

import java.util.concurrent.ExecutionException;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class NotificationController {

    private final FcmService fcmService;
    private final FcmTokenRepository tokenRepository;

    public NotificationController(FcmService fcmService, FcmTokenRepository tokenRepository) {
        this.fcmService = fcmService;
        this.tokenRepository = tokenRepository;
    }

    @PostMapping("/send-notification")
    public ResponseEntity<String> sendNotification(@RequestParam String userId) throws InterruptedException, ExecutionException {
        FcmToken token = tokenRepository.findById(userId)
                .orElseThrow(() -> new RuntimeException("User not found"));

        fcmService.sendNotification(token.getToken(), "예약 알림", "예약 날짜를 확인하세요!");
        return ResponseEntity.ok("Notification sent");
    }
}

