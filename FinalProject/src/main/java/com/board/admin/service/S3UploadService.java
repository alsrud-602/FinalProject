package com.board.admin.service;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.board.admin.dto.VisitorData;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;

import software.amazon.awssdk.core.async.AsyncRequestBody;
import software.amazon.awssdk.core.async.AsyncResponseTransformer;
import software.amazon.awssdk.services.s3.S3AsyncClient;
import software.amazon.awssdk.services.s3.model.GetObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectRequest;
import software.amazon.awssdk.services.s3.model.PutObjectResponse;

@Service
public class S3UploadService {

    @Value("${aws.s3.bucket-name}")
    private String bucketName;

    private final S3AsyncClient amazonS3;

    public S3UploadService(S3AsyncClient amazonS3) {
        this.amazonS3 = amazonS3;
    }
    
    @Autowired
    private ObjectMapper objectMapper;

    
    public CompletableFuture<PutObjectResponse> uploadFile(String filePath, String s3Key) {
        File file = new File(filePath);



        CompletableFuture<List<VisitorData>> existingDataFuture = amazonS3.getObject(
                GetObjectRequest.builder().bucket(bucketName).key(s3Key).build(),
                AsyncResponseTransformer.toBytes()
        ).thenApply(responseBytes -> parseVisitorData(responseBytes.asByteArray()))
         .exceptionally(ex -> {
             System.out.println("No existing data found or error occurred: " + ex.getMessage());
             return new ArrayList<>();
         });


        // Step 2: 새 데이터 읽기
        List<VisitorData> newData;
        try {
            // TypeReference를 사용하여 새 데이터를 읽음
            newData = objectMapper.readValue(file, new TypeReference<List<VisitorData>>() {});
        } catch (IOException e) {
            throw new RuntimeException("Failed to read new data from file: " + e.getMessage(), e);
        }

        // Step 3: 기존 데이터와 새 데이터를 병합
        return existingDataFuture.thenCompose(existingData -> {
            existingData.addAll(newData); // 기존 데이터와 새 데이터 병합

            // 병합된 데이터를 JSON 문자열로 변환
            String mergedDataJson;
            try {
                mergedDataJson = objectMapper.writeValueAsString(existingData);
            } catch (JsonProcessingException e) {
                throw new RuntimeException("Failed to serialize merged data: " + e.getMessage(), e);
            }

            // Step 4: 병합된 데이터를 S3에 업로드
            PutObjectRequest putObjectRequest = PutObjectRequest.builder()
                    .bucket(bucketName)
                    .key(s3Key)
                    .build();

            return amazonS3.putObject(putObjectRequest, AsyncRequestBody.fromString(mergedDataJson))
                    .exceptionally(ex -> {
                        System.err.println("Failed to upload file: " + ex.getMessage());
                        return null;
                    });
        });
    }
    private List<VisitorData> parseVisitorData(byte[] data) {
        try {
            return objectMapper.readValue(data, new TypeReference<List<VisitorData>>() {});
        } catch (IOException e) {
            System.err.println("Failed to parse visitor data: " + e.getMessage());
            return new ArrayList<>();
        }
    }
    


}
