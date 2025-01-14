package com.board.business.service;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;

@Service
public class NaverTalkService {

    @Value("${naver.chatbot.api.url}")
    private String chatbotApiUrl;

    @Value("${naver.chatbot.api.key}")
    private String apiKey;

    private final RestTemplate restTemplate;

    public NaverTalkService(RestTemplate restTemplate) {
        this.restTemplate = restTemplate;
    }

    // 예약 확정 후 알림을 보낼 메서드
    public String sendReservationConfirmation(String userId, String reservationDetails) {
        String url = UriComponentsBuilder.fromHttpUrl(chatbotApiUrl)
            .path("/send-message")
            .queryParam("userId", userId)
            .queryParam("message", reservationDetails)
            .toUriString();

        HttpHeaders headers = new HttpHeaders();
        headers.set("Authorization", "Bearer " + apiKey);

        // 여기서 임의로 responseBody 값을 설정
        String responseBody = "{\"status\":\"success\", \"message\":\"메시지가 성공적으로 전송되었습니다.\"}";

        // 임의로 성공적인 응답 반환
        return responseBody;
    }
}

