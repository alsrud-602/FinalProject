package com.board.users.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.users.dto.UsersDto;
import com.board.users.mapper.UsersMapper;

@Controller
@RequestMapping("/Users")
public class MapController {

    @Autowired
    private UsersMapper usersMapper; // UsersDto를 가져오는 서비스

    @GetMapping("/Map")
    public ModelAndView showMap() {	
        List<UsersDto> popupList = usersMapper.getPopuplist(); // 진행중 팝업 리스트 가져오기
        
        ModelAndView mv = new ModelAndView(); // map.html 파일을 반환
        mv.addObject("popupList", popupList); // 리스트를 모델에 추가
        mv.setViewName("users/popup/map");

        return mv; // ModelAndView 반환
    }
    
    @GetMapping("/Map/popuplist")
    @ResponseBody
    public List<UsersDto> getPopupList() {
    	List<UsersDto> popupList = usersMapper.getPopuplist(); // JSON 형식으로 반환
		return popupList;
    }
}