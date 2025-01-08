package com.board.admin.controller;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.board.admin.mapper.AdminMapper;
import com.board.admin.mapper.StoreMapper;
import com.board.users.dto.User;
import com.board.users.dto.UsersDto;
import com.board.users.service.UserService;
import com.board.util.JwtUtil;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/Admin")
public class AdminRestController {
	
	
	@Autowired
	private AdminMapper adminMapper;

	@Autowired
	private StoreMapper storeMapper;
	
    @Autowired
    private HttpServletRequest request;
	
    
    @Autowired
    private UserService userService;
    
    @Autowired
    private JwtUtil jwtUtil;
    
    private Optional<User> getJwtTokenFromCookies(HttpServletRequest request, Model model) {
    	// 유저 번호 가지고 오기
   	 Cookie[] cookies = request.getCookies();
          String jwtToken = null;

          if (cookies != null) {
              for (int i = cookies.length - 1; i >= 0; i--) {
                  Cookie cookie = cookies[i];
                  if ("adminjwt".equals(cookie.getName())) {
                      jwtToken = cookie.getValue();
                      System.out.println("토큰1 : " +jwtToken );
                      break; 
                  }
              }
          }
          
          Optional<User> user= null;

          if (jwtToken != null) {
              String username = jwtUtil.extractUsername(jwtToken);
              System.out.println("사용자 정보1: " + username);

                  // 일반 사용자라면 기존 방식으로 사용자 조회
                  user = userService.getUserByUsername(username);  // DB에서 사용자 정보 조회
                  System.out.println("사용자 정보: " + user);
                  model.addAttribute("user", user.orElse(null));  // 사용자가 없을 경우 null 반환
              } else {
              model.addAttribute("error", "JWT 토큰이 없습니다.");
          }
          return user;
    }
    
    
    @GetMapping("/getPopupList")
    public List<Map<String, UsersDto>> getPopuplist(Model model) {
        //List<Map<String, Object>> popuplist = new ArrayList<>();

        // 예시 데이터
        
        List<Map<String,UsersDto>> popuplist = storeMapper.getStoreListByCity();
        model.addAttribute("popuplist",popuplist);

        return popuplist;
    }
    
    @GetMapping("/Store/PerformanceRank/{companyIdx}")
    public Map<String, Object> getStorePerformanceRank(
            @PathVariable int companyIdx,
            @RequestParam String startDate,
            @RequestParam String endDate) {

        // 결과를 담을 맵
        Map<String, Object> rankResult = new HashMap<>();

        try {
            // MyBatis Mapper를 사용하여 순위 계산
            int rank = adminMapper.getStorePerformanceRank(companyIdx, startDate, endDate);
            rankResult.put("rank", rank);
        } catch (Exception e) {
            e.printStackTrace();
            rankResult.put("error", "순위 계산 중 오류 발생");
        }

        return rankResult;
    }
    
    @GetMapping("/daily-performance/{companyIdx}")
    public Map<String, Object> getDailyPerformance(
            @PathVariable int companyIdx,
            @RequestParam String startDate,
            @RequestParam String endDate) {

        // 날짜 범위 계산
        LocalDateTime start = LocalDateTime.parse(startDate + "T00:00:00");
        LocalDateTime end = LocalDateTime.parse(endDate + "T23:59:59");

        // 결과를 담을 맵
        Map<String, Object> dailyPerformance = new HashMap<>();
        Map<String, Long> dailyStoreCounts = new HashMap<>();
        Map<String, Long> dailyLikeCounts = new HashMap<>();

        // 날짜별로 데이터 계산
        for (LocalDateTime date = start; !date.isAfter(end); date = date.plusDays(1)) {
            String formattedDate = date.format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
            
            // 특정 날짜의 스토어 등록 수, 좋아요 수 가져오기
            try {
                long storeCount = adminMapper.getStoreCountForDate(companyIdx, formattedDate);
                long likeCount = adminMapper.getLikeCountForDate(companyIdx, formattedDate);
                dailyStoreCounts.put(formattedDate, storeCount);
                dailyLikeCounts.put(formattedDate, likeCount);
            } catch (Exception e) {
                e.printStackTrace(); // 또는 로그 기록
            }
            
        }

        // 날짜별 스토어 수와 좋아요 수를 담은 결과 맵
        dailyPerformance.put("storeCounts", dailyStoreCounts);
        dailyPerformance.put("likeCounts", dailyLikeCounts);

        return dailyPerformance;
    }
    

}
    

