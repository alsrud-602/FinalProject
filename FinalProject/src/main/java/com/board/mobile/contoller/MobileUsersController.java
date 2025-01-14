package com.board.mobile.contoller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.admin.dto.Banner;
import com.board.admin.mapper.BannerMapper;
import com.board.users.dto.User;
import com.board.users.dto.UsersDto;
import com.board.users.mapper.UsersMapper;
import com.board.users.service.UserService;
import com.board.util.JwtUtil;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/Mobile/Users")
public class MobileUsersController {
	   
	   @Autowired
	   private UsersMapper usersMapper;
	   
	   @Autowired
	   private UserService userService;
	   
	   @Autowired
	   private JwtUtil jwtUtil;
	   
	   @Autowired
	   private BannerMapper bannerMapper;
	   
	   // http://localhost:9090
	   @RequestMapping("/Wallet")
	   public  String  wallet() {
	      return "users/usersWallet/wallet";
	      //return "/WEB-INF/views/users/Wallet/wallet.jsp";
	   }
	   
	   @RequestMapping("/RouteRecommend")
	   public String routeRecommend(Model model) {
	       // 모든 매장 리스트 가져오기
	       List<UsersDto> allStoreList = usersMapper.getallStorelist();
	       System.out.println("All Store List: " + allStoreList);  // 전체 매장 리스트 출력

	       Map<Integer, List<UsersDto>> storeAddressMap = new HashMap<>();
	       
	       // 모든 주소 리스트 가져오기
	       List<UsersDto> allAddresses = usersMapper.getAddressesByStoreIdx();
	       System.out.println("여기:" + allAddresses);
	       
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

	       System.out.println("나야:" + storeInfoMap);  // storeInfoMap 출력
	       // 모델에 데이터를 추가하여 뷰로 전달
	       model.addAttribute("storeInfoMap", storeInfoMap);

	       return "users/usersWallet/routeRecommend";
	   }

	   
	   
	   
	   // 메인 화면
	   // http://localhost:9090/Users/Main
	   @RequestMapping("/Main")
		public ModelAndView main(			
				@RequestParam(defaultValue = "1") int page,
				@RequestParam(defaultValue = "6") int size,
				Model model,HttpServletRequest request) {
			
			// 유저 번호 가지고 오기
			 Cookie[] cookies = request.getCookies();
		        String jwtToken = null;
		        boolean isKakaoUser = false;  // 카카오 사용자 여부를 판단하는 변수

		        if (cookies != null) {
		            for (int i = cookies.length - 1; i >= 0; i--) {
		                Cookie cookie = cookies[i];
		                if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
		                    jwtToken = cookie.getValue();
		                    System.out.println("토큰1 : " +jwtToken );
		                    if ("kakaoAccessToken".equals(cookie.getName())) {
		                        isKakaoUser = true;  // kakaoAccessToken 쿠키가 있으면 카카오 로그인 사용자로 판단
		                    }
		                    System.out.println("토큰: " + jwtToken);
		                    break; 
		                }
		            }
		        }

		        if (jwtToken != null) {
		            String username = jwtUtil.extractUsername(jwtToken);
		            System.out.println("사용자 정보1: " + username);

		            if (isKakaoUser) {
		                // 카카오 로그인 사용자라면 소셜 ID로 사용자 조회
		                Optional<User> kakaouser = userService.findBySocialId(username);  // 카카오 소셜 ID로 사용자 조회
		                System.out.println("카카오 사용자 정보: " + kakaouser);
		                model.addAttribute("user", kakaouser.orElse(null));  // 카카오 사용자가 없을 경우 null 반환
		            } else {
		                // 일반 사용자라면 기존 방식으로 사용자 조회
		                Optional<User> user = userService.getUserByUsername(username);  // DB에서 사용자 정보 조회
		                System.out.println("사용자 정보: " + user);
		                model.addAttribute("user", user.orElse(null));  // 사용자가 없을 경우 null 반환
		            }
		        } else {
		            model.addAttribute("error", "JWT 토큰이 없습니다.");
		        }

		        
			// 페이징용
			 int start = (page - 1) * size; 
			 int totalPosts = usersMapper.getOngoingcount();
			 int totalPages = (int) Math.ceil((double) totalPosts / size);
			 System.out.println("totalPosts : " + totalPosts);
			 System.out.println("totalPages : " + totalPages);

			//랭킹 팝업
			 List<UsersDto> ranklist = usersMapper.getRanklist();
			 System.out.println("ranklist : " + ranklist);

			 // 이미지 경로 수정
			 for (UsersDto dto : ranklist) {
			     String imagePath = dto.getImage_path().replace("\\", "/"); // 경로 수정
			     dto.setImage_path(imagePath); // 수정된 경로 다시 설정
			     System.out.println("수정된 이미지 패스 : " + imagePath);
			 }

			 System.out.println("최종 수정된 ranklist : " + ranklist);
			
			
			// 팝업 오픈예정
			List<UsersDto> opendpopuplist = usersMapper.getOpendpopuplist();
			// 이미지 경로 수정
			for (UsersDto dto : opendpopuplist) {
			     String imagePath = dto.getImage_path().replace("\\", "/"); // 경로 수정
				dto.setImage_path(imagePath); // 수정된 경로 다시 설정
			    System.out.println("수정된 이미지 패스 : " + imagePath);
			}
			
			// 팝업 진행중
			List<UsersDto> popuplist = usersMapper.getPopuppaginglist(start,size);
			// 이미지 경로 수정
			for (UsersDto dto : popuplist) {
			     String imagePath = dto.getImage_path().replace("\\", "/"); // 경로 수정
				dto.setImage_path(imagePath); // 수정된 경로 다시 설정
			    System.out.println("수정된 이미지 패스 : " + imagePath);
			}
			List<Banner> banners = bannerMapper.getAllBanners(); // BANNER 테이블에서 모든 배너 정보를 가져오는 메소드
	        model.addAttribute("banners", banners);
			ModelAndView mv = new ModelAndView();
			
			mv.addObject("opendpopuplist",opendpopuplist);
			mv.addObject("totalPages", totalPages);
			mv.addObject("currentPage", page);
			mv.addObject("ranklist",ranklist);
			mv.addObject("ranklist",ranklist);
			mv.addObject("popuplist",popuplist);
			mv.setViewName("/mobile/main/home");
			return mv;
		}
	   
	   // 랭킹 팝업
	   @RequestMapping("/Rankdetail")
	   public ModelAndView rankdetail() {
	    
	      // 랭킹 팝업 리스트
	      List<UsersDto> ranklist = usersMapper.getRankdetaillist();
	      for (UsersDto dto : ranklist) {
	           String imagePath = dto.getImage_path().replace("\\", "/"); // 경로 수정
	         dto.setImage_path(imagePath); // 수정된 경로 다시 설정
	      }
	  
	      
	     ModelAndView mv = new ModelAndView();
	     mv.addObject("ranklist",ranklist);
	     mv.setViewName("/mobile/main/detail/rankdetail");
	     return mv;
	   }
	   
	    // 오픈예정 팝업   
	   @RequestMapping("/Opendetail")
	   public ModelAndView opendetail() {
	      
	      // 팝업 오픈예정
	      List<UsersDto> opendpopuplist = usersMapper.getOpendpopuplist();
	      for (UsersDto dto : opendpopuplist) {
	           String imagePath = dto.getImage_path().replace("\\", "/"); // 경로 수정
	         dto.setImage_path(imagePath); // 수정된 경로 다시 설정
	      }
	      
	      ModelAndView mv = new ModelAndView();
	      mv.addObject("opendpopuplist",opendpopuplist);
	      mv.setViewName("/mobile/main/detail/opendetail");
	      return mv;
	   }
	   
	   // 진행중 팝업
	   @RequestMapping("/Ongoingdetail")
	   public ModelAndView ongoingdetail() {
	      
	      // 진행중 팝업
	      List<UsersDto> popuplist = usersMapper.getPopuplist();
	      for (UsersDto dto : popuplist) {
	           String imagePath = dto.getImage_path().replace("\\", "/"); // 경로 수정
	         dto.setImage_path(imagePath); // 수정된 경로 다시 설정
	      }
	      
	      ModelAndView mv = new ModelAndView();
	      mv.addObject("popuplist",popuplist);
	      mv.setViewName("/mobile/main/detail/ongoingdetail");
	      return mv;
	   }
	   
	   // 메인화면-검색창이동
	      @RequestMapping("/Mainsearch")
	      @ResponseBody
	      public ModelAndView mainsearch(
	            @RequestParam(required = false, value="search") String search,
	            @RequestParam(defaultValue = "1") int page,
	            @RequestParam(defaultValue = "3") int size) {
	         System.out.println("search" + search);
	          
	          // 팝업 오픈 예정
	             int start = (page - 1) * size; 
	          int OpendtotalPosts = usersMapper.getOpendsearchcount(search);
	          int OpendtotalPages = (int) Math.ceil((double) OpendtotalPosts / size);
	          System.out.println("totalPosts search : " + OpendtotalPosts);
	          System.out.println("totalPages search : " + OpendtotalPages);
	         
	         // 진행중 팝업
	         List<UsersDto> ongoingsearchlist = usersMapper.getOngoingsearchlist(search,start,size);
	         for (UsersDto dto : ongoingsearchlist) {
	              String imagePath = dto.getImage_path().replace("\\", "/"); // 경로 수정
	            dto.setImage_path(imagePath); // 수정된 경로 다시 설정
	         }
	         System.out.println("진행중인 팝업 search : " + ongoingsearchlist);
	         // 팝업 오픈예정
	         List<UsersDto> opendsearchlist = usersMapper.getOpendsearchlist(search,start,size);   
	         for (UsersDto dto : opendsearchlist) {
	              String imagePath = dto.getImage_path().replace("\\", "/"); // 경로 수정
	            dto.setImage_path(imagePath); // 수정된 경로 다시 설정
	         }
	         System.out.println("오픈예정인 팝업 search : " + opendsearchlist);
	         // 종료된 팝업
	         List<UsersDto> closesearchlist = usersMapper.getClosesearchlist(search,start,size);
	         for (UsersDto dto : closesearchlist) {
	              String imagePath = dto.getImage_path().replace("\\", "/"); // 경로 수정
	            dto.setImage_path(imagePath); // 수정된 경로 다시 설정
	         }
	         System.out.println("종료인 팝업 search : " + closesearchlist);
	         
	         ModelAndView mv = new ModelAndView();
	         
	         mv.addObject("ongoingsearchlist", ongoingsearchlist);
	         mv.addObject("OpendtotalPages", OpendtotalPages);
	         mv.addObject("OpendPage", page);
	         mv.addObject("opendsearchlist", opendsearchlist);
	         mv.addObject("closesearchlist", closesearchlist);
	         mv.setViewName("users/usersMain/mainsearch");
	         return mv;
	      }
	   
	   
	   
	   //지역,연령대 필터링
	   @RequestMapping("Regionfilter")
	   @ResponseBody
	   public Map<String,Object> regionfilter(
	         @RequestParam(required = false,value="region") String region,
	         @RequestParam(required = false,value="age") String age,
	         @RequestParam(required = false, value="date") String date) {
	      System.out.println("region : " + region);
	      System.out.println("date : " + date);
	      System.out.println("age : " + age);
	      
	      Map<String,Object> response = new HashMap<>();
	      
	      List<UsersDto> filterlist = usersMapper.getFilterlist(region,age,date);
	      for (UsersDto dto : filterlist) {
	           String imagePath = dto.getImage_path().replace("\\", "/"); // 경로 수정
	         dto.setImage_path(imagePath); // 수정된 경로 다시 설정
	      }
	      System.out.println("filterlist : "+filterlist);
	      response.put("filterlist", filterlist);
	      System.out.println("response" + response);
	   
	      return response;
	   }
	   
	   
	// 상세정보 페이지 
	   @RequestMapping("/Info")
	   public ModelAndView info(UsersDto usersdto,
	         Model model,HttpServletRequest request,
	         @RequestParam(defaultValue = "1") int page,
	         @RequestParam(defaultValue = "6") int size
	         ){
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
	                             System.out.println("토큰1 : " +jwtToken );
	                             if ("kakaoAccessToken".equals(cookie.getName())) {
	                                 isKakaoUser = true;  // kakaoAccessToken 쿠키가 있으면 카카오 로그인 사용자로 판단
	                             }
	                             System.out.println("토큰: " + jwtToken);
	                             break; 
	                         }
	                     }
	                 }
	                 String username = null; // **여기에서 username 변수를 미리 선언**
	                 Long kakaouseridx = null;
	                 Long useruseridx = null;
	                 
	                 if (jwtToken != null) {
	                     username = jwtUtil.extractUsername(jwtToken);
	                     System.out.println("사용자 정보1: " + username);

	                     if (isKakaoUser) {
	                         // 카카오 로그인 사용자라면 소셜 ID로 사용자 조회
	                         Optional<User> kakaouser = userService.findBySocialId(username);  // 카카오 소셜 ID로 사용자 조회
	                         System.out.println("카카오 사용자 정보: " + kakaouser);
	                         model.addAttribute("user", kakaouser.orElse(null));  // 카카오 사용자가 없을 경우 null 반환
	                         
	                         // 유저 아이디당 한개씩 조회수 증가
	                        int store_idx = usersdto.getStore_idx();
	                       System.out.println("스토어 번호 : " + store_idx);
	                       
	                       // 카카오 회원의 ID 사용
	                         username = kakaouser.get().getId();
	                         useruseridx = kakaouser.get().getUserIdx();
	                         System.out.println("useridx" + useruseridx);
	                         
	                         List<UsersDto> selectStoreHit = usersMapper.getSelectStoreHit(store_idx, username);
	                         System.out.println("selectStoreHit" + selectStoreHit);
	                         if (selectStoreHit.size() == 0) {
	                             int insertStoreHit = usersMapper.insertStoreHit(store_idx, username);
	                             System.out.println("insertStoreHit" + insertStoreHit);
	                         }
	                     } else {
	                         // 일반 사용자라면 기존 방식으로 사용자 조회
	                         Optional<User> user = userService.getUserByUsername(username);
	                         System.out.println("사용자 정보: " + user);
	                         model.addAttribute("user", user.orElse(null));  // 사용자가 없을 경우 null 반환
	                         
	                         // 유저 아이디당 한개씩 조회수 증가
	                         int store_idx = usersdto.getStore_idx();
	                         System.out.println("스토어 번호 : " + store_idx);
	                         
	                         useruseridx = user.get().getUserIdx();
	                         mv.addObject("user_idx", useruseridx);
	                         System.out.println("useruseridx : " + useruseridx);
	                         
	                         
	                         // 일반 회원의 username 사용
	                         List<UsersDto> selectStoreHit = usersMapper.getSelectStoreHit(store_idx, username);
	                         System.out.println("selectStoreHit" + selectStoreHit);
	                         if (selectStoreHit.size() == 0) {
	                             int insertStoreHit = usersMapper.insertStoreHit(store_idx, username);
	                             System.out.println("insertStoreHit" + insertStoreHit);
	                         }
	                     }
	                 } else {
	                     model.addAttribute("error", "JWT 토큰이 없습니다.");
	                 }

	   
	       if (useruseridx == null) {
	           mv.addObject("needLoginMessage", "이 기능을 사용하기 위해선 로그인이 필요합니다.");
	           mv.setViewName("/mobile/login");
	           return mv;
	       }
	      
	      //System.out.println("스토어 HIT : " + insertStoreHit);
	      System.out.println("usersdto  : " + usersdto);
	      
	        // store_idx로 스토어 디테일 데이터 불러오기
	      UsersDto storedetail = usersMapper.getStoredetail(usersdto);
	      System.out.println("storedetail : " + storedetail);
	      
	      // 스토어 태그
	      List<UsersDto> storetag = usersMapper.getStoretag(usersdto);
	      System.out.println("storetag : " + storetag);
	      
	      //스토어 예약 구분
	      UsersDto StoreReservation = usersMapper.getStoreReservation(usersdto);
	      System.out.println("StoreReservation : " + StoreReservation);
	      
	      //운영시간 
	      UsersDto StoreOperation = usersMapper.getStoreOperation(usersdto);
	      System.out.println("StoreOperation : " + StoreOperation);
	      
	      // 카데고리
	      List<UsersDto> StoreCategory = usersMapper.getStoreCategory(usersdto);
	      System.out.println("StoreCategory : " + StoreCategory);
	      
	      // 조회수
	      UsersDto StoreHit = usersMapper.getStoreHit(usersdto);
	      System.out.println("StoreHit : " + StoreHit);
	      
	      //좋아요
	      UsersDto StoreLike = usersMapper.getStoreLike(usersdto);
	      System.out.println("StoreLike : " + StoreLike);
	      
	    //전체 리뷰 페이징
	          int start = (page - 1) * size; 
	          int totalStorePosts = usersMapper.gettotalPosts(usersdto);
	          int totalPages = (int) Math.ceil((double)totalStorePosts / size);
	          
	          int store_idx = usersdto.getStore_idx();
	          //전체 리뷰
	          List<UsersDto> totalreviews = usersMapper.gettotalreviews(store_idx,start,size);
	          for (UsersDto dto : totalreviews) {
	               String imagePath = dto.getImage_path().replace("\\", "/"); // 경로 수정
	             dto.setImage_path(imagePath); // 수정된 경로 다시 설정
	          }
	          System.out.println("전체리뷰 페이징후 : " + totalreviews);
	      
	      
	      // 핫리뷰 (조회수 기반 2개)
	      List<UsersDto> MobileHotReviews = usersMapper.getMobileHotReviews(usersdto);
	      for(UsersDto dto : MobileHotReviews) {
	         String imagePath = dto.getImage_path().replace("\\","/");
	         dto.setImage_path(imagePath);
	      }
	      System.out.println("모바일 핫리뷰 :" + MobileHotReviews);
	      
	      // 전체 리뷰 & 조회수
	      UsersDto totalcount = usersMapper.getotalcount(usersdto);
	      System.out.println("totalcount : " + totalcount);
	      
	      // 내가 쓴 리뷰 개수
	      UsersDto MyTotalReview = usersMapper.getMyTotalReview(usersdto,useruseridx);
	      System.out.println("내가 쓴 리뷰 데이터" + usersdto);
	      System.out.println("MyTotalReview : " + MyTotalReview);

	      //  팝콘 보유 수
	      UsersDto TotalPopcorn = usersMapper.getTotalPopcorn(username);
	      System.out.println("TotalPopcorn : " + TotalPopcorn);
	      

	      //이미지
	      List<UsersDto> PopupImgList = usersMapper.getPopupImgList(usersdto);
	      System.out.println("PopupImgList : " + PopupImgList);

	      List<String> PopImgPath = new ArrayList<>();
	      
	      for(UsersDto dto : PopupImgList) {
	         String imagePath = dto.getImage_path().replace("\\", "/");
	         System.out.println("리뷰 상세 이미지 패스 imagePath : " + imagePath);
	         PopImgPath.add(imagePath);
	      }
	      

	      
	      
	      mv.addObject("storedetail", storedetail);
	      mv.addObject("storetag", storetag);
	      mv.addObject("StoreReservation", StoreReservation);
	      mv.addObject("StoreOperation", StoreOperation);
	      mv.addObject("StoreCategory", StoreCategory);
	      mv.addObject("StoreHit", StoreHit);
	      mv.addObject("StoreLike", StoreLike);
	      mv.addObject("totalreviews", totalreviews);
	      mv.addObject("MobileHotReviews", MobileHotReviews);
	      mv.addObject("totalcount", totalcount);
	      mv.addObject("currentPage", page);
	     mv.addObject("totalPages", totalPages);
	      mv.addObject("MyTotalReview", MyTotalReview);
	      mv.addObject("TotalPopcorn", TotalPopcorn);
	      mv.addObject("PopImgPath", PopImgPath);
	      mv.setViewName("mobile/users/info");
	      return mv;
	   }

	   
	   
	   // 리뷰 상세 페이지 데이터(AJAX)
	   @RequestMapping("/ReviewDetail")
	   @ResponseBody
	   public Map<String,Object> reviewdetail(
	         @RequestParam(required = false,value = "storeidx") int storeidx,
	         @RequestParam(required = false,value = "useridx") int useridx,
	         @RequestParam(required = false,value = "review_idx") int review_idx,
	         @RequestParam(required = false,value = "loginidx") int loginidx,
	         Model model,HttpServletRequest request){
	      System.out.println("storeidx : " + storeidx);
	      System.out.println("useridx : " + useridx);
	      System.out.println("review_idx : " + review_idx);
	      System.out.println("loginidx : " + loginidx);
	      
	      //리뷰 상세 페이지
	      UsersDto ReviewDetail = usersMapper.getReviewDetail(storeidx, useridx, review_idx);
	      
	      // 이미지
	      List<UsersDto> ReviewImgList = usersMapper.getReviewImgList(storeidx, useridx, review_idx);
	      System.out.println("PopupImgList : " + ReviewImgList);

	      List<String> PopImgPath = new ArrayList<>();
	      
	      for(UsersDto dto : ReviewImgList) {
	         String imagePath = dto.getImage_path().replace("\\", "/");
	         System.out.println("이미지 패스 imagePath : " + imagePath);
	         PopImgPath.add(imagePath);
	      }
	      
	      System.out.println("리뷰 디테일 ReviewDetail" + ReviewDetail);
	      // 리뷰 조회수 조회
	      UsersDto selectReviewHit = usersMapper.getselectReviewHit(storeidx,useridx,review_idx,loginidx);
	      if (selectReviewHit == null) {
	            int insertReviewHit = usersMapper.insertReviewHit(storeidx, useridx,review_idx,loginidx);
	            System.out.println("insertStoreHit" + insertReviewHit);
	        }else {
	           
	        }
	      
	      
	      HashMap<String, Object> response = new HashMap<>();
	      response.put("ReviewDetail", ReviewDetail);
	      return response;
	   }
	   
	   // 리뷰 작성 폼 페이지
	   @RequestMapping("/Writeform")
	   public ModelAndView writeform(@RequestParam(required = false,value = "store_idx") int storeidx,
	         UsersDto usersdto,
	         Model model,HttpServletRequest request) {
	      System.out.println("작성 : storeidx : " + storeidx);
	      System.out.println("작성 : usersdto : " + usersdto);
	      
	      // 유저 번호 가지고 오기
	       Cookie[] cookies = request.getCookies();
	           String jwtToken = null;
	           boolean isKakaoUser = false;  // 카카오 사용자 여부를 판단하는 변수

	           if (cookies != null) {
	               for (int i = cookies.length - 1; i >= 0; i--) {
	                   Cookie cookie = cookies[i];
	                   if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
	                       jwtToken = cookie.getValue();
	                       System.out.println("토큰1 : " +jwtToken );
	                       if ("kakaoAccessToken".equals(cookie.getName())) {
	                           isKakaoUser = true;  // kakaoAccessToken 쿠키가 있으면 카카오 로그인 사용자로 판단
	                       }
	                       System.out.println("토큰: " + jwtToken);
	                       break; 
	                   }
	               }
	           }
	           String username = null;      //일반 유저 name 
	           Long useruseridx = null;     //일반유저 idx
	           
	           if (jwtToken != null) {
	               username = jwtUtil.extractUsername(jwtToken);
	               System.out.println("사용자 정보1: " + username);

	               if (isKakaoUser) {
	                   // 카카오 로그인 사용자라면 소셜 ID로 사용자 조회
	                   Optional<User> kakaouser = userService.findBySocialId(username);  // 카카오 소셜 ID로 사용자 조회
	                   System.out.println("카카오 사용자 정보: " + kakaouser);
	                   model.addAttribute("user", kakaouser.orElse(null));  // 카카오 사용자가 없을 경우 null 반환
	                   
	                   
	                 
	                 // 카카오 회원의 ID 사용
	                   username = kakaouser.get().getId();
	                   System.out.println("useridx" + useruseridx);
	                   useruseridx = kakaouser.get().getUserIdx();
	                   
	               } else {
	                   // 일반 사용자라면 기존 방식으로 사용자 조회
	                   Optional<User> user = userService.getUserByUsername(username);
	                   System.out.println("사용자 정보: " + user);
	                   model.addAttribute("user", user.orElse(null));  // 사용자가 없을 경우 null 반환
	                   
	                   
	                   useruseridx = user.get().getUserIdx();
	                   System.out.println("작성폼 useruseridx : " + useruseridx);
	               }
	           } else {
	               model.addAttribute("error", "JWT 토큰이 없습니다.");
	           }

	      
	      // store_idx로 스토어 디테일 데이터 불러오기
	      UsersDto storedetail = usersMapper.getStoredReviewtail(storeidx);
	      System.out.println("storedetail" + storedetail);

	      // 스토어 카테고리
	      List<UsersDto> storetag = usersMapper.getStoreReviewtag(storeidx);
	      System.out.println("storetag : " + storetag);
	      
	      // 전체 리뷰 & 조회수
	      UsersDto totalcount = usersMapper.getotalWriteCount(storeidx);
	      System.out.println("totalcount : " + totalcount);
	      
	      
	      ModelAndView mv = new ModelAndView();
	      mv.addObject("storedetail", storedetail);
	      mv.addObject("storetag", storetag);
	      mv.addObject("totalcount", totalcount);
	      mv.setViewName("mobile/users/writeform");
	      return mv;
	   }
	   
	   // 리뷰 작성 보내기
	   @RequestMapping("/Write")
	   public ModelAndView write(UsersDto usersdto,
	         Model model,HttpServletRequest request){
	      System.out.println("작성 받은 usersdto" + usersdto);
	      
	      //리뷰 작성
	      int insertReview = usersMapper.insertReview(usersdto);
	      
	      ModelAndView mv = new ModelAndView();
	      mv.addObject("insertReview", insertReview);
	      mv.setViewName("users/profile/myreview");
	      return mv;
	   }
	   
	// 리뷰 수정 폼 페이지
	   @RequestMapping("/Updateform")
	   public ModelAndView updateform(@RequestParam(required = false,value = "store_idx") int storeidx,
	         @RequestParam(required = false,value = "user_idx") int useridx,
	         @RequestParam(required = false,value = "review_idx") int review_idx) {
	      System.out.println("수정 : storeidx : " + storeidx);
	      System.out.println("수정 : useridx : " + useridx);
	      System.out.println("수정 : review_idx : " + review_idx);
	      
	      
	      // store_idx로 스토어 디테일 데이터 불러오기
	      UsersDto storedetail = usersMapper.getStoredReviewtail(storeidx);
	      System.out.println("storedetail" + storedetail);
	      
	      // 스토어 카테고리
	      List<UsersDto> storetag = usersMapper.getStoreReviewtag(storeidx);
	      System.out.println("storetag : " + storetag);
	      
	      // 전체 리뷰 & 조회수
	      UsersDto totalcount = usersMapper.getotalWriteCount(storeidx);
	      System.out.println("totalcount : " + totalcount);
	      
	      // 리뷰 상세 페이지
	      UsersDto ReviewDetail = usersMapper.getReviewDetail(storeidx,useridx,review_idx); 
	      System.out.println("ReviewDetail : " + ReviewDetail);
	      
	      ModelAndView mv = new ModelAndView();
	      mv.addObject("storedetail", storedetail);
	      mv.addObject("storetag", storetag);
	      mv.addObject("totalcount", totalcount);
	      mv.addObject("ReviewDetail", ReviewDetail);
	      mv.addObject("review_idx", review_idx);
	      mv.addObject("useridx", useridx);
	      mv.setViewName("mobile/users/updateform");
	      return mv;
	   }
	   
	   //리뷰 수정 페이지
	   @RequestMapping("/Update")
	   public ModelAndView update(UsersDto usersdto){
	      System.out.println("수정 받은 usersdto:" + usersdto);
	      
	      // 리뷰 수정
	      int updateReview = usersMapper.updateReview(usersdto);
	      
	      ModelAndView mv = new ModelAndView();
	      mv.addObject("updateReview", updateReview);
	      mv.setViewName("users/profile/myreview");
	      return mv;
	   }
	   
	   
	   // 리뷰 삭제 페이지
	   @RequestMapping("/Delete")
	   public ModelAndView delete(
	         @RequestParam(required = false,value = "store_idx") int storeidx,
	         @RequestParam(required = false,value = "user_idx") int useridx,
	         @RequestParam(required = false,value = "review_idx") int review_idx
	         ) {
	      
	      System.out.println("삭제 : storeidx : " + storeidx);
	      System.out.println("삭제 : useridx : " + useridx);
	      System.out.println("삭제 : review_idx : " + review_idx);
	      
	      int deleteReview = usersMapper.deleteReview(storeidx,useridx,review_idx);
	      
	      ModelAndView mv = new ModelAndView();
	      mv.setViewName("users/profile/myreview");
	      return mv;
	   }
	   
	   
	   
}
