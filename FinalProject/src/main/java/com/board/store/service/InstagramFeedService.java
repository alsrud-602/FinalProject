package com.board.store.service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.springframework.stereotype.Service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@Service
public class InstagramFeedService {

    public List<String> fetchInstagramFeed(String username) throws IOException {
        String url = "https://www.instagram.com/" + username + "/";
        Document doc = Jsoup.connect(url).get();

        // HTML에서 JSON 데이터를 추출
        String html = doc.body().html();
        int startIndex = html.indexOf("window.HasteSupportData =") + 20; // 시작 인덱스
        int endIndex = html.indexOf(";</script>", startIndex);     // 종료 인덱스

        if (startIndex == 20 || endIndex == -1) {
            throw new IOException("Instagram 데이터 구조가 변경되었습니다. JSON 데이터를 찾을 수 없습니다.");
        }

        String jsonString = html.substring(startIndex, endIndex).trim();

        // JSON 데이터를 파싱
        ObjectMapper mapper = new ObjectMapper();
        JsonNode rootNode = mapper.readTree(jsonString);
        List<String> imageUrls = new ArrayList<>();

        try {
            JsonNode posts = rootNode.path("entry_data")
                                      .path("ProfilePage")
                                      .get(0)
                                      .path("graphql")
                                      .path("user")
                                      .path("edge_owner_to_timeline_media")
                                      .path("edges");

            // 포스트 정보에서 이미지 URL 추출
            for (JsonNode post : posts) {
                String imageUrl = post.path("node").path("display_url").asText();
                if (!imageUrl.isEmpty()) {
                    imageUrls.add(imageUrl);
                }
            }
        } catch (Exception e) {
            throw new IOException("Instagram JSON 구조를 파싱하는 중 오류가 발생했습니다.", e);
        }

        return imageUrls;
    }
}
