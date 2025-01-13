package com.board.main.controller;

import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.board.main.service.GeocodingService;

@RestController
@RequestMapping("/popup/map")
public class MapController {

    private final GeocodingService geocodingService;

    public MapController(GeocodingService geocodingService) {
        this.geocodingService = geocodingService;
    }

    @GetMapping("/coordinates")
    public ResponseEntity<Map<String, Double>> getCoordinates( @RequestParam(value = "address",defaultValue = "부산광역시 연제구 중앙대로 1001")String address) {
    	 System.out.println("rkskekfk!!!!!!!!!!!!" +address);
    	  if (address == null || address.trim().isEmpty()) {
    		  System.out.println(address);
    	        return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);  // 빈 값 방지
    	    }
        try {
            Map<String, Double> coordinates = geocodingService.getCoordinates(address);
            return ResponseEntity.ok(coordinates);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body(null);
        }
    }
}