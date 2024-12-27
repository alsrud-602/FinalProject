package com.board.users.handle;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@ControllerAdvice
public class GlobalExceptionHandler {

    @ExceptionHandler(UserAlreadyLinkedToSocialException.class)
    public String handleUserAlreadyLinkedToSocialException(UserAlreadyLinkedToSocialException ex, RedirectAttributes redirectAttributes) {
        // 예외 메시지 클라이언트로 전달
        redirectAttributes.addFlashAttribute("message", ex.getMessage());
        // 로그인 페이지로 리다이렉트
        return "redirect:/Users/LoginForm";
    }
    
    @ExceptionHandler(UserNotFoundOAuth2Exception.class)
    public String handleUserNotFoundOAuth2Exception(UserNotFoundOAuth2Exception ex, Model model) {
        // 예외에서 사용자 정보를 모델에 추가
        model.addAttribute("user", ex.getUser());
        return "signup"; // 회원가입 페이지로 이동
    }
}