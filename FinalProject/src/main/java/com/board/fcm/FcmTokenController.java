package com.board.fcm;

import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping("/api")
public class FcmTokenController {

    private final FcmTokenRepository tokenRepository;

    public FcmTokenController(FcmTokenRepository tokenRepository) {
        this.tokenRepository = tokenRepository;
    }

    @PostMapping("/save-token")
    public ResponseEntity<String> saveToken(@RequestBody TokenRequest request) {
        // 토큰 저장 로직
        FcmToken fcmToken = tokenRepository.findById(request.getUserId())
                .orElse(new FcmToken());
        fcmToken.setUserId(request.getUserId());
        fcmToken.setToken(request.getToken());
        System.out.println("!!!!!!!!!!!fcmToken : "+fcmToken);

        tokenRepository.save(fcmToken);
        return ResponseEntity.ok("Token saved successfully");
    }
}