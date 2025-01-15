package com.board.users.controller;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Optional;
import java.util.function.Function;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;


import com.board.business.dto.StoreDto;
import com.board.business.dto.StoreListDto;
import com.board.business.dto.ImageStoreDTO;
import com.board.business.dto.StoreDetailDto;
import com.board.users.dto.ImageDto;


import com.board.users.dto.CategoryRequest;
import com.board.users.dto.ReservationUsersDto;
import com.board.users.dto.SuggestionDto;
import com.board.users.dto.User;
import com.board.users.dto.UserCategory;
import com.board.users.dto.UsersBookmarkDto;
import com.board.users.dto.UsersDto;
import com.board.users.dto.UsersReviewListDto;
import com.board.users.mapper.UserBookmarkMapper;
import com.board.users.mapper.UserCategoryMapper;
import com.board.users.mapper.UserReservationMapper;
import com.board.users.mapper.UsersMapper;
import com.board.users.service.UserService;
import com.board.util.JwtUtil;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@Controller
@RequestMapping("/Users/Profile")
public class ProfileController {
	
	@Autowired
	private UsersMapper usersMapper;
	
	@Autowired
	private JwtUtil jwtUtil;
	
	@Autowired
	private UserService userService;
	

	
	@Autowired
	private UserCategoryMapper userCategoryMapper;
	
	@Autowired
    private UserReservationMapper userReservationMapper;
	
	@Autowired
	private UserBookmarkMapper userBookmarkMapper;

	
	// http://localhost:9090
    @RequestMapping("Home")
    public ModelAndView profile(HttpServletRequest request, Model model) {
        Cookie[] cookies = request.getCookies();
        String jwtToken = null;
        boolean isKakaoUser = false;  // 카카오 사용자 여부를 판단하는 변수

        if (cookies != null) {
            for (int i = cookies.length - 1; i >= 0; i--) {
                Cookie cookie = cookies[i];
                if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
                    jwtToken = cookie.getValue();
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
                model.addAttribute("userIdx", user.get().getUserIdx());
                System.out.printf("userIdx:", user.get().getUserIdx());
                model.addAttribute("user", user.orElse(null));  // 사용자가 없을 경우 null 반환
            }
        } else {
            model.addAttribute("error", "JWT 토큰이 없습니다.");
        }

        ModelAndView mv = new ModelAndView();
        mv.setViewName("users/profile/home");
        return mv;
    }

    
    @RequestMapping("UpdateProfileForm")
    public ModelAndView updateprofileForm(HttpServletRequest request, Model model) {
        Cookie[] cookies = request.getCookies();
        String jwtToken = null;
        boolean isKakaoUser = false;  // 카카오 사용자 여부를 판단하는 변수

        if (cookies != null) {
            for (int i = cookies.length - 1; i >= 0; i--) {
                Cookie cookie = cookies[i];
                if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
                    jwtToken = cookie.getValue();
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
                model.addAttribute("userIdx", user.get().getUserIdx());
                System.out.printf("userIdx:", user.get().getUserIdx());
                model.addAttribute("user", user.orElse(null));  // 사용자가 없을 경우 null 반환
            }
        } else {
            model.addAttribute("error", "JWT 토큰이 없습니다.");
        }

        ModelAndView mv = new ModelAndView();
        mv.setViewName("users/profile/updateprofile");
        return mv;
    }


    @RequestMapping("DeleteUser")
    public ResponseEntity<?> deleteUser(HttpServletRequest request, HttpServletResponse response) {
        Cookie[] cookies = request.getCookies();
        String jwtToken = null;

        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
                    jwtToken = cookie.getValue();
                    break;
                }
            }
        }

        if (jwtToken != null) {
            String userId = jwtUtil.extractUsername(jwtToken);
            UsersDto user = usersMapper.getUserById(userId);

            if (user != null) {
                usersMapper.deleteUser(user.getUser_idx()); 
                // 쿠키 삭제
                Cookie cookie = new Cookie("userJwt", null);
                cookie.setMaxAge(0);
                cookie.setPath("/");
                response.addCookie(cookie);

                return ResponseEntity.ok().body("User deleted successfully");
            } else {
                return ResponseEntity.status(HttpStatus.NOT_FOUND).body("User not found");
            }
        } else {
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("JWT token is missing");
        }
    }

    
    @RequestMapping(value = "UpdateProfile", method = RequestMethod.POST)
    public ModelAndView updateProfile(@ModelAttribute UsersDto usersDto, HttpServletRequest request) {
        ModelAndView mv = new ModelAndView();
        
        // 현재 로그인한 사용자의 userIdx 가져오기
        Cookie[] cookies = request.getCookies();
        String jwtToken = null;
        
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
                    jwtToken = cookie.getValue();
                    break;
                }
            }
        }
        
        if (jwtToken != null) {
            String username = jwtUtil.extractUsername(jwtToken);
            Optional<User> user = userService.getUserByUsername(username);
            
            if (user.isPresent()) {
                // UsersDto에 현재 사용자의 userIdx 설정
            	usersDto.setUser_idx(user.get().getUserIdx().intValue());
                
                // MyBatis를 통해 사용자 정보 업데이트
                int result = usersMapper.updateUserProfile(usersDto);
                
                if (result > 0) {
                    mv.addObject("message", "프로필이 성공적으로 업데이트되었습니다.");
                } else {
                    mv.addObject("error", "프로필 업데이트에 실패했습니다.");
                }
            } else {
                mv.addObject("error", "사용자를 찾을 수 없습니다.");
            }
        } else {
            mv.addObject("error", "인증 토큰이 없습니다.");
        }
        
        mv.setViewName("redirect:/Users/Profile/Home");
        return mv;
    }
    
 
    @RequestMapping("Bookmark")
    public ModelAndView bookmark(HttpServletRequest request, Model model) {
        Cookie[] cookies = request.getCookies();
        String jwtToken = null;
        boolean isKakaoUser = false;  // 카카오 사용자 여부를 판단하는 변수

        if (cookies != null) {
            for (int i = cookies.length - 1; i >= 0; i--) {
                Cookie cookie = cookies[i];
                if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
                    jwtToken = cookie.getValue();
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
                
                
                UsersDto userid = userReservationMapper.getUserByUsername(username);
                int user_idx = userid.getUser_idx();
                List<UsersBookmarkDto> BookmarkList = userBookmarkMapper.getbookmark(user_idx);
                for (UsersBookmarkDto bookmarkdto : BookmarkList) {
                	String imagePath = bookmarkdto.getImage_path().replace("\\", "/");
                	bookmarkdto.setImage_path(imagePath);
                }
       
                
                System.out.println("이거나오나요?" + BookmarkList);
                
                model.addAttribute("BookmarkList", BookmarkList);
                model.addAttribute("user", user.orElse(null));  // 사용자가 없을 경우 null 반환
            }
        } else {
            model.addAttribute("error", "JWT 토큰이 없습니다.");
        }

        ModelAndView mv = new ModelAndView();
        mv.setViewName("users/profile/bookmark");
        return mv;
    }
 

    @RequestMapping("Myreview")
    public ModelAndView myreview(HttpServletRequest request, Model model) {
        Cookie[] cookies = request.getCookies();
        String jwtToken = null;
        boolean isKakaoUser = false;  // 카카오 사용자 여부를 판단하는 변수

        if (cookies != null) {
            for (int i = cookies.length - 1; i >= 0; i--) {
                Cookie cookie = cookies[i];
                if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
                    jwtToken = cookie.getValue();
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
                
                UsersDto userid = userReservationMapper.getUserByUsername(username);
                int user_idx = userid.getUser_idx();
                List<UsersReviewListDto> ReviewList = userBookmarkMapper.getReview(user_idx);
                for (UsersReviewListDto reviewdto : ReviewList) {
                	String imagePath = reviewdto.getImage_path().replace("\\", "/");
                	reviewdto.setImage_path(imagePath);
                }
                
                System.out.println("이거뭘로나오나요?" + ReviewList);
                int reviewCount = userBookmarkMapper.countReviewsByUserId(user_idx);
                System.out.println("몇개인가요" + reviewCount);
                
                model.addAttribute("ReviewList", ReviewList);
                model.addAttribute("reviewCount" , reviewCount);
                model.addAttribute("user", user.orElse(null));  // 사용자가 없을 경우 null 반환
            }
        } else {
            model.addAttribute("error", "JWT 토큰이 없습니다.");
        }

        
        ModelAndView mv = new ModelAndView();
        mv.setViewName("users/profile/myreview");
        return mv;
    }


    @RequestMapping("Reservation")
    public ModelAndView reservation(HttpServletRequest request, Model model) {
    	ModelAndView mv = new ModelAndView();
        Cookie[] cookies = request.getCookies();
        String jwtToken = null;

        // JWT 토큰 가져오기
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
                    jwtToken = cookie.getValue();
                    System.out.println("토큰: " + jwtToken);
                    break;
                }
            }
        }

        // JWT 토큰이 존재하는지 확인
        if (jwtToken != null) {
            String username = jwtUtil.extractUsername(jwtToken);
            System.out.println("사용자 정보예약: " + username);

            UsersDto user = userReservationMapper.getUserByUsername(username);
            System.out.println("유저:" + user);
            if (user != null) {
                Integer user_idx = user.getUser_idx();
                List<ReservationUsersDto> reservations = userReservationMapper.getUserReservations(user_idx);
                
                List<Long> storeIdxList = new ArrayList<>();
                for(ReservationUsersDto dto : reservations) {
                	storeIdxList.add(dto.getStore_idx());
                		}
                for(Long storeIdx : storeIdxList ) {
                System.out.println("예약 내역 개수: " + reservations.size());
                System.out.println("예약 내역 : " + reservations);
                }
                
                
                List<StoreDto> stores = userReservationMapper.getStoresForReservations(user_idx);
                System.out.println("이상한거" + stores);
                // 스토어 인덱스 리스트를 이용해 이미지 데이터를 가져옴
                
           
                List<ImageDto> TestList = userReservationMapper.getTestList(user_idx);
                for (ImageDto testdto : TestList) {
                	String imagePath = testdto.getImage_path().replace("\\", "/");
                	testdto.setImage_path(imagePath);
                }
                System.out.println("테스트 리스트 : " + TestList);

                model.addAttribute("reservations", reservations);
                model.addAttribute("stores", stores);
                model.addAttribute("TestList", TestList);
                //model.addAttribute("imageStore", imageStores); // 이미지 데이터 추가
                model.addAttribute("user", user);
            } else {
                model.addAttribute("error", "사용자를 찾을 수 없습니다.");
            }
        } else {
            model.addAttribute("error", "JWT 토큰이 없습니다.");
        }

        
        mv.setViewName("users/profile/reservation");
        return mv;
    }


    @RequestMapping("Suggestion")
    public ModelAndView suggestion(HttpServletRequest request, Model model) {
    	Cookie[] cookies = request.getCookies();
        String jwtToken = null;
        boolean isKakaoUser = false;  // 카카오 사용자 여부를 판단하는 변수

        if (cookies != null) {
            for (int i = cookies.length - 1; i >= 0; i--) {
                Cookie cookie = cookies[i];
                if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
                    jwtToken = cookie.getValue();
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
                
                
                UsersDto userid = userReservationMapper.getUserByUsername(username);
                int user_idx = userid.getUser_idx();
                
                List<SuggestionDto> categoryList = userBookmarkMapper.getcategory(user_idx);
                System.out.println("카테고리 잘 오나?" + categoryList);
                
                List<SuggestionDto> storeList = userBookmarkMapper.getstorelist(user_idx);
                System.out.println("스토어 목록 잘 오나?" + storeList);
                
                for (SuggestionDto suggestdto : storeList) {
                	String imagePath = suggestdto.getImage_path().replace("\\", "/");
                	suggestdto.setImage_path(imagePath);
                }
                System.out.println("스토어 목록 잘 오나2?" + storeList);
                
                
                model.addAttribute("storeList" , storeList);
                model.addAttribute("categoryList", categoryList);
                model.addAttribute("user", user.orElse(null));  // 사용자가 없을 경우 null 반환
            }
        } else {
            model.addAttribute("error", "JWT 토큰이 없습니다.");
        }

        ModelAndView mv = new ModelAndView();
        mv.setViewName("users/profile/suggestion");
        return mv;
    }



    @GetMapping("/GetCategories")
    @ResponseBody
    public List<Integer> getCategories(@RequestParam int userIdx) {
        return userCategoryMapper.getUserCategories(userIdx);
    }


    @PostMapping("/addCategory")
    @ResponseBody
    public String addCategory(@RequestBody CategoryRequest request) {
        try {
            UserCategory userCategory = new UserCategory();
            userCategory.setUserIdx(request.getUserIdx());
            userCategory.setCategoryId(request.getCategoryId());
            userCategoryMapper.insertUserCategory(userCategory);
            return "success";
        } catch (Exception e) {
            e.printStackTrace(); // 스택 트레이스를 출력하여 문제를 진단
            return "error: " + e.getMessage(); // 오류 메시지를 반환
        }
    }

    @PostMapping("/deleteCategory")
    @ResponseBody
    public String deleteCategory(@RequestBody CategoryRequest request) {
        try {
            // userIdx와 categoryId 값을 콘솔에 출력
            System.out.println("userIdx: " + request.getUserIdx());
            System.out.println("categoryId: " + request.getCategoryId());

            int rowsAffected = userCategoryMapper.deleteUserCategory(request.getUserIdx(), request.getCategoryId());
            if (rowsAffected > 0) {
                return "success";
            } else {
                return "카테고리가 존재하지 않거나 이미 삭제되었습니다."; // 이 메시지가 응답으로 반환될 수 있음
            }
        } catch (Exception e) {
            e.printStackTrace(); // 스택 트레이스를 출력하여 문제를 진단
            return "error: " + e.getMessage(); // 오류 메시지를 반환
        }
    }
    
}