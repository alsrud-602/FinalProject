package com.board.users.controller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.users.dto.User;
import com.board.users.dto.UsersDto;
import com.board.users.mapper.PopcornMapper;
import com.board.users.service.UserService;
import com.board.users.vo.PopcornVo;
import com.board.util.JwtUtil;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Wallet")
public class PopcornController {
	@Autowired
	   private JwtUtil jwtUtil;
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private PopcornMapper popcornMapper;

	@RequestMapping("/Wallet")
	public ModelAndView wallet(HttpServletRequest request) {
	    ModelAndView mv = new ModelAndView();
	    
	    // 유저 번호 가지고 오기
	    Cookie[] cookies = request.getCookies();
	    String jwtToken = null;
	    boolean isKakaoUser = false;  // 카카오 사용자 여부를 판단하는 변수

	    if (cookies != null) {
	        for (int i = cookies.length - 1; i >= 0; i--) {
	            Cookie cookie = cookies[i];
	            if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
	                jwtToken = cookie.getValue();
	                System.out.println("토큰1 : " + jwtToken);
	                if ("kakaoAccessToken".equals(cookie.getName())) {
	                    isKakaoUser = true;  // kakaoAccessToken 쿠키가 있으면 카카오 로그인 사용자로 판단
	                }
	                System.out.println("토큰: " + jwtToken);
	                break;
	            }
	        }
	    }

	    String username = null;
	    Long kakaouseridx = null;
	    Long useruseridx = null;
	    String useruserid = null;
	    
	    if (jwtToken != null) {
	        username = jwtUtil.extractUsername(jwtToken);
	        System.out.println("사용자 정보1: " + username);

	        if (isKakaoUser) {
	            // 카카오 로그인 사용자라면 소셜 ID로 사용자 조회
	            Optional<User> kakaouser = userService.findBySocialId(username);
	            System.out.println("카카오 사용자 정보: " + kakaouser);
	            
	            // 카카오 사용자의 정보를 Model에 추가
	            mv.addObject("user", kakaouser.orElse(null));  
	            // 카카오 회원의 ID 사용
	            useruseridx = kakaouser.get().getUserIdx();
	            useruserid = kakaouser.get().getId();
	            System.out.println("useruserid" + useruserid);
	        } else {
	            // 일반 사용자라면 기존 방식으로 사용자 조회
	            Optional<User> user = userService.getUserByUsername(username);
	            System.out.println("사용자 정보: " + user);
	            
	            mv.addObject("user", user.orElse(null));
	            useruseridx = user.get().getUserIdx();
	            useruserid = user.get().getId();
	        }
	        
	        //로그,지갑,출석 불러오기 
	        List<PopcornVo> loglist = popcornMapper.getLogByUserId(useruserid);
	        if (loglist == null || loglist.isEmpty()) {
	        	popcornMapper.newuserLog(useruserid);
	        	  loglist = popcornMapper.getLogByUserId(useruserid);
	        }
	        PopcornVo Popcorn = popcornMapper.checkWallet(useruserid);
	        if (Popcorn == null ) {
	        	popcornMapper.newuserWallet(useruserid);
	        	 Popcorn = popcornMapper.checkWallet(useruserid);
	        }
	        
	        PopcornVo attendinfo = popcornMapper.getCheckAttend(useruserid);
	        if (attendinfo == null ) {
	        	popcornMapper.newuserAttend(useruserid);
	        	attendinfo = popcornMapper.getCheckAttend(useruserid);
	        }
	        
	        System.out.println("출석상태:" + attendinfo);

	        //날짜로 출석 관리
	        LocalDate today = LocalDate.now();

	        if ("ON".equals(attendinfo.getAttendance_status()) || "OFF".equals(attendinfo.getAttendance_status())) {
	            String lastAttendDateStr = attendinfo.getAttendance_date();

	            if (lastAttendDateStr == null || lastAttendDateStr.isEmpty()) {
	                System.out.println("출석 기록이 없습니다.");
	            } else {
	                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd");
	                LocalDate lastAttendDate = LocalDate.parse(lastAttendDateStr, formatter);

	                // 하루 마다 초기화  (완료)
	                if (lastAttendDate != null && lastAttendDate.isBefore(today)) {
	                    popcornMapper.updateAttendanceStatus(useruserid);
	                }

	                LocalDate startOfThisWeek = today.with(DayOfWeek.MONDAY);
	                // 마지막 출석 날짜가 이번 주 월요일보다 이전인지 확인
	                if (lastAttendDate.isBefore(startOfThisWeek)) {
	                    // 초기화 로직 추가
	                    popcornMapper.updateNewWeekAttend(useruserid);
	                    System.out.println("새로운 출석주 시작 (월요일이 아니더라도 초기화됨)");
	                } else {
	                    if (today.getDayOfWeek() == DayOfWeek.MONDAY && !lastAttendDate.equals(today)) {
	                        popcornMapper.updateNewWeekAttend(useruserid);
	                        attendinfo = popcornMapper.getCheckAttend(useruserid);
	                        System.out.println("새로운 출석주 시작 (새로운 주 갱신 출석 확인용)");
	                    } else {
	                        System.out.println("진행중인 출석주 임/ 새로운 주 월요일 출석함");
	                    }
	                }
	            }
	        }

	        System.out.println("담긴거:" + loglist);
	        List<Integer> points = Arrays.asList(20, 30, 40, 50, 60, 70, 100);
	        mv.addObject("useruserid", useruserid);
	        mv.addObject("points", points);
	        mv.addObject("Popcorn", Popcorn);
	        mv.addObject("Loglist", loglist);
	        mv.addObject("attendstat", attendinfo);
	    } else {
	        mv.addObject("error", "JWT 토큰이 없습니다.");
	    }

	    if (useruseridx == null) {
	        mv.addObject("needLoginMessage", "이 기능을 사용하기 위해선 로그인이 필요합니다.");
	        mv.setViewName("users/usersWallet/wallet");
	    } else {
	        mv.setViewName("users/usersWallet/wallet");
	    }

	    return mv;
	}



	   // 출첵
    @PostMapping("/Daily-check")
    @ResponseBody
    public String handleDailyCheck(String userId,
    		                       @RequestParam("earnedPoints") int earnedPoints,
    		                       HttpSession session) {
    	
    	PopcornVo attendinfo = popcornMapper.getCheckAttend(userId);
        String alreadyCheckedIn = attendinfo.getAttendance_status();
        
        
        if ("ON".equals(alreadyCheckedIn)) {
        	System.out.println("중복출석방지확인");
            return "이미 오늘 출석했습니다."; 
        } else {
            boolean successAttend = popcornMapper.AttendToUser(userId);
            boolean successEarned = popcornMapper.addPointsToUser(userId,earnedPoints);
            boolean successAddLog = popcornMapper.addPopcornLog(userId,earnedPoints);
        
            if (successAttend && successEarned && successAddLog) {
                System.out.println("출첵 되고 포인트주고 로그까지:" + earnedPoints);
                return "출석 체크가 완료되었습니다!";
            } else {
                System.out.println(" 실패 ");
                return "실패임";
            }
        }
        
    }

}