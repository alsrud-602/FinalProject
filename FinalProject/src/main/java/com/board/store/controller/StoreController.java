package com.board.store.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.board.store.service.ClaudeService;
import com.board.store.service.InstagramApiService;
import com.fasterxml.jackson.databind.JsonNode;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api")
@RequiredArgsConstructor
public class StoreController {

   // @Autowired
    //private StoreService storeService;

    //@Autowired
    //private InstagramService instagramService;

	@Autowired
	private InstagramApiService instagramApiService;

    private final ClaudeService claudeService;

    @GetMapping("/stores/search-multiple-tags")
    public ResponseEntity<?> searchMultipleTags() {
        try {
            // 고정된 해시태그 설정
            String tag1 = "팝업"; // 첫 번째 해시태그
            String tag2 = "팝업스토어"; // 두 번째 해시태그

            // 각 태그의 ID 검색
            String tag1Id = instagramApiService.searchHashtag(tag1);
            String tag2Id = instagramApiService.searchHashtag(tag2);

            // 각 태그의 페이징 처리된 미디어 데이터 가져오기
            List<JsonNode> tag1Media = instagramApiService.getHashtagDataWithPaging(tag1Id);
            List<JsonNode> tag2Media = instagramApiService.getHashtagDataWithPaging(tag2Id);

            // 공통된 미디어 필터링
            List<JsonNode> filteredMedia = instagramApiService.filterMediaByTags(tag1Media, tag2Media);

            return ResponseEntity.ok(filteredMedia);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
        }
    }

/*
    @GetMapping("/stores/search-multiple-tags")
    public ResponseEntity<List<Map<String, Object>>> searchMultipleTags(
            @RequestParam(required = false, defaultValue = "20") int limit) {

        String accessToken = "EAAgv2Y0sTBgBOy2odpCpZBgFYbWfESwFIZCVvmvcLmiXPLTMxprwinT71zMJhHW3jlmb8xZBseCmHCB97VVv5gooSUpB9ZANbIiDmIxaZAQNtEa9qOhjgaKgfJr75uZCLh5xuKjawES7J2kdrlAIdh5TnY1jg01e9ahkHJGiZCZALeZCvi7Yo9qTFROSchQZDZD"; // 여기에 실제 토큰을 입력하세요
        List<Map<String, Object>> combinedResults = new ArrayList<>();

        // 해시태그 ID를 가져옵니다.
        // 고정된 해시태그 설정
        String tag1 = "팝업"; // 첫 번째 해시태그
        String tag2 = "팝업스토어"; // 두 번째 해시태그
        String hashtagId1 = getHashtagId(tag1, accessToken);
        String hashtagId2 = getHashtagId(tag2, accessToken);

        // 첫 번째 태그 데이터를 가져옵니다.
        List<Map<String, Object>> tag1Results = fetchPagedData(hashtagId1, accessToken, limit);
        combinedResults.addAll(tag1Results);

        // 두 번째 태그 데이터를 가져옵니다.
        List<Map<String, Object>> tag2Results = fetchPagedData(hashtagId2, accessToken, limit);
        combinedResults.addAll(tag2Results);

        return ResponseEntity.ok(combinedResults);
    }

    private String getHashtagId(String hashtagName, String accessToken) {
        String url = "https://graph.facebook.com/v21.0/ig_hashtag_search?user_id={userId}&q={hashtag}&access_token={accessToken}";
        Map<String, String> uriVariables = Map.of(
                "userId", "17841471687886491", // 실제 사용자 ID 입력
                "hashtag", hashtagName,
                "accessToken", accessToken
        );

        Map<String, Object> response = restTemplate.getForObject(url, Map.class, uriVariables);
        List<Map<String, Object>> data = (List<Map<String, Object>>) response.get("data");

        if (data != null && !data.isEmpty()) {
            return (String) data.get(0).get("id");
        }
        throw new RuntimeException("Hashtag ID를 가져올 수 없습니다: " + hashtagName);
    }

    private List<Map<String, Object>> fetchPagedData(String hashtagId, String accessToken, int limit) {
        String url = "https://graph.facebook.com/v21.0/{hashtagId}/recent_media?fields=caption,media_type,media_url,media_product_type,permalink,timestamp&user_id={userId}&access_token={accessToken}";
        Map<String, String> uriVariables = Map.of(
                "hashtagId", hashtagId,
                "userId", "17841471687886491", // 실제 사용자 ID 입력
                "accessToken", accessToken
        );

        List<Map<String, Object>> results = new ArrayList<>();
        int fetchedCount = 0;

        while (url != null && fetchedCount < limit) {
            Map<String, Object> response = restTemplate.getForObject(url, Map.class, uriVariables);

            if (response == null || response.get("data") == null) {
                break;
            }

            List<Map<String, Object>> data = (List<Map<String, Object>>) response.get("data");
            results.addAll(data);
            fetchedCount += data.size();

            Map<String, Object> paging = (Map<String, Object>) response.get("paging");
            url = (paging != null && paging.containsKey("next")) ? (String) paging.get("next") : null;
        }

        return results;
    }
    */
    
    /*
    @GetMapping("/media")
    public ResponseEntity<List<Map<String, Object>>> getMediaData() {
        List<Map<String, Object>> mediaData = instagramService.getMediaData();
        return ResponseEntity.ok(mediaData);
    }
    
    @PostMapping("/process")
    public ResponseEntity<String> processData(@RequestBody GeminiResponse response) {
        try {
            storeService.processAndSaveData(response);
            return ResponseEntity.ok("Data processed and saved successfully");
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).body("Error: " + e.getMessage());
        }
    }
    */


    @PostMapping("/request/chat")
    public ResponseEntity<String> resquestchat(@RequestBody String message) {
        try {
            String response = claudeService.sendMessage(message);
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            return ResponseEntity.internalServerError().body(e.getMessage());
        }
    }


}