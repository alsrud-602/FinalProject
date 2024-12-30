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

import com.board.jwt.JwtUtil;
import com.board.users.dto.User;
import com.board.users.service.UserService;
import com.google.zxing.BarcodeFormat;
import com.google.zxing.client.j2se.MatrixToImageWriter;
import com.google.zxing.common.BitMatrix;
import com.google.zxing.qrcode.QRCodeWriter;
import com.warrenstrange.googleauth.GoogleAuthenticator;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Users")
public class UserSignController {

    @Autowired
    private UserService userService;
    
    private final AuthenticationManager authenticationManager;
    private final JwtUtil jwtUtil;

    public UserSignController(AuthenticationManager authenticationManager, JwtUtil jwtUtil) {
        this.authenticationManager = authenticationManager;
        this.jwtUtil = jwtUtil;
    }
    
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

	    // JWT를 응답 헤더에 추가
	    response.setHeader("Authorization", "Bearer " + jwt);

	    // 필요한 작업 수행
	    model.addAttribute("jwt", jwt);
	    model.addAttribute("accessToken", accessToken);

	    return "callback"; // 반환할 뷰 이름
	}
	
    @GetMapping("/2fa")
    public String show2faPage() {
        return "admin/otp";  // 2FA 입력 페이지 (JSP나 HTML을 구현)
    }

    @PostMapping("/Admin/otp")
    public String processAdminOtp(@RequestParam String code, Authentication authentication, HttpSession session) {
		System.out.println("갱신정보"+ code+ "세션" + session);
		System.out.println("왜안되냐구"+ isValidAdminOTP(code, session));
		
		
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

            // 세션에서 비밀 키 제거
            session.removeAttribute("adminOtpSecretKey");
            session.setAttribute("mfaAuthenticated", true);
            return "redirect:/Admin";
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
	public ResponseEntity<String> logout(HttpServletResponse response, HttpSession session) {
		session.removeAttribute("mfaAuthenticated");
	    Cookie jwtCookie = new Cookie("token", null);
	    jwtCookie.setHttpOnly(true);
	    jwtCookie.setSecure(true);
	    jwtCookie.setPath("/");
	    jwtCookie.setMaxAge(0); // 쿠키 만료
	    response.addCookie(jwtCookie);
	    SecurityContextHolder.clearContext();
	    return ResponseEntity.ok().build();
	}


}
