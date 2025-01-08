package com.board.util;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.board.admin.dto.VisitorData;
import com.board.admin.repo.VisitorDataRepository;
import com.board.admin.service.S3UploadService;
import com.board.admin.service.VisitorDataService;

@Component
public class S3UploaderScheduler {

    private final VisitorDataService visitorDataService;
    private final S3UploadService s3UploadService;

    public S3UploaderScheduler(VisitorDataService visitorDataService, S3UploadService s3UploadService) {
        this.visitorDataService = visitorDataService;
        this.s3UploadService = s3UploadService;
    }
    
    @Autowired
    private VisitorDataRepository visitorDataRepository;


    @Scheduled(fixedRate = 3600000) // 1분마다 실행

    public void uploadVisitorData() {
        String localFilePath = "visitor-data-" + LocalDate.now() + ".json";
        String s3Key = "visitor-data/" + LocalDate.now() + ".json";

        try {
        	List<VisitorData> allData = visitorDataRepository.findAll();
        	System.out.println("Visitor Data in DB: " + allData);
            visitorDataService.saveToFile(localFilePath);
            s3UploadService.uploadFile(localFilePath, s3Key);
            System.out.println("Data uploaded to S3: " + s3Key);
        } catch (IOException e) {
            System.err.println("Failed to upload visitor data: " + e.getMessage());
        }
    }
}
