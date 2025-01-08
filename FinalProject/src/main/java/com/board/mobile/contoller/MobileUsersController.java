package com.board.mobile.contoller;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
import com.board.users.mapper.UsersMapper;
import com.board.users.service.UserService;
import com.board.users.vo.PopcornVo;
import com.board.util.JwtUtil;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Mobile/Users")
public class MobileUsersController {
	   
	   @Autowired
	   private PopcornMapper popcornMapper;
	
	   @Autowired
	   private UsersMapper usersMapper;
	   
	   @Autowired
	   private UserService userService;
	   
	   @Autowired
	      private JwtUtil jwtUtil;
	   
	   @RequestMapping("/Wallet")
		public String wallet(Model model ) {
			
			String userId = "TEST";
			
			System.out.println("====================================");
		    List<PopcornVo> loglist = popcornMapper.getLogByUserId(userId);
		    System.out.println("====================================");
		    PopcornVo Popcorn       = popcornMapper.checkWallet(userId);
		    PopcornVo attendinfo    = popcornMapper.getCheckAttend(userId);
		    System.out.println("attendstat:"+attendinfo);
		    
		     
		              LocalDate today = LocalDate.now(); 
		         //  LocalDate today = LocalDate.of(2024, 12, 31); 
		       
			 if ("ON".equals(attendinfo.getAttendance_status())|| "OFF".equals(attendinfo.getAttendance_status())) { 
				  String lastAttendDateStr    =  attendinfo.getAttendance_date(); 
				  
				  if (lastAttendDateStr == null || lastAttendDateStr.isEmpty()) {
				        System.out.println("출석 기록이 없습니다.");
				    } else {
				  
	              DateTimeFormatter formatter =  DateTimeFormatter.ofPattern("yyyy-MM-dd"); 
	              LocalDate lastAttendDate    =  LocalDate.parse(lastAttendDateStr, formatter);
				
	              // 하루 마다 초기화  (완료)  
	              if (lastAttendDate != null && lastAttendDate.isBefore(today)) {
	            	    popcornMapper.updateAttendanceStatus(userId);
	            	}
	              
	              LocalDate startOfThisWeek = today.with(DayOfWeek.MONDAY);
	              // 마지막 출석 날짜가 이번 주 월요일보다 이전인지 확인
	              if (lastAttendDate.isBefore(startOfThisWeek)) {
	                  // 초기화 로직 추가
	                  popcornMapper.updateNewWeekAttend(userId); // 초기화 로직 여기는 다르게 해야함 
	                  System.out.println("새로운 출석주 시작 (월요일이 아니더라도 초기화됨)");
	                  
	              } else {
	                  // 오늘이 월요일인 경우 추가 체크
	                  if (today.getDayOfWeek() == DayOfWeek.MONDAY && !lastAttendDate.equals(today)) {
	                      popcornMapper.updateNewWeekAttend(userId); // 초기화 로직
	                      attendinfo = popcornMapper.getCheckAttend(userId); 
	                      System.out.println("새로운 출석주 시작 (새로운 주 갱신 출석 확인용)");
	                       
	                  } else {
	                      System.out.println("진행중인 출석주 임/ 새로운 주 월요일 출석함");
	                  }
	              }
	          }
	          
		 }
		    System.out.println("담긴거:"+loglist);
		    List<Integer> points = Arrays.asList(20, 30, 40, 50, 60, 70, 100);
		    model.addAttribute("points", points); 
		    model.addAttribute("Popcorn", Popcorn); 
		    model.addAttribute("Loglist", loglist);
		    model.addAttribute("attendstat", attendinfo);
		    
		    return "mobile/Wallet/wallet"; 
		}
	   
	   
		@RequestMapping("/RouteRecommend")
		public String routeRecommend(Model model) {
		    //모든 지역 가져오기
			List<UsersDto> allRegionList = usersMapper.getallRegionlist();
			System.out.println("지역이름:"+allRegionList);
			// 모든 매장 리스트 가져오기

			List<UsersDto> allStoreList = usersMapper.getallStorelist();
		    //System.out.println("All Store List: " + allStoreList);  // 전체 매장 리스트 출력

		    Map<Integer, List<UsersDto>> storeAddressMap = new HashMap<>();
		    
		    // 모든 주소 리스트 가져오기
		    List<UsersDto> allAddresses = usersMapper.getAddressesByStoreIdx();
		    //System.out.println("여기:" + allAddresses);
		    
		    // 주소를 storeIdx 기준으로 그룹화
		    for (UsersDto address : allAddresses) {
		        int storeIdx = address.getStore_idx();  // 주소에 해당하는 storeIdx 가져오기
		        storeAddressMap.computeIfAbsent(storeIdx, k -> new ArrayList<>()).add(address);
		    }
		    
		    // 매장 정보와 주소를 결합하여 storeInfoMap에 담기
		    Map<Integer, Map<String, Object>> storeInfoMap = new HashMap<>();

		    for (UsersDto store : allStoreList) {
		        int storeIdx = store.getStore_idx();  // 매장 idx
		        String storeTitle = store.getTitle();  // 매장 이름

		        // 해당 storeIdx에 맞는 주소들 가져오기
		        List<UsersDto> addresses = storeAddressMap.get(storeIdx);

		        // 매장 이름과 주소가 모두 존재할 때만 storeInfoMap에 추가
		        if (storeTitle != null && !storeTitle.isEmpty() && addresses != null && !addresses.isEmpty()) {
		            // 매장 정보와 주소를 하나의 Map으로 결합
		            Map<String, Object> storeDetails = new HashMap<>();
		            storeDetails.put("storeTitle", storeTitle);  // 매장 이름
		            storeDetails.put("addresses", addresses);   // 해당 매장의 주소 리스트

		            // storeIdx를 기준으로 storeDetails 추가
		            storeInfoMap.put(storeIdx, storeDetails);
		        }
		    }

		    //System.out.println("나야:" + storeInfoMap);  // storeInfoMap 출력
		    // 모델에 데이터를 추가하여 뷰로 전달
		    model.addAttribute("storeInfoMap", storeInfoMap);
		    model.addAttribute("allRegionList", allRegionList);
	       return "mobile/Wallet/routeRecommend";
	   }


	   // 출첵
    @PostMapping("/Daily-check")
    @ResponseBody
    public String handleDailyCheck(String userID,
    		                       @RequestParam("earnedPoints") int earnedPoints,
    		                       HttpSession session) {
    	String userId = "TEST";
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
