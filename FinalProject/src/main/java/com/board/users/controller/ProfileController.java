package com.board.users.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.users.dto.UsersDto;
import com.board.users.mapper.UsersMapper;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Users")
public class ProfileController {
	
	@Autowired
	private UsersMapper usersMapper;
	
	// http://localhost:9090
	@RequestMapping("/Profile")
    public ModelAndView profile(HttpServletRequest request) {
        // 세션에서 user_idx 가져오기
        HttpSession session = request.getSession();
        Integer userIdx = (Integer) session.getAttribute("user_idx");

        // user_idx가 null인 경우 처리
        if (userIdx == null) {
            return new ModelAndView("redirect:/login"); // 로그인 페이지로 리다이렉트
        }

        // DB에서 사용자 정보 조회
        UsersDto user = usersMapper.getUserById(userIdx); // userIdx를 매개변수로 전달

        // 사용자 정보가 null인 경우 처리
        if (user == null) {
            return new ModelAndView("error"); // 에러 페이지로 이동
        }

        ModelAndView mv = new ModelAndView();
        mv.setViewName("users/profile/home");
        mv.addObject("name", user.getName());
        mv.addObject("nickname", user.getNickname());
        mv.addObject("phone", user.getPhone());
        mv.addObject("email", user.getEmail());

        return mv;
    }
	
	
}