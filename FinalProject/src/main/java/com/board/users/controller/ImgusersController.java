package com.board.users.controller;

import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;



@RestController
public class ImgusersController {

   @Value("${part4.upload-path}")   
   private String uploadPath;
   

   
    // private final String uploadDir = "C:/Users/Admin/Desktop/dev/data/";
     
    @GetMapping("/image/read")
    public ResponseEntity<Resource> getImage(@RequestParam("path") String image_path) throws IOException {
        
        try {
            // 이미지 파일의 절대 경로
        	System.out.println("파일경로:"+image_path);
            Path filePath = Paths.get(uploadPath).resolve(image_path).normalize();
            System.out.println("파일경로2:"+filePath);
           
            Resource resource = new UrlResource(filePath.toUri());
                       
            // 파일의 MIME 타입 동적으로 설정
            String contentType = Files.probeContentType(filePath);
            if (contentType == null) {
                contentType = "application/octet-stream"; // 기본값 설정
            }    
            if (resource.exists() && resource.isReadable()) {
                // 파일이 존재하고 읽을 수 있는 경우 이미지 반환
                HttpHeaders headers = new HttpHeaders();
                headers.add(HttpHeaders.CONTENT_TYPE, contentType); // 이미지 타입 지정 (예: jpeg)
                return new ResponseEntity<>(resource, headers, HttpStatus.OK);
            } else {
                // 파일이 없는 경우 404 응답
                return ResponseEntity.notFound().build();
            }
        } catch (MalformedURLException e) {
            return ResponseEntity.internalServerError().build();
        }
    }
    }