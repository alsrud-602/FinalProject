package com.board.store.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
@Service
public class InstagramApiService {

    private final String BASE_URL = "https://graph.facebook.com/v21.0";
    private final String ACCESS_TOKEN = "EAAgv2Y0sTBgBO2OVIaBheWkO7TFS6OelDNZBWaZAMVjWnqgHT42YEeemxLAXdgQlj5SSr6CmCLvHxJDjTKu6NBOtub30ZAWN2GZAyoxOEexS9OjNhZBQZBhhR48ZCDiNrcXncYwxsCxbJabtkZB2RWcjdXlZATuvkZCtZCZBrA8potwT7UiPVKCmPHIlQtxEngZDZD"; // Facebook Developer 콘솔에서 발급받은 액세스 토큰

    // 해시태그 검색
    public String searchHashtag(String hashtagName) {
        String url = String.format("%s/ig_hashtag_search?user_id={userId}&q={hashtagName}&access_token={accessToken}", BASE_URL);

        RestTemplate restTemplate = new RestTemplate();
        Map<String, String> params = new HashMap<>();
        params.put("userId", "17841471687886491"); // Instagram 비즈니스 계정 User ID
        params.put("hashtagName", hashtagName);
        params.put("accessToken", ACCESS_TOKEN);

        try {
            ResponseEntity<String> response = restTemplate.getForEntity(url, String.class, params);
            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(response.getBody());
            return root.get("data").get(0).get("id").asText();
        } catch (Exception e) {
            throw new RuntimeException("Error fetching hashtag ID: " + e.getMessage());
        }
    }

    // 페이징 처리를 포함한 해시태그 데이터 가져오기
    public List<JsonNode> getHashtagDataWithPaging(String hashtagId) {
        String url = String.format("%s/%s/top_media?user_id={userId}&fields=id,caption,media_type,media_url,media_product_type,timestamp,permalink&access_token={accessToken}", BASE_URL, hashtagId);

        RestTemplate restTemplate = new RestTemplate();
        Map<String, String> params = new HashMap<>();
        params.put("userId", "17841471687886491");
        params.put("accessToken", ACCESS_TOKEN);

        List<JsonNode> results = new ArrayList<>();

        try {
            while (url != null) {
                ResponseEntity<String> response = restTemplate.getForEntity(url, String.class, params);
                ObjectMapper mapper = new ObjectMapper();
                JsonNode root = mapper.readTree(response.getBody());
                JsonNode data = root.get("data");
                JsonNode paging = root.get("paging");

                if (data != null) {
                    results.addAll(StreamSupport.stream(data.spliterator(), false).collect(Collectors.toList()));
                }

                // 다음 페이지 URL 확인
                if (paging != null && paging.has("next")) {
                    url = paging.get("next").asText();
                } else {
                    url = null;
                }
            }
        } catch (Exception e) {
            throw new RuntimeException("Error fetching paged media data: " + e.getMessage());
        }

        return results;
    }

    // "팝업"과 "팝업스토어" 태그가 모두 포함된 미디어 필터링
    public List<JsonNode> filterMediaByTags(List<JsonNode> popupMedia, List<JsonNode> popupStoreMedia) {
        return popupMedia.stream()
                .filter(popupMediaItem -> popupStoreMedia.stream()
                        .anyMatch(popupStoreMediaItem -> 
                                popupMediaItem.get("id").asText().equals(popupStoreMediaItem.get("id").asText())))
                .collect(Collectors.toList());
    }
}
