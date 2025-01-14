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
public class GeocodingController {

    private  String clientId = "";  // 네이버 클라이언트ID
    private  String clientSecret = "";  // 네이버 클라이언트Secret 

    
    @RequestMapping("/GetCoordinates")
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

        // 모델에 위치 정보를 추가하여 JSP로 전달
        model.addAttribute("locations", locations);
        return "users/usersWallet/getCoordinates"; // 위치 정보를 JSP로 전달
    }


    public String[] getLocation(String address) {
        String apiUrl = "https://naveropenapi.apigw.ntruss.com/map-geocode/v2/geocode?query=" + address;

        System.out.println("geocode작동완료:"+apiUrl); // api 작동 확인용 주석처리

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
            e.printStackTrace(); // 예외 처리
        }

        return null; // 위치 정보가 없을 경우 null 반환
    }
}