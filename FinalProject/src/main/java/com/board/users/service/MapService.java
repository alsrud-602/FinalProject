package com.board.users.service;


import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

@Service
public class MapService {

    private static final String NOMINATIM_API_URL = "https://nominatim.openstreetmap.org/search?format=json&q=";

    public double[] getCoordinates(String address) {
        RestTemplate restTemplate = new RestTemplate();
        String requestUrl = NOMINATIM_API_URL + address.replace(" ", "+");

        // Nominatim API 응답 데이터
        GeocodeResponse[] response = restTemplate.getForObject(requestUrl, GeocodeResponse[].class);

        if (response != null && response.length > 0) {
            double lat = Double.parseDouble(response[0].getLat());
            double lon = Double.parseDouble(response[0].getLon());
            return new double[]{lat, lon};
        }

        throw new IllegalArgumentException("Address not found: " + address);
    }

    // 내부 클래스: API 응답 매핑
    public static class GeocodeResponse {
        private String lat;
        private String lon;

        public String getLat() { return lat; }
        public void setLat(String lat) { this.lat = lat; }

        public String getLon() { return lon; }
        public void setLon(String lon) { this.lon = lon; }
    }
}