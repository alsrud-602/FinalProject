package com.board.admin.service;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.ExecutionException;

import org.springframework.stereotype.Service;

import com.board.admin.dto.VisitorData;
import com.board.admin.repo.VisitorDataRepository;


@Service
public class VisitorStatisticsService {

    private final VisitorDataRepository repository;
    private final S3ReadService s3ReadService;

    public VisitorStatisticsService(VisitorDataRepository repository, S3ReadService s3ReadService) {
        this.repository = repository;
        this.s3ReadService = s3ReadService;
    }
    

    public long getUniqueVisitorCount(LocalDateTime startOfDay, LocalDateTime endOfDay) {
        return repository.countDistinctByVisitorIdAndVisitorTimeBetween(startOfDay, endOfDay);
    }
    
    private List<String> getDbLogs() {
        return repository.findAllUrlInfo(); // 데이터베이스에서 URL 로그 가져오기
    }

    private List<String> getS3Logs() throws IOException{
        String s3Key = "visitor-data/" + LocalDate.now() + ".json"; // S3에서 로그 파일의 경로
        List<String> urlLogs = new ArrayList<>();

        try {
            List<VisitorData> visitorDataList = s3ReadService.readVisitorData(s3Key).get();
            
            for (VisitorData data : visitorDataList) {
                urlLogs.add(data.getUrlInfo()); // `getUrl`은 VisitorData의 URL 필드 getter 메서드
            }
        } catch (InterruptedException e) {
            // InterruptedException 처리
            Thread.currentThread().interrupt();  // InterruptedException 발생 시 스레드 상태 복구
            throw new RuntimeException("Thread was interrupted while reading Visitor Data from S3", e);
        } catch (ExecutionException e) {
            // ExecutionException 처리
            throw new RuntimeException("Execution failed while reading Visitor Data from S3", e);
        }

        return urlLogs;
    }

    public List<String> getAllLogs() throws IOException {
        List<String> dbLogs = getDbLogs(); // 데이터베이스에서 로그 가져오기
        List<String> s3Logs = getS3Logs(); // S3에서 로그 가져오기

        dbLogs.addAll(s3Logs);
        return dbLogs;
    }
}
