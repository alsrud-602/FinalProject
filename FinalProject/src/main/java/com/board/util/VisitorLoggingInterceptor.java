package com.board.util;
import java.time.LocalDateTime;

import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

import com.board.admin.dto.VisitorData;
import com.board.admin.service.VisitorDataService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Component
public class VisitorLoggingInterceptor implements HandlerInterceptor {

    private final VisitorDataService visitorDataService;

    public VisitorLoggingInterceptor(VisitorDataService visitorDataService) {
        this.visitorDataService = visitorDataService;
    }

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) {
        // 방문자 데이터 수집
        String ipAddress = request.getRemoteAddr();
        String userAgent = request.getHeader("User-Agent");
        String url = request.getRequestURI();
        String sessionId = request.getSession().getId();

        String method = request.getMethod();

        if ("POST".equalsIgnoreCase(method)) {
            // POST 요청에 대한 로직 처리
            System.out.println("POST 요청이 감지되었습니다: " + request.getRequestURI());
        }
        // VisitorData 객체 생성 및 저장
        VisitorData visitorData = new VisitorData();
        visitorData.setIpAddress(ipAddress);
        visitorData.setUserAgent(userAgent);
        visitorData.setUrlInfo(url);
        visitorData.setVisitorTime(LocalDateTime.now());
        visitorData.setSessionId(sessionId);

        visitorDataService.saveVisitorData(visitorData);

        return true; // 다음 핸들러로 요청을 전달
    }
}
