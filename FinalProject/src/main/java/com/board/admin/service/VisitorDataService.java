package com.board.admin.service;

import java.io.File;
import java.io.IOException;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

import org.springframework.stereotype.Service;

import com.board.admin.dto.VisitorData;
import com.board.admin.repo.VisitorDataRepository;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

@Service
public class VisitorDataService {

    private final VisitorDataRepository repository;
    private final S3UploadService s3UploadService;
    private final ObjectMapper objectMapper = new ObjectMapper();

    public VisitorDataService(VisitorDataRepository repository, S3UploadService s3UploadService) {
        this.repository = repository;
        this.s3UploadService = s3UploadService;
    }

    private final List<VisitorData> visitorDataList = new ArrayList<>();


    public void backupAndDeleteOldData() throws IOException {
        LocalDateTime oneMonthAgo = LocalDateTime.now().minusDays(1);//하루 전 파일 삭제
        List<VisitorData> oldData = repository.findByVisitorTimeBefore(oneMonthAgo);
        System.out.println("oldData:HOW"+oldData);

        if (!oldData.isEmpty()) {
            // JSON 파일로 저장
            File tempFile = new File("old-visitor-data.json");
            if (tempFile.exists()) {
                System.out.println("파일이 성공적으로 생성되었습니다.");
            } else {
                System.out.println("파일이 생성되지 않았습니다.");
            }
            try {
                objectMapper.writeValue(tempFile, oldData);
            } catch (IOException e) {
                e.printStackTrace(); // 예외 메시지 출력
            }

            // S3로 업로드
            String s3Key = "visitor-data-backup/" + LocalDate.now() + ".json";
            s3UploadService.uploadFile(tempFile.getAbsolutePath(), s3Key);

            // 로컬 파일 삭제
            tempFile.delete();

            // 데이터베이스에서 삭제
            repository.deleteAll(oldData);
        }
    }

    public void saveVisitorData(VisitorData visitorData) {
    	repository.save(visitorData);
    	visitorDataList.add(visitorData);
    }
    
    public void saveToFile(String filePath) throws IOException {
    	
        List<VisitorData> data = repository.findAll();
        
        System.out.println("흠냐링"+visitorDataList);

        // 데이터 검증
        if (data.isEmpty()) {
            System.out.println("No visitor data to save.");
            return;
        }
        File file = new File(filePath);
        objectMapper.registerModule(new JavaTimeModule()); // Java 8 날짜/시간 모듈 등록
        objectMapper.writeValue(file, visitorDataList);
        visitorDataList.clear(); // 업로드 후 리스트 초기화
    }

	public void deleteToFile(String localFilePath) {
        

        File file = new File(localFilePath);
        file.delete(); // 업로드 후 리스트 초기화
		
	}
    
}
