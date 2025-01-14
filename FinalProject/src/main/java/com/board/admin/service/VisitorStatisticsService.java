package com.board.admin.service;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.Arrays;
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

    private List<String> getS3Logs() throws IOException {
        List<String> urlLogs = new ArrayList<>();
        List<String> paths = Arrays.asList("visitor-data/", "visitor-data-backup/"); // 처리할 경로 리스트

        for (String path : paths) {
            String s3Key = path + LocalDate.now() + ".json"; // 현재 날짜에 해당하는 파일 경로
            try {
                List<VisitorData> visitorDataList = s3ReadService.readVisitorData(s3Key).get();

                for (VisitorData data : visitorDataList) {
                    urlLogs.add(data.getUrlInfo()); // URL 정보를 리스트에 추가
                }
            } catch (InterruptedException e) {
                Thread.currentThread().interrupt();
                throw new RuntimeException("Thread was interrupted while reading Visitor Data from S3", e);
            } catch (ExecutionException e) {
                System.out.println("Execution failed for key: " + s3Key + " (skipping to next).");
            }
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
