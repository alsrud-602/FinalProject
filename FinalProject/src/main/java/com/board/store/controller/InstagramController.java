package com.board.store.controller;

import java.io.IOException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.board.store.service.InstagramFeedService;

@RestController
@RequestMapping("/instagram")
public class InstagramController {

    @Autowired
    private InstagramFeedService instagramFeedService;

    /*
    @Autowired
    private InstagramScraperService instagramScraperService;
    
    public InstagramController(InstagramScraperService instagramScraperService) {
        this.instagramScraperService = instagramScraperService;
        // 초기화 코드가 있다면 여기서 확인
    }
    */
    
    private final Logger logger = LoggerFactory.getLogger(InstagramController.class);

    @GetMapping("/{username}")
    public ResponseEntity<?> getInstagramFeed(@PathVariable String username) {
        try {
            List<String> images = instagramFeedService.fetchInstagramFeed(username);
            if (images.isEmpty()) {
                // Instagram에 게시물이 없을 경우
                return ResponseEntity.noContent().build();
            }
            return ResponseEntity.ok(images);
        } catch (IOException e) {
            // 예외 발생 시 500 상태 코드와 에러 메시지 반환
            return ResponseEntity.status(500).body("Instagram 데이터를 가져오는 중 오류가 발생했습니다: " + e.getMessage());
        } catch (Exception e) {
            // 예상치 못한 예외 처리
            return ResponseEntity.status(500).body("알 수 없는 오류가 발생했습니다: " + e.getMessage());
        }
    }
    
/*
    @GetMapping("/scrape")
    public Map<String, Object> scrapeInstagram(@RequestParam String username, @RequestParam String password) {
        try {
            // InstagramScraperService를 통해 이미지 URL 목록 가져오기
            Map<String, Object> posts = Map.of("data", instagramScraperService.scrapeInstagramData(username, password));
            
            // 이미지 URL 목록 출력
            System.out.println("가져온 Instagram 이미지 URL 목록:");
                System.out.println(posts);

            return posts; // 클라이언트에게 반환
        } catch (Exception e) {
            e.printStackTrace();
            // 오류 발생 시 빈 목록 반환
            logger.info("오류발생:",e);
            return null;
        }
    }
*/
}
