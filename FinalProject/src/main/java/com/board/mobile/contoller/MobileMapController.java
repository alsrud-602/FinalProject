package com.board.mobile.contoller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.users.dto.UsersDto;
import com.board.users.mapper.UsersMapper;
import com.board.users.service.MapService;

@Controller
@RequestMapping("/Mobile/Users")
public class MobileMapController {

    @Autowired
    private UsersMapper usersMapper;
    
    @Autowired
    private MapService mapService;

    @GetMapping("/Map")
    public ModelAndView showMap() {	
        List<UsersDto> popupList = usersMapper.getPopuplist(); // 진행중 팝업 리스트 가져오기
        ModelAndView mv = new ModelAndView(); // map.html 파일을 반환
        mv.addObject("popupList", popupList); // 리스트를 모델에 추가
        mv.setViewName("mobile/main/map");

        return mv; // ModelAndView 반환
    }
    


    @GetMapping("/Map/popuplist")
    @ResponseBody
    public List<Map<String, Object>> getPopupList() {
        List<UsersDto> popupList = usersMapper.getStoresHitAtMap();
        List<Map<String, Object>> coordinatesList = new ArrayList<>();

        for (UsersDto popup : popupList) {
            try {
                // 주소를 기반으로 좌표 가져오기
                double[] coords = mapService.getCoordinates(popup.getAddress());

                // 데이터를 맵에 담아 리스트에 추가
                Map<String, Object> data = new HashMap<>();
                data.put("title", popup.getTitle());
                data.put("hit_count", popup.getHit_count());
                data.put("start_date", popup.getStart_date());
                data.put("end_date", popup.getEnd_date());
                data.put("igdate", popup.getIgdate());
                data.put("latitude", coords[0]);
                data.put("longitude", coords[1]);
                data.put("image_path", popup.getImage_path());
                data.put("store_idx", popup.getStore_idx());

                coordinatesList.add(data);
            } catch (IllegalArgumentException e) {
                System.err.println("Address not found for popup: " + popup.getAddress());
            } catch (Exception e) {
                System.err.println("Unexpected error for popup: " + popup.getAddress());
                e.printStackTrace();
            }
        }

        return coordinatesList;
    }

    // 팝업스토어 리뷰 리스트
    @GetMapping("/Map/reviewlist")
    @ResponseBody
    public List<String> getReviews(@RequestParam("store_idx") int store_idx) {
    	System.out.println("꺄울~맞");
        return usersMapper.getStoresReviewAtMap(store_idx);
    }

}