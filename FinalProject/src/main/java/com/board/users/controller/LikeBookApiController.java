package com.board.users.controller;

import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.board.users.dto.User;
import com.board.users.dto.UsersDto;
import com.board.users.service.LikeBookService;
import com.board.users.service.UserService;
import com.board.util.JwtUtil;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/Popup")
public class LikeBookApiController {
     
	@Autowired
	private LikeBookService likeBookService;
	
	@Autowired
	private JwtUtil jwtUtil;
	
	@Autowired
	private UserService userService;
	
	@PostMapping("/Like/Write")
	public ResponseEntity <String> LikeWrite(@RequestBody HashMap<String, Object> map) {
		String LikeCount = likeBookService.insertLikeStore(map);		
		return    ResponseEntity.status(HttpStatus.OK).body( LikeCount );
	}
	@PostMapping("/Like/Config")
	public ResponseEntity <Integer> LikeConfig(@RequestBody HashMap<String, Object> map) {
		Integer ls_idx = likeBookService.getIsIdx(map);		
		return    ResponseEntity.status(HttpStatus.OK).body( ls_idx );
	}

	@DeleteMapping("/Like/Delete")
	public ResponseEntity <String> LikeDelete(@RequestBody HashMap<String, Object> map) {
		String LikeCount = likeBookService.deleteLikeStore(map);	
		return    ResponseEntity.status(HttpStatus.OK).body( LikeCount );
	}
	
	@PostMapping("/Like/Review/Config")
	public ResponseEntity <Integer> LikeReviewConfig(@RequestBody HashMap<String, Object> map) {
		Integer lr_idx = likeBookService.getLrIdx(map);		
		return    ResponseEntity.status(HttpStatus.OK).body( lr_idx );
	}
	@PostMapping("/Like/Review/Write")
	public ResponseEntity <String> LikeReviewWrite(@RequestBody HashMap<String, Object> map) {					
		String LikeCount = likeBookService.insertLikeReview(map);		
		return    ResponseEntity.status(HttpStatus.OK).body( LikeCount );
	}	
	
	@DeleteMapping("/Like/Reivew/Delete")
	public ResponseEntity <String> LikeReivewDelete(@RequestBody HashMap<String, Object> map) {					
		String LikeCount = likeBookService.deleteLikeReview(map);		
		return    ResponseEntity.status(HttpStatus.OK).body( LikeCount );
	}
	
	@PostMapping("/Bookmark/Config")
	public ResponseEntity <Integer> BookingConfig(@RequestBody HashMap<String, Object> map) {
		Integer bookmark_idx = likeBookService.getBookmarkIdx(map);		
		return    ResponseEntity.status(HttpStatus.OK).body( bookmark_idx );
	}	
		
	@PostMapping("/Bookmark/Write")
	public ResponseEntity <String> BookingwWrite(@RequestBody HashMap<String, Object> map) {					
		likeBookService.insertBook(map);		
		String result = "완료";
		return    ResponseEntity.status(HttpStatus.OK).body( result );
	}	
	
	@DeleteMapping("/Bookmark/Delete")
	public ResponseEntity<Map<String, String>> BookmarkDelete(@RequestBody HashMap<String, Object> map) {					
	   likeBookService.deleteBook(map);		
	   Map<String, String> response = new HashMap<>();
	   response.put("result", "삭제완료");
		return    ResponseEntity.status(HttpStatus.OK).body( response );
	}
   @DeleteMapping("/Bookmark/DeleteStable")
   public ResponseEntity <String> BookmarkDeleteStable(@RequestBody HashMap<String, Object> map) {               
      String  result = "삭제완료";
      likeBookService.deleteBookStable(map);      
      return    ResponseEntity.status(HttpStatus.OK).body( result );
   }   
	
	@PostMapping("/Mobile/Like/Write")
	public ResponseEntity<?> MobileLikeWrite(@RequestBody HashMap<String, Object> map, HttpServletRequest request, Model model) {
		Cookie[] cookies = request.getCookies();
		String jwtToken = null;
		boolean isKakaoUser = false; // 카카오 사용자 여부를 판단하는 변수
		if (cookies != null) {
			for (int i = cookies.length - 1; i >= 0; i--) {
				Cookie cookie = cookies[i];
				if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
					jwtToken = cookie.getValue();
					System.out.println("토큰1 : " + jwtToken);
					if ("kakaoAccessToken".equals(cookie.getName())) {
						isKakaoUser = true; // kakaoAccessToken 쿠키가 있으면 카카오 로그인 사용자로 판단
					}
					System.out.println("토큰: " + jwtToken);
					break;
				}
			}
		}
		String username = null;
		Long user_idx = null;

		if (jwtToken != null) {
			username = jwtUtil.extractUsername(jwtToken);
			System.out.println("사용자 정보1: " + username);
			if (username != null) {
				if (isKakaoUser) {
					// 카카오 로그인 사용자라면 소셜 ID로 사용자 조회
					Optional<User> kakaouser = userService.findBySocialId(username); // 카카오 소셜 ID로 사용자 조회
					System.out.println("카카오 사용자 정보: " + kakaouser);
					model.addAttribute("user", kakaouser.orElse(null)); // 카카오 사용자가 없을 경우 null 반환

					// 카카오 회원의 ID 사용
					username = kakaouser.get().getId();
					user_idx = kakaouser.get().getUserIdx();
					System.out.println("useridx" + user_idx);

				} else {
					// 일반 사용자라면 기존 방식으로 사용자 조회
					Optional<User> user = userService.getUserByUsername(username);
					System.out.println("사용자 정보: " + user);
					model.addAttribute("user", user.orElse(null)); // 사용자가 없을 경우 null 반환

					user_idx = user.get().getUserIdx();

					System.out.println("useruseridx : " + user_idx);
				}
			} else {
				model.addAttribute("error", "JWT 토큰이 없습니다.");
			}
		}
		if (user_idx == null || username == null) {
            // 클라이언트에 리다이렉션 정보를 포함하여 401 상태 코드 반환
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Redirect to /Mobile/Users/LoginForm");
        }

		map.put("user_idx", user_idx);
		String LikeCount = likeBookService.insertLikeStore(map);		
		return    ResponseEntity.status(HttpStatus.OK).body( LikeCount );
	}
	@PostMapping("/Mobile/Like/Config")
	public ResponseEntity<?> MobileLikeConfig(@RequestBody HashMap<String, Object> map, HttpServletRequest request, Model model) {
		Cookie[] cookies = request.getCookies();
		String jwtToken = null;
		boolean isKakaoUser = false; // 카카오 사용자 여부를 판단하는 변수
		if (cookies != null) {
			for (int i = cookies.length - 1; i >= 0; i--) {
				Cookie cookie = cookies[i];
				if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
					jwtToken = cookie.getValue();
					System.out.println("토큰1 : " + jwtToken);
					if ("kakaoAccessToken".equals(cookie.getName())) {
						isKakaoUser = true; // kakaoAccessToken 쿠키가 있으면 카카오 로그인 사용자로 판단
					}
					System.out.println("토큰: " + jwtToken);
					break;
				}
			}
		}
		String username = null;
		Long user_idx = null;

		if (jwtToken != null) {
			username = jwtUtil.extractUsername(jwtToken);
			System.out.println("사용자 정보1: " + username);
			if (username != null) {
				if (isKakaoUser) {
					// 카카오 로그인 사용자라면 소셜 ID로 사용자 조회
					Optional<User> kakaouser = userService.findBySocialId(username); // 카카오 소셜 ID로 사용자 조회
					System.out.println("카카오 사용자 정보: " + kakaouser);
					model.addAttribute("user", kakaouser.orElse(null)); // 카카오 사용자가 없을 경우 null 반환

					// 카카오 회원의 ID 사용
					username = kakaouser.get().getId();
					user_idx = kakaouser.get().getUserIdx();
					System.out.println("useridx" + user_idx);

				} else {
					// 일반 사용자라면 기존 방식으로 사용자 조회
					Optional<User> user = userService.getUserByUsername(username);
					System.out.println("사용자 정보: " + user);
					model.addAttribute("user", user.orElse(null)); // 사용자가 없을 경우 null 반환

					user_idx = user.get().getUserIdx();

					System.out.println("useruseridx : " + user_idx);
				}
			} else {
				model.addAttribute("error", "JWT 토큰이 없습니다.");
			}
		}
		if (user_idx == null || username == null) {
            // 클라이언트에 리다이렉션 정보를 포함하여 401 상태 코드 반환
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Redirect to /Mobile/Users/LoginForm");
        }

		map.put("user_idx", user_idx);
		Integer ls_idx = likeBookService.getIsIdx(map);		
		return    ResponseEntity.status(HttpStatus.OK).body( ls_idx );
	}
	
	@PostMapping("/Mobile/Bookmark/Config")
	public ResponseEntity<?> MobileBookingConfig(@RequestBody HashMap<String, Object> map, HttpServletRequest request, Model model) {
		Cookie[] cookies = request.getCookies();
		String jwtToken = null;
		boolean isKakaoUser = false; // 카카오 사용자 여부를 판단하는 변수
		if (cookies != null) {
			for (int i = cookies.length - 1; i >= 0; i--) {
				Cookie cookie = cookies[i];
				if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
					jwtToken = cookie.getValue();
					System.out.println("토큰1 : " + jwtToken);
					if ("kakaoAccessToken".equals(cookie.getName())) {
						isKakaoUser = true; // kakaoAccessToken 쿠키가 있으면 카카오 로그인 사용자로 판단
					}
					System.out.println("토큰: " + jwtToken);
					break;
				}
			}
		}
		String username = null;
		Long user_idx = null;

		if (jwtToken != null) {
			username = jwtUtil.extractUsername(jwtToken);
			System.out.println("사용자 정보1: " + username);
			if (username != null) {
				if (isKakaoUser) {
					// 카카오 로그인 사용자라면 소셜 ID로 사용자 조회
					Optional<User> kakaouser = userService.findBySocialId(username); // 카카오 소셜 ID로 사용자 조회
					System.out.println("카카오 사용자 정보: " + kakaouser);
					model.addAttribute("user", kakaouser.orElse(null)); // 카카오 사용자가 없을 경우 null 반환

					// 카카오 회원의 ID 사용
					username = kakaouser.get().getId();
					user_idx = kakaouser.get().getUserIdx();
					System.out.println("useridx" + user_idx);

				} else {
					// 일반 사용자라면 기존 방식으로 사용자 조회
					Optional<User> user = userService.getUserByUsername(username);
					System.out.println("사용자 정보: " + user);
					model.addAttribute("user", user.orElse(null)); // 사용자가 없을 경우 null 반환

					user_idx = user.get().getUserIdx();

					System.out.println("useruseridx : " + user_idx);
				}
			} else {
				model.addAttribute("error", "JWT 토큰이 없습니다.");
			}
		}
		if (user_idx == null || username == null) {
            // 클라이언트에 리다이렉션 정보를 포함하여 401 상태 코드 반환
            return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body("Redirect to /Mobile/Users/LoginForm");
        }

        
	    map.put("user_idx", user_idx); // Add user_idx to the map
	    Integer bookmark_idx = likeBookService.getBookmarkIdx(map);
	    return ResponseEntity.status(HttpStatus.OK).body(bookmark_idx);
	}

	@PostMapping("/Mobile/Bookmark/Write")
	public ResponseEntity<Map<String, String>> MobileBookingWrite(@RequestBody HashMap<String, Object> map, HttpServletRequest request, Model model) {
		Cookie[] cookies = request.getCookies();
		String jwtToken = null;
		boolean isKakaoUser = false; // 카카오 사용자 여부를 판단하는 변수
		if (cookies != null) {
			for (int i = cookies.length - 1; i >= 0; i--) {
				Cookie cookie = cookies[i];
				if ("userJwt".equals(cookie.getName()) || "kakaoAccessToken".equals(cookie.getName())) {
					jwtToken = cookie.getValue();
					System.out.println("토큰1 : " + jwtToken);
					if ("kakaoAccessToken".equals(cookie.getName())) {
						isKakaoUser = true; // kakaoAccessToken 쿠키가 있으면 카카오 로그인 사용자로 판단
					}
					System.out.println("토큰: " + jwtToken);
					break;
				}
			}
		}
		String username = null;
		Long user_idx = null;

		if (jwtToken != null) {
			username = jwtUtil.extractUsername(jwtToken);
			System.out.println("사용자 정보1: " + username);
			if (username != null) {
				if (isKakaoUser) {
					// 카카오 로그인 사용자라면 소셜 ID로 사용자 조회
					Optional<User> kakaouser = userService.findBySocialId(username); // 카카오 소셜 ID로 사용자 조회
					System.out.println("카카오 사용자 정보: " + kakaouser);
					model.addAttribute("user", kakaouser.orElse(null)); // 카카오 사용자가 없을 경우 null 반환

					// 카카오 회원의 ID 사용
					username = kakaouser.get().getId();
					user_idx = kakaouser.get().getUserIdx();
					System.out.println("useridx" + user_idx);

				} else {
					// 일반 사용자라면 기존 방식으로 사용자 조회
					Optional<User> user = userService.getUserByUsername(username);
					System.out.println("사용자 정보: " + user);
					model.addAttribute("user", user.orElse(null)); // 사용자가 없을 경우 null 반환

					user_idx = user.get().getUserIdx();

					System.out.println("useruseridx : " + user_idx);
				}
			} else {
				model.addAttribute("error", "JWT 토큰이 없습니다.");
			}
		}
		if (user_idx == null || username == null) {
            // 클라이언트에 리다이렉션 정보를 포함하여 401 상태 코드 반환
			return ResponseEntity.status(HttpStatus.UNAUTHORIZED).body(Collections.singletonMap("redirect", "/Mobile/Users/LoginForm"));
        }
		map.put("user_idx", user_idx); // Add user_idx to the map
	    likeBookService.insertBook(map);
	    Map<String, String> response = new HashMap<>();
	    response.put("result", "완료");
	    return ResponseEntity.status(HttpStatus.OK).body(response);
	}


}
