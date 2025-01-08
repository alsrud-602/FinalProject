package com.board.admin.controller;



import java.io.IOException;
import java.net.MalformedURLException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.io.Resource;
import org.springframework.core.io.UrlResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.board.business.dto.RequestDto;
import com.board.business.dto.StoreDto;
import com.board.business.service.BusinessService;


@RestController
public class AdminStoreApiController {
     
	@Value("${part4.upload-path}")	
	private String uploadPath;

	@Autowired
	private  BusinessService businessService;

	
    // private final String uploadDir = "C:/Users/Admin/Desktop/dev/data/";
     
    @GetMapping("/Image/Read")
    public ResponseEntity<Resource> getImage(@RequestParam("path") String imagePath) throws IOException {
    	 
        try {
            // 이미지 파일의 절대 경로
            Path filePath = Paths.get(uploadPath).resolve(imagePath).normalize();
           
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
	
    @RequestMapping("/Approval/Update")
    public ResponseEntity<Map<String, String>> approvalUpdate(@RequestBody StoreDto storeDto) {
        StoreDto sDto = businessService.ApprovalUpdate(storeDto);
        String msg = sDto.getStatus();
        
        Map<String, String> response = new HashMap<>();
        response.put("message", msg); // msg를 JSON 객체의 필드로 추가

        return ResponseEntity.ok(response); // 200 OK와 함께 JSON 응답 반환
    }

    @RequestMapping("/Approval/Ban")
    public ResponseEntity<Map<String, String>> approvalBan(@RequestBody StoreDto storeDto) {
        StoreDto sDto = businessService.ApprovalBan(storeDto);
        String msg = sDto.getBan();
        
        Map<String, String> response = new HashMap<>();
        response.put("status", msg); // msg를 JSON 객체의 필드로 추가

        return ResponseEntity.ok(response); // 200 OK와 함께 JSON 응답 반환
    }
    
    @RequestMapping("/Request/Response")
    public ResponseEntity<Map<String, String>> Response(@RequestBody RequestDto requestDto) {
    	System.out.println(requestDto);
    	RequestDto rDto = businessService.UpdateResponse(requestDto);
        String msg = rDto.getResponse();
        Map<String, String> response = new HashMap<>();
        response.put("msg", msg); // msg를 JSON 객체의 필드로 추가

        return ResponseEntity.ok(response); // 200 OK와 함께 JSON 응답 반환
    }
    
    @RequestMapping("/Request/Request")
    public ResponseEntity<Map<String, Object>> Request(@RequestBody RequestDto requestDto) {
    	System.out.println(requestDto);
    	RequestDto rDto = businessService.getRequest(requestDto.getRequest_idx());
    	Map<String, Object> response = new HashMap<>();
    	response.put("rDto", rDto); // msg를 JSON 객체의 필드로 추가
    	
    	return ResponseEntity.ok(response); // 200 OK와 함께 JSON 응답 반환
    }
   

}