package com.board.admin.service;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.CompletableFuture;

import org.springframework.stereotype.Service;

import com.board.admin.dto.VisitorData;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import software.amazon.awssdk.core.async.AsyncResponseTransformer;
import software.amazon.awssdk.services.s3.S3AsyncClient;
import software.amazon.awssdk.services.s3.model.GetObjectRequest;

@Service
public class S3ReadService {

    private final S3AsyncClient  amazonS3;
    private final ObjectMapper objectMapper = new ObjectMapper();

    public S3ReadService(S3AsyncClient amazonS3) {
        this.amazonS3 = amazonS3;
    }

    public CompletableFuture<List<VisitorData>> readVisitorData(String s3Key) {
        GetObjectRequest getObjectRequest = GetObjectRequest.builder()
                .bucket("website-123")
                .key(s3Key)
                .build();

        return amazonS3.getObject(getObjectRequest, AsyncResponseTransformer.toBytes())
                .thenApply(responseBytes -> {
                    try {
                        ObjectMapper objectMapper = new ObjectMapper();
                        objectMapper.registerModule(new JavaTimeModule()); // Java 8 날짜/시간 모듈 등록
                        return objectMapper.readValue(responseBytes.asByteArray(), new TypeReference<List<VisitorData>>() {});
                    } catch (IOException e) {
                        throw new RuntimeException("Failed to read Visitor Data", e);
                    }
                });
    }
    
    public CompletableFuture<List<VisitorData>> readBackupData(String s3Key) throws IOException {
        GetObjectRequest getObjectRequest = GetObjectRequest.builder()
                .bucket("website-123")
                .key(s3Key)
                .build();

        return amazonS3.getObject(getObjectRequest, AsyncResponseTransformer.toBytes())
                .thenApply(responseBytes -> {
                    try {
                        return objectMapper.readValue(responseBytes.asByteArray(), new TypeReference<List<VisitorData>>() {});
                    } catch (IOException e) {
                        throw new RuntimeException("Failed to read Backup Data", e);
                    }
                });
    }


}
