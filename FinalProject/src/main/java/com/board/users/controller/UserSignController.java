package com.board.users.controller;

import java.io.ByteArrayOutputStream;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.oauth2.client.registration.ClientRegistration;
import org.springframework.security.oauth2.client.registration.ClientRegistrationRepository;
import org.springframework.security.oauth2.client.web.OAuth2AuthorizationRequestRedirectFilter;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.board.users.dto.User;
import com.board.users.mapper.PopcornMapper;
import com.board.users.service.UserService;
import com.board.util.JwtUtil;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.warrenstrange.googleauth.GoogleAuthenticator;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Users")
public class UserSignController {

	@Autowired
	private PopcornMapper popcornMapper; //팝콘지갑,로그,출석 추가용 
	
    @Autowired
    private UserService userService;
    
    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;

    public UserSignController(AuthenticationManager authenticationManager, JwtUtil jwtUtil) {
        this.authenticationManager = authenticationManager;
        this.jwtUtil = jwtUtil;
    }
    
    @Autowired
    private ClientRegistrationRepository clientRegistrationRepository;

	
	/* 회원가입 */
    @GetMapping("/SignupForm")
    public String signupForm(@RequestParam(required = false) String email, Model model) {
        model.addAttribute("email", email);
        return "signup";
    }
    @GetMapping( "/CheckDuplication" )
    @ResponseBody
    public String checkDuplication(@RequestParam(value="id") String id ) {
      
       Optional<User> user = userService.findByUserId(id);
        if (user.isEmpty()) {
            return "가능";  // 아이디가 존재하지 않으면 가능
        }
        return "불가능";  // 아이디가 존재하면 불가능
    }
    

    //날짜 변환
    @InitBinder
    public void initBinder(WebDataBinder binder) {
        SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
        dateFormat.setLenient(false);
        binder.registerCustomEditor(Date.class, "birthdate", new CustomDateEditor(dateFormat, true));
    }
    @PostMapping("/Signup")
    public String registerUser(@ModelAttribute User user) {
        userService.registerUser(user);
        
        popcornMapper.createPopcornWallet(user); //팝콘 지갑 생성
        popcornMapper.createUserAttendance(user);//출석 테이블 생성
        popcornMapper.createPopcornLog(user);//팝콘 내역 생성
        
        return "redirect:/Users/LoginForm";
    }
    /*========================================================*/
    
    /* 로그인/로그아웃 */
	@RequestMapping("/LoginForm")
	public  String   loginform() {
		return "login";
	}
	
	@GetMapping("/KakaoCallBack")
	public String kakaoCallBack(HttpSession session, HttpServletResponse response, Model model) {
	    String jwt = (String) session.getAttribute("jwt");
	    String accessToken = (String) session.getAttribute("accessToken");

	    session.removeAttribute("jwt");
	    session.removeAttribute("accessToken");

	    response.setHeader("Authorization", "Bearer " + jwt);

	    model.addAttribute("jwt", jwt);
	    model.addAttribute("accessToken", accessToken);

	    return "callback";
	}
	
    @GetMapping("/2fa")
    public String show2faPage() {
        return "admin/otp";  // 2FA 입력 페이지
    }

    @PostMapping("/Admin/otp")
    public String processAdminOtp(@RequestParam String code, Authentication authentication, HttpSession session) {
		
        if (isValidAdminOTP(code, session)) {
        	
            // 인증 성공 처리
            List<GrantedAuthority> updatedAuthorities = new ArrayList<>(authentication.getAuthorities());
            updatedAuthorities.add(new SimpleGrantedAuthority("2FA_AUTHENTICATED"));
            Authentication updatedAuth = new UsernamePasswordAuthenticationToken(
                authentication.getPrincipal(),
                authentication.getCredentials(),
                updatedAuthorities
            );
    		System.out.println("갱신정보"+ updatedAuth);
            SecurityContextHolder.getContext().setAuthentication(updatedAuth);

            session.removeAttribute("adminOtpSecretKey");
            session.setMaxInactiveInterval(36000); // 단위는 초입니다. 1800초는 30분입니다.
            session.setAttribute("mfaAuthenticated", true);
            return "redirect:/Admin/Dashboard";
        }
        return "error";
    }

    private boolean isValidAdminOTP(String code, HttpSession session) {
        GoogleAuthenticator gAuth = new GoogleAuthenticator();
        String secretKey = (String) session.getAttribute("adminOtpSecretKey");
		System.out.println("!!!!!!!!"+ secretKey);

        if (secretKey == null) {
            return false; // 비밀 키가 없으면 실패
        }
        try {
            int verificationCode = Integer.parseInt(code);
            System.out.println("인증코드"+ verificationCode);
            boolean isAuthorized = gAuth.authorize(secretKey, verificationCode);  // OTP 검증
            System.out.println("OTP 인증 결과: " + isAuthorized);
            return isAuthorized;
        } catch (NumberFormatException e) {
            return false;
        }
    }
    
    
    public String getAdminQRBarcode(String username, String secretKey) {
        String issuer = "POPCORN";
        return "otpauth://totp/" + issuer + ":" + username + "?secret=" + secretKey + "&issuer=" + issuer;
    }
    
    public byte[] generateQRCodeImage(String barcodeText) throws Exception {
        QRCodeWriter barcodeWriter = new QRCodeWriter();
        BitMatrix bitMatrix = barcodeWriter.encode(barcodeText, BarcodeFormat.QR_CODE, 200, 200);

        try (ByteArrayOutputStream outputStream = new ByteArrayOutputStream()) {
            MatrixToImageWriter.writeToStream(bitMatrix, "PNG", outputStream);
            return outputStream.toByteArray();
        }
    }
    
    @GetMapping("/Admin/otp/qrcode")
    @ResponseBody
    public ResponseEntity<byte[]> getAdminQRCode( HttpSession session) {
        SecurityContext context = (SecurityContext) session.getAttribute("SPRING_SECURITY_CONTEXT");
        String username = context.getAuthentication().getName();
        String secretKey = (String) session.getAttribute("adminOtpSecretKey");
        if (secretKey == null) {
            return ResponseEntity.badRequest().build();
        }
        String qrCodeText = getAdminQRBarcode(username, secretKey);
        try {
            byte[] qrCodeImage = generateQRCodeImage(qrCodeText);
            return ResponseEntity.ok().contentType(MediaType.IMAGE_PNG).body(qrCodeImage);
        } catch (Exception e) {
            return ResponseEntity.status(HttpStatus.INTERNAL_SERVER_ERROR).build();
        }
    }


	

	@PostMapping("/Logout")
	public ResponseEntity<String> logout(HttpServletResponse response, HttpSession session, HttpServletRequest request) {
		session.removeAttribute("mfaAuthenticated");
        Cookie[] cookies = request.getCookies();
        if (cookies != null) {
            for (Cookie cookie : cookies) {
                if (cookie.getName().equals("jwt")||cookie.getName().equals("userJwt")||cookie.getName().equals("kakaoAccessToken")) {
                    cookie.setMaxAge(0); // 쿠키의 만료시간을 0으로 설정하여 삭제
                    cookie.setHttpOnly(true); // HttpOnly 설정
                    cookie.setSecure(true);
                    cookie.setPath("/");
                    response.addCookie(cookie);
                    break;
                }
            }
        }
		Cookie jwt = new Cookie("jwt", null);
		jwt.setMaxAge(0);
		jwt.setValue(null);
		jwt.setPath("/");
		jwt.setHttpOnly(true);
		jwt.setSecure(true);
		response.addCookie(jwt);
		
		Cookie userJwtCookie = new Cookie("userJwt", null);
		userJwtCookie.setMaxAge(0);
		userJwtCookie.setValue(null);
		userJwtCookie.setPath("/");
		userJwtCookie.setHttpOnly(true);
		userJwtCookie.setSecure(true);
		response.addCookie(userJwtCookie);

        // kakaoAccessToken 쿠키 삭제
        Cookie kakaoAccessTokenCookie = new Cookie("kakaoAccessToken", null);
        kakaoAccessTokenCookie.setMaxAge(0); // 즉시 만료
        kakaoAccessTokenCookie.setPath("/"); // 쿠키 경로 설정
        kakaoAccessTokenCookie.setValue(null);
        kakaoAccessTokenCookie.setHttpOnly(true);
        kakaoAccessTokenCookie.setSecure(true);
        response.addCookie(kakaoAccessTokenCookie);
	    SecurityContextHolder.clearContext();
	    session = request.getSession(false);
	    if (session != null) {
	        session.invalidate();
	    }
	    return ResponseEntity.ok().build();
	}


}
