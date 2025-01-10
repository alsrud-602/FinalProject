package com.board.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.board.store.service.InstagramApiService;
import com.fasterxml.jackson.databind.JsonNode;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class StoreController {

	@Autowired
	private InstagramApiService instagramApiService;


    @GetMapping("/stores/search-multiple-tags")
    public ResponseEntity<?> searchMultipleTags() {
        try {
            // 고정된 해시태그 설정
            String tag1 = "루피"; // 첫 번째 해시태그
            String tag2 = "팝업스토어"; // 두 번째 해시태그

            // 각 태그의 ID 검색
            String tag1Id = instagramApiService.searchHashtag(tag1);
            String tag2Id = instagramApiService.searchHashtag(tag2);

            // 각 태그의 미디어 데이터 가져오기 (페이징 제거)
            List<JsonNode> tag1Media = instagramApiService.getHashtagData(tag1Id);
            List<JsonNode> tag2Media = instagramApiService.getHashtagData(tag2Id);

            // 공통된 미디어 필터링
            List<JsonNode> filteredMedia = instagramApiService.filterMediaByTags(tag1Media, tag2Media);

            return ResponseEntity.ok(filteredMedia);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
        }
    }


}