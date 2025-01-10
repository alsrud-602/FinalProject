package com.board.store.service;

import java.util.ArrayList;
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
    private final String ACCESS_TOKEN = "EAAgv2Y0sTBgBOy7MGugN2lvsBuVxboB4LfSgZBCQGfop6E3U3GX6XXwOmTITx84VFVgyWvGMv5jpxUKqENISftSZAnMbGS5Ry53epvorrMu6A9nt1kCyHtEPq3bevOR3yaIvjtLkpe3QxbXpwQaoVqrksjWBlB17IOJQ4SGaEnCfic7fKw9p71jgZDZD";

    // 해시태그 검색
    public String searchHashtag(String hashtagName) {
        String url = String.format("%s/ig_hashtag_search?user_id={userId}&q={hashtagName}&access_token={accessToken}", BASE_URL);

        RestTemplate restTemplate = new RestTemplate();
        Map<String, String> params = Map.of(
            "userId", "17841471687886491",
            "hashtagName", hashtagName,
            "accessToken", ACCESS_TOKEN
        );

        try {
            ResponseEntity<String> response = restTemplate.getForEntity(url, String.class, params);
            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(response.getBody());
            return root.get("data").get(0).get("id").asText();
        } catch (Exception e) {
            throw new RuntimeException("Error fetching hashtag ID: " + e.getMessage());
        }
    }

    // 해시태그 데이터 가져오기
    public List<JsonNode> getHashtagData(String hashtagId) {
        String url = String.format("%s/%s/recent_media?user_id={userId}&fields=id,caption,media_type,media_url,media_product_type,timestamp,permalink&limit=10&access_token={accessToken}", BASE_URL, hashtagId);

        RestTemplate restTemplate = new RestTemplate();
        Map<String, String> params = Map.of(
            "userId", "17841471687886491",
            "accessToken", ACCESS_TOKEN
        );

        try {
            ResponseEntity<String> response = restTemplate.getForEntity(url, String.class, params);
            ObjectMapper mapper = new ObjectMapper();
            JsonNode root = mapper.readTree(response.getBody());
            JsonNode data = root.get("data");

            if (data != null) {
                return StreamSupport.stream(data.spliterator(), false)
                        .collect(Collectors.toList());
            }
        } catch (Exception e) {
            throw new RuntimeException("Error fetching media data: " + e.getMessage());
        }

        return new ArrayList<>();
    }

    // "대원미디어"과 "팝업스토어" 태그가 모두 포함된 미디어 필터링
    public List<JsonNode> filterMediaByTags(List<JsonNode> popupMedia, List<JsonNode> popupStoreMedia) {
        return popupMedia.stream()
                .filter(popupMediaItem -> popupStoreMedia.stream()
                        .anyMatch(popupStoreMediaItem -> 
                                popupMediaItem.get("id").asText().equals(popupStoreMediaItem.get("id").asText())))
                .collect(Collectors.toList());
    }
}
