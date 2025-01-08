package com.board.store.service;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import lombok.extern.slf4j.Slf4j;
import okhttp3.MediaType;
import okhttp3.OkHttpClient;
import okhttp3.Request;
import okhttp3.RequestBody;
import okhttp3.Response;
@Service
@Slf4j
public class ClaudeService {
    private static final String CLAUDE_API_URL = "https://api.anthropic.com/v1/messages";
    private final OkHttpClient client;
    private final ObjectMapper objectMapper;
    private String apiKey = "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";

    public ClaudeService(OkHttpClient client, 
                        ObjectMapper objectMapper) {
        this.client = client;
        this.objectMapper = objectMapper;
    }

    public String sendMessage(String message) throws IOException {
        Map<String, Object> requestBody = new HashMap<>();
        requestBody.put("model", "claude-2.0");
        requestBody.put("max_tokens", 1024);
        requestBody.put("messages", List.of(
            Map.of("role", "user", "content", message)
        ));

        RequestBody body = RequestBody.create(
            objectMapper.writeValueAsString(requestBody),
            MediaType.parse("application/json")
        );

        Request request = new Request.Builder()
            .url(CLAUDE_API_URL)
            .post(body)
            .addHeader("x-api-key", apiKey)
            .addHeader("anthropic-version", "2023-06-01")
            .addHeader("Content-Type", "application/json")
            .build();

        try (Response response = client.newCall(request).execute()) {
            if (!response.isSuccessful()) {
                throw new IOException("Unexpected response " + response);
            }
            
            JsonNode jsonResponse = objectMapper.readTree(response.body().string());
            return jsonResponse.path("content").path(0).path("text").asText();
        }
    }
}