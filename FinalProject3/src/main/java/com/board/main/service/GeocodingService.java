package com.board.main.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.util.UriComponentsBuilder;
import org.json.JSONObject;
import org.json.JSONArray;
@Service
public class GeocodingService {

    private static final String GEOCODING_API_URL = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode";
    private static final String CLIENT_ID = "a9gjf918ri"; // 네이버 클라이언트 ID
    private static final String CLIENT_SECRET = "";

    public Map<String, Double> getCoordinates(String address) throws Exception {
        RestTemplate restTemplate = new RestTemplate();
        HttpHeaders headers = new HttpHeaders();
        headers.set("X-NCP-APIGW-API-KEY-ID", CLIENT_ID);
        headers.set("X-NCP-APIGW-API-KEY", CLIENT_SECRET);

        UriComponentsBuilder uriBuilder = UriComponentsBuilder.fromHttpUrl(GEOCODING_API_URL)
                .queryParam("query", address);

        HttpEntity<?> entity = new HttpEntity<>(headers);
        ResponseEntity<String> response = restTemplate.exchange(uriBuilder.toUriString(), HttpMethod.GET, entity, String.class);

        // JSON 파싱
        JSONObject jsonObject = new JSONObject(response.getBody());
        JSONArray addresses = jsonObject.getJSONArray("addresses");

        if (addresses.isEmpty()) {
            throw new Exception("주소를 찾을 수 없습니다.");
        }

        JSONObject firstAddress = addresses.getJSONObject(0);
        double latitude = firstAddress.getDouble("y");
        double longitude = firstAddress.getDouble("x");

        Map<String, Double> coordinates = new HashMap<>();
        coordinates.put("latitude", latitude);
        coordinates.put("longitude", longitude);

        return coordinates;
    }
}