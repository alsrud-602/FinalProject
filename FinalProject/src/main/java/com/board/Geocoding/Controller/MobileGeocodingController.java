package com.board.Geocoding.Controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MobileGeocodingController {

    private  String clientId = "bbxvghdj60";  // 네이버 클라이언트ID
    private  String clientSecret = "5LicDuIvnyyXPfq5Exp2RrOCLm9hh6Zk3sSkUlRH";  // 네이버 클라이언트Secret 

    @RequestMapping("/M.GetCoordinates")
    public String getCoordinates(@RequestParam("address") List<String> addresses, 
                                  @RequestParam("name") List<String> names, Model model) {
        
        // 받은 주소와 이름을 로그로 출력
        System.out.println("받아온 주소 리스트:");
        addresses.forEach(System.out::println); // 선택한 주소 출력
        names.forEach(System.out::println); // 선택한 이름 출력
        
        List<Map<String, String>> locations = new ArrayList<>();

        // 각 주소에 대해 위치 정보 조회
        for (int i = 0; i < addresses.size(); i++) {
            String address = addresses.get(i);
            String name = names.get(i); // 대응되는 이름 가져오기
            String[] location = getLocation(address); // 각 주소에 대해 위치 정보 조회

            if (location != null) {
                Map<String, String> locationMap = new HashMap<>();
                locationMap.put("address", address);
                locationMap.put("lat", location[0]);
                locationMap.put("lon", location[1]);
                locationMap.put("name", name); // 이름 추가
                locations.add(locationMap); // 유효한 위치 정보와 이름 저장
            } else {
                Map<String, String> errorMap = new HashMap<>();
                errorMap.put("address", address);
                errorMap.put("error", "위치 정보를 찾을 수 없습니다.");
                errorMap.put("name", name); // 이름 추가
                locations.add(errorMap); // 오류 정보와 이름 저장
            }
        }

        // 첫 번째 위치에서 가장 먼 위치를 두 번째로 설정하는 로직
        if (locations.size() > 1) {
            Map<String, String> firstLocation = locations.get(0);
            double firstLat = Double.parseDouble(firstLocation.get("lat"));
            double firstLon = Double.parseDouble(firstLocation.get("lon"));

            Map<String, String> farthestLocation = null;
            double maxDistance = -1;

            // 첫 번째 위치에서 가장 먼 위치를 찾기
            for (Map<String, String> location : locations) {
                if (location != firstLocation && location.containsKey("lat") && location.containsKey("lon")) {
                    double lat = Double.parseDouble(location.get("lat"));
                    double lon = Double.parseDouble(location.get("lon"));
                    double distance = calculateDistance(firstLat, firstLon, lat, lon);

                    if (distance > maxDistance) {
                        maxDistance = distance;
                        farthestLocation = location;
                    }
                }
            }

            // 가장 먼 위치를 두 번째 위치로 설정하고, 나머지 위치는 그대로 유지
            if (farthestLocation != null) {
                locations.remove(farthestLocation);  // 가장 먼 위치를 목록에서 제거
                locations.add(1, farthestLocation);  // 두 번째로 추가
            }
        }

        // 모델에 위치 정보를 추가하여 JSP로 전달
        model.addAttribute("locations", locations);
        System.out.println("위치정보:"+locations);
        return "mobile/Wallet/getCoordinates"; // 위치 정보를 JSP로 전달
    }

    // Haversine 공식을 사용한 두 지점 간 거리 계산
    public double calculateDistance(double lat1, double lon1, double lat2, double lon2) {
        final double R = 6371; // 지구 반경 (단위: km)
        double latDistance = Math.toRadians(lat2 - lat1);
        double lonDistance = Math.toRadians(lon2 - lon1);
        double a = Math.sin(latDistance / 2) * Math.sin(latDistance / 2) +
                   Math.cos(Math.toRadians(lat1)) * Math.cos(Math.toRadians(lat2)) *
                   Math.sin(lonDistance / 2) * Math.sin(lonDistance / 2);
        double c = 2 * Math.atan2(Math.sqrt(a), Math.sqrt(1 - a));
        return R * c;  // 반환값은 km
    }

    public String[] getLocation(String address) {
        String apiUrl = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=" + address;

        System.out.println("geocode작동완료:" + apiUrl); // api 작동 확인용 주석처리

        // RestTemplate을 사용하여 API 호출
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.add("X-NCP-APIGW-API-KEY-ID", clientId); // 클라이언트 ID 설정
        headers.add("X-NCP-APIGW-API-KEY", clientSecret); // 클라이언트 Secret 설정

        HttpEntity<String> entity = new HttpEntity<>(headers);

        try {
            ResponseEntity<String> response = restTemplate.exchange(apiUrl, HttpMethod.GET, entity, String.class);
            String responseBody = response.getBody();

            ObjectMapper objectMapper = new ObjectMapper();
            JsonNode rootNode = objectMapper.readTree(responseBody);
            JsonNode addresses = rootNode.path("addresses");

            if (addresses.isArray() && addresses.size() > 0) {
                JsonNode location = addresses.get(0);
                String lat = location.path("y").asText(); // 위도
                String lon = location.path("x").asText(); // 경도

                return new String[]{lat, lon};
            }
        } catch (Exception e) {
            System.out.println("API 호출 중 오류 발생: " + e.getMessage());
            e.printStackTrace();
        }

        return null; // 위치 정보가 없을 경우 null 반환
    }
}