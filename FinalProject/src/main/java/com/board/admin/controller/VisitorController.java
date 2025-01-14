package com.board.admin.controller;
import java.io.IOException;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.CompletableFuture;
import java.util.function.BiFunction;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.board.admin.dto.VisitorData;
import com.board.admin.service.S3ReadService;
import com.board.admin.service.VisitorDataService;
import com.board.admin.service.VisitorStatisticsService;

import software.amazon.awssdk.services.s3.S3AsyncClient;
import software.amazon.awssdk.services.s3.model.ListObjectsV2Request;
import software.amazon.awssdk.services.s3.model.S3Object;



@RestController
@RequestMapping("/Stats")
public class VisitorController {

    private final VisitorDataService visitorDataService;

    public VisitorController(VisitorDataService visitorDataService) {
        this.visitorDataService = visitorDataService;
    }
    
    @Autowired
    private VisitorStatisticsService visitorStatisticsService;

    @Autowired
    private S3ReadService s3ReadService;
    
    @Autowired
    private S3AsyncClient s3AsyncClient;
    
    private final Logger logger = LoggerFactory.getLogger(VisitorController.class);


    /*
    @PostMapping("/visitor")
    public void collectVisitorData(HttpServletRequest request) {
        // 방문자의 IP 주소 및 요청 정보를 가져옵니다.
        String ipAddress = request.getRemoteAddr();
        String userAgent = request.getHeader("User-Agent");
        String urlInfo = request.getRequestURI();
        String sessionId = request.getSession().getId(); // 세션 ID로 비로그인 사용자를 구분

        // VisitorData 객체 생성
        VisitorData visitorData = new VisitorData();
        visitorData.setIpAddress(ipAddress);
        visitorData.setUserAgent(userAgent);
        visitorData.setUrlInfo(urlInfo);
        visitorData.setVisitorTime(LocalDateTime.now());
        visitorData.setSessionId(sessionId);

        // 데이터베이스에 저장
        visitorDataService.saveVisitorData(visitorData);
    }
    */

    //방문자수
    @GetMapping("/count")
    public long getVisitorCount(@RequestParam String start, @RequestParam String end) {
        LocalDateTime startTime = LocalDateTime.parse(start);
        LocalDateTime endTime = LocalDateTime.parse(end);
        
        Long vistiorCount = visitorStatisticsService.getUniqueVisitorCount(startTime, endTime);
        
        return vistiorCount;
    }
    
    @GetMapping("/recent-week-visitors")
    public CompletableFuture<Object> getRecentWeekVisitors() {
        Map<String, Long> dailyVisitors = new LinkedHashMap<>();
        LocalDateTime now = LocalDateTime.now();

        // 최근 한달간의 날짜 범위 생성
        for (int i = 31; i >= 0; i--) {
            LocalDateTime startOfDay = now.minusDays(i).toLocalDate().atStartOfDay();
            LocalDateTime endOfDay = startOfDay.plusDays(1).minusSeconds(1);

            // 특정 날짜의 방문자 수 가져오기
            long visitorCount = visitorStatisticsService.getUniqueVisitorCount(startOfDay, endOfDay);
            String formattedDate = startOfDay.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));

            dailyVisitors.put(formattedDate, visitorCount);
        }

        String bucketName = "website-123";
        String prefix = "visitor-data/"; // 폴더 프리픽스

        ListObjectsV2Request listRequest = ListObjectsV2Request.builder()
                .bucket(bucketName)
                .prefix(prefix)
                .build();

        return s3AsyncClient.listObjectsV2(listRequest)
                .thenCompose(listResponse -> {
                    // JSON 파일 필터링
                    List<String> jsonFiles = new ArrayList<>();
                    for (S3Object s3Object : listResponse.contents()) {
                        if (s3Object.key().endsWith(".json")) { // JSON 파일만 선택
                            jsonFiles.add(s3Object.key());
                        }
                    }

                    // S3 데이터 처리
                    List<CompletableFuture<Void>> futures = new ArrayList<>();
                    for (String jsonFile : jsonFiles) {
                        futures.add(processS3Data(jsonFile, dailyVisitors, now));
                    }

                    // 모든 비동기 작업 완료 후 결과 반환
                    return CompletableFuture.allOf(futures.toArray(new CompletableFuture[0]))
                            .thenApply(v -> dailyVisitors);
                });
    }

    private CompletableFuture<Void> processS3Data(String jsonFile, Map<String, Long> dailyVisitors, LocalDateTime now) {
        // S3에서 방문자 데이터 읽기
        CompletableFuture<List<VisitorData>> futureVisitorData = s3ReadService.readVisitorData(jsonFile);

        CompletableFuture<Void> resultFuture = futureVisitorData.handle(new BiFunction<List<VisitorData>, Throwable, Void>() {
            @Override
            public Void apply(List<VisitorData> s3VisitorDataList, Throwable throwable) {
                if (throwable != null) {
                    System.err.println("S3 데이터 처리 중 오류 발생: " + jsonFile + "오류내용: " + throwable.getMessage());
                    return null;
                }

                Map<String, Long> s3DataMap = new LinkedHashMap<>();
                for (VisitorData data : s3VisitorDataList) {
                    LocalDateTime visitTime = data.getVisitorTime(); // VisitorData의 방문 시간
                    if (visitTime.isAfter(now.minusMonths(1)) && visitTime.isBefore(now.plusDays(1))) {
                        String dateKey = visitTime.toLocalDate().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
                        // 해당 날짜에 대한 카운트를 증가시킴
                        if (s3DataMap.containsKey(dateKey)) {
                            s3DataMap.put(dateKey, s3DataMap.get(dateKey) + 1);
                        } else {
                            s3DataMap.put(dateKey, 1L);
                        }
                    }
                }

                // 기존 데이터와 병합
                for (Map.Entry<String, Long> entry : s3DataMap.entrySet()) {
                    String date = entry.getKey();
                    Long s3Count = entry.getValue();
                    // dailyVisitors에 존재하는 경우 합산, 존재하지 않는 경우 새로운 항목 추가
                    if (dailyVisitors.containsKey(date)) {
                        dailyVisitors.put(date, dailyVisitors.get(date) + s3Count);
                    } else {
                        dailyVisitors.put(date, s3Count);
                    }
                }

                return null; // 정상적으로 처리된 경우 null 반환
            }
        });

        return resultFuture; // 명시적으로 변수로 반환
    }
    
    @GetMapping("/mainTraffic")
    public Map<String, Integer> getPageTrafficData() throws IOException {
    	List<String> allLogs = visitorStatisticsService.getAllLogs(); // URL 로그 가져오기

        // 페이지별 트래픽 데이터 초기화
        Map<String, Integer> pageTraffic = new HashMap<>();
        pageTraffic.put("메인", 0);
        pageTraffic.put("검색", 0);
        pageTraffic.put("지도", 0);
        pageTraffic.put("프로필", 0);
        pageTraffic.put("팝콘팩토리 및 지갑", 0);
        pageTraffic.put("예약", 0);
        pageTraffic.put("스토어 상세페이지", 0);
        pageTraffic.put("회원가입 및 로그인 호출", 0);

        // URL 패턴에 따른 분류
        for (String log : allLogs) {
            if (log.equals("/") || log.startsWith("/Users/Main")) {
                pageTraffic.put("메인", pageTraffic.get("메인") + 1);
            } else if (log.contains("/Users/Mainsearch") || log.contains("/Users/Regionfilter") || log.contains("/Users/Rankdetail") || log.contains("/Users/Opendetail") || log.contains("/Users/Ongoingdetail")) {
                pageTraffic.put("검색", pageTraffic.get("검색") + 1);
            } else if (log.startsWith("/Users/Map")) {
                pageTraffic.put("지도", pageTraffic.get("지도") + 1);
            } else if (log.startsWith("/Users/Profile")) {
                pageTraffic.put("프로필", pageTraffic.get("프로필") + 1);
            } else if (log.startsWith("/Users/RouteRecommend") || log.startsWith("/Users/Wallet")) {
                pageTraffic.put("팝콘팩토리 및 지갑", pageTraffic.get("팝콘팩토리 및 지갑") + 1);
            } else if (log.contains("/Reservation")) {
                pageTraffic.put("예약", pageTraffic.get("예약") + 1);
            } else if(log.contains("/Users/Info") || log.contains("/Users/ReviewDetail")||log.contains("/Users/Writeform")|log.contains("/Users/Write")|log.contains("/Users/Updateform")|log.contains("/Users/Update")||log.contains("/Users/Delete")){
                pageTraffic.put("스토어 상세페이지", pageTraffic.get("스토어 상세페이지") + 1);
            } else if(log.equals("/Users/Login")||log.equals("/Users/Signup")) {
            	pageTraffic.put("회원가입 및 로그인 호출", pageTraffic.get("회원가입 및 로그인 호출") + 1);
            }
        }

        return pageTraffic;
    }
    
    @GetMapping("/businessTraffic")
    public Map<String, Integer> getBTrafficData() throws IOException {
    	List<String> allLogs = visitorStatisticsService.getAllLogs(); // URL 로그 가져오기
    	
    	// 페이지별 트래픽 데이터 초기화
    	Map<String, Integer> pageTraffic = new HashMap<>();
    	pageTraffic.put("관리", 0);
    	pageTraffic.put("사전예약 운영", 0);
    	pageTraffic.put("현장 운영", 0);
    	pageTraffic.put("현장 대기", 0);
    	pageTraffic.put("관리자 요청", 0);
    	pageTraffic.put("회원가입 및 로그인", 0);
    	
    	// URL 패턴에 따른 분류
    	for (String log : allLogs) {
    		if (log.startsWith("/Business/Registraion")) {
    			pageTraffic.put("관리", pageTraffic.get("관리") + 1);
    		} else if (log.endsWith("/Reservation/Date") || log.endsWith("/Reservation/UserView")) { //write에서 사전예약
    			pageTraffic.put("사전예약 운영", pageTraffic.get("사전예약 운영") + 1);
    		} else if (log.startsWith("/Users/Map")) {
    			pageTraffic.put("현장 운영", pageTraffic.get("현장 운영") + 1);
    		} else if (log.startsWith("/Users/Profile") && !log.startsWith("/Users/Profile/Reservation")) {
    			pageTraffic.put("관리자 요청", pageTraffic.get("관리자 요청") + 1);
    		} else if (log.startsWith("/CompanyAuth/Login") || log.startsWith("/CompanyAuth/Signup")) {
    			pageTraffic.put("회원가입 및 로그인", pageTraffic.get("회원가입 및 로그인") + 1);
    		} else if (log.startsWith("/Users/Profile/Reservation")) {//현장 대기 운영
    			pageTraffic.put("현장 대기", pageTraffic.get("현장 대기") + 1);
    		}
    	}
    	
    	return pageTraffic;
    }

     //수동 오래된 데이터를 S3에 백업하고 데이터베이스에서 삭제
    @PostMapping("/backup")
    public String backupOldVisitorData() {
        try {
            visitorDataService.backupAndDeleteOldData();
            return "Old visitor data successfully backed up to S3.";
        } catch (Exception e) {
            return "Failed to backup visitor data: " + e.getMessage();
        }
    }
}
