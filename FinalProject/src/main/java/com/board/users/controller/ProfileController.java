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
        ModelAndView mv = new ModelAndView();
        mv.setViewName("users/profile/home");
            return mv;
    }
	
	
}