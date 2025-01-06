package com.board;
import java.util.List;
import java.util.stream.Collectors;

import software.amazon.awssdk.auth.credentials.ProfileCredentialsProvider;
import software.amazon.awssdk.regions.Region;
import software.amazon.awssdk.services.s3.S3Client;
import software.amazon.awssdk.services.s3.model.ListObjectsV2Request;
import software.amazon.awssdk.services.s3.model.ListObjectsV2Response;
import software.amazon.awssdk.services.s3.model.S3Object;

public class S3Example {
    public static void main(String[] args) {
        String bucketName = "website-123"; // 버킷 이름
        String prefix = "visitor-data/"; // 폴더 프리픽스

        // S3 클라이언트 생성
        Region region = Region.US_EAST_1; // 사용할 리전 설정
        S3Client s3Client = S3Client.builder()
                .region(region)
                .credentialsProvider(ProfileCredentialsProvider.create()) // AWS 자격 증명 설정
                .build();

        // 객체 목록 요청
        ListObjectsV2Request listRequest = ListObjectsV2Request.builder()
                .bucket(bucketName)
                .prefix(prefix)
                .build();

        ListObjectsV2Response listResponse = s3Client.listObjectsV2(listRequest);

        // JSON 파일 필터링
        List<String> jsonFiles = listResponse.contents().stream()
                .filter(s3Object -> s3Object.key().endsWith(".json")) // JSON 파일만 선택
                .map(S3Object::key)
                .collect(Collectors.toList());

        // 결과 출력
        jsonFiles.forEach(System.out::println);

        // S3 클라이언트 종료
        s3Client.close();
    }
}
