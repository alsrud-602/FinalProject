package com.board.exception;

import java.io.IOException;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ControllerAdvice;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

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
    
    @ExceptionHandler(CompanyAlreadyLinkedToSocialException.class)
    public String handleCompanyAlreadyLinkedToSocialException(CompanyAlreadyLinkedToSocialException ex, RedirectAttributes redirectAttributes) {
    	// 예외 메시지 클라이언트로 전달
    	redirectAttributes.addFlashAttribute("message", ex.getMessage());
    	// 로그인 페이지로 리다이렉트
    	return "redirect:/CompanyAuth/LoginForm";
    }
    
    @ExceptionHandler(CompanyNotFoundOAuth2Exception.class)
    public String handleCompanyNotFoundOAuth2Exception(CompanyNotFoundOAuth2Exception ex, Model model) {
    	// 예외에서 사용자 정보를 모델에 추가
    	model.addAttribute("company", ex.getCompany());
    	return "signup"; // 회원가입 페이지로 이동
    }
    
}