package com.board.users.service;

import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class MapService {

    private static final String NAVER_GEOCODING_API_URL = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=%s";
    private static final String CLIENT_ID = ""; // 발급받은 Client ID 4dibtwhe4s
    private static final String CLIENT_SECRET = ""; // 발급받은 Client Secret 8cUloMnBQNDDZjjg8N739B7V6noUq3RkctKpOFgm

    public double[] getCoordinates(String address) {
        RestTemplate restTemplate = new RestTemplate();
        String requestUrl = String.format(NAVER_GEOCODING_API_URL, address);

        // 헤더 설정
        HttpHeaders headers = new HttpHeaders();
        headers.set("X-NCP-APIGW-API-KEY-ID", CLIENT_ID);
        headers.set("X-NCP-APIGW-API-KEY", CLIENT_SECRET);

        HttpEntity<String> entity = new HttpEntity<>(headers);

        // API 호출 및 응답 처리
        ResponseEntity<NaverGeocodeResponse> response = restTemplate.exchange(requestUrl, HttpMethod.GET, entity, NaverGeocodeResponse.class);

        if (response.getBody() != null && !response.getBody().getAddresses().isEmpty()) {
            NaverGeocodeResponse.Address addressInfo = response.getBody().getAddresses().get(0);
            return new double[]{Double.parseDouble(addressInfo.getY()), Double.parseDouble(addressInfo.getX())};
        }

        throw new IllegalArgumentException("Address not found: " + address);
    }

    // 내부 클래스: Naver API 응답 매핑
    public static class NaverGeocodeResponse {
        private java.util.List<Address> addresses;

        public java.util.List<Address> getAddresses() {
            return addresses;
        }

        public void setAddresses(java.util.List<Address> addresses) {
            this.addresses = addresses;
        }

        public static class Address {
            private String x; // 경도
            private String y; // 위도

            public String getX() {
                return x;
            }

            public void setX(String x) {
                this.x = x;
            }

            public String getY() {
                return y;
            }

            public void setY(String y) {
                this.y = y;
            }
        }
    }
}
