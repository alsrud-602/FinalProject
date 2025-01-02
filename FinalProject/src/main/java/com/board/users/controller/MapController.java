package com.board.users.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.users.dto.UsersDto;
import com.board.users.mapper.UsersMapper;
import com.board.users.service.MapService;

@Controller
@RequestMapping("/Users")
public class MapController {

    @Autowired
    private UsersMapper usersMapper;
    
    @Autowired
    private MapService mapService;

    @GetMapping("/Map")
    public ModelAndView showMap() {	
        List<UsersDto> popupList = usersMapper.getPopuplist(); // 진행중 팝업 리스트 가져오기
        ModelAndView mv = new ModelAndView(); // map.html 파일을 반환
        mv.addObject("popupList", popupList); // 리스트를 모델에 추가
        List<UsersDto> review = usersMapper.getPopupReview();
        List<UsersDto> StoreHit = usersMapper.getStoresHitAtMap();
        mv.setViewName("users/popup/map");

        return mv; // ModelAndView 반환
    }
    


    @GetMapping("/Map/popuplist")
    @ResponseBody
    public List<Map<String, Object>> getPopupList() {
        List<UsersDto> popupList = usersMapper.getPopuplist();
        
        //List<UsersDto> storeDetail = usersMapper.getStoredetail(popupList.get(0));
        List<Map<String, Object>> coordinatesList = new ArrayList<>();

        // 인덱스를 사용한 for 루프
        for (int i = 0; i < popupList.size(); i++) {
            UsersDto popup = popupList.get(i);
            try {
                double[] coords = mapService.getCoordinates(popup.getAddress());
                Map<String, Object> data = new HashMap<>();
                data.put("title", popup.getTitle());
                data.put("latitude", coords[0]);
                data.put("longitude", coords[1]);
                coordinatesList.add(data);
            } catch (Exception e) {
                System.err.println("Failed to geocode address: " + popup.getAddress());
            }
        }
        return coordinatesList;
    }
}