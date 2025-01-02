package com.board.users.controller;

import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.board.jwt.JwtUtil;
import com.board.users.dto.CategoryRequest;
import com.board.users.dto.User;
import com.board.users.dto.UserCategory;
import com.board.users.mapper.UserCategoryMapper;
import com.board.users.mapper.UsersMapper;
import com.board.users.service.UserService;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

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
                model.addAttribute("user", user.orElse(null));  // 사용자가 없을 경우 null 반환
            }
        } else {
            model.addAttribute("error", "JWT 토큰이 없습니다.");
        }

        ModelAndView mv = new ModelAndView();
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