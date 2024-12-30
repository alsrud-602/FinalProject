package com.board.admin.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@Controller
@RequestMapping("/Admin")
public class AdminController {

    @Autowired
    private HttpServletRequest request;

    // MFA 인증 확인
    private boolean isMfaAuthenticated(HttpServletRequest request) {
        HttpSession session = request.getSession(false);
        if (session != null) {
            Boolean mfaAuthenticated = (Boolean) session.getAttribute("mfaAuthenticated");
            return mfaAuthenticated != null && mfaAuthenticated;
        }
        return false;
    }

    // 유저관리
    @RequestMapping("/User")
    public ModelAndView user(HttpServletResponse response) throws Exception {
        // MFA 인증 확인
        if (!isMfaAuthenticated(request)) {
            response.sendRedirect("/Users/2fa"); 
            return null;
        }

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/admin/user/user");
        return mv;
    }

    // 유저관리 상세
    @RequestMapping("/Userdetail")
    public ModelAndView userdetail(HttpServletResponse response) throws Exception {
        // MFA 인증 확인
        if (!isMfaAuthenticated(request)) {
            response.sendRedirect("/Users/2fa"); 
            return null; 
        }

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/admin/user/userdetail");
        return mv;
    }

    @RequestMapping("/M1")
    public ModelAndView M1(HttpServletResponse response) throws Exception {
        // MFA 인증 확인
        if (!isMfaAuthenticated(request)) {
            response.sendRedirect("/Users/2fa"); 
            return null; 
        }

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/admin/manager/detail");
        return mv;
    }

    // 스토어관리 - 담당자관리
    @RequestMapping("/Managerlist")
    public ModelAndView managerlist(HttpServletResponse response) throws Exception {
        // MFA 인증 확인
        if (!isMfaAuthenticated(request)) {
            response.sendRedirect("/Users/2fa"); 
            return null; 
        }

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/admin/manager/managerlist");
        return mv;
    }

    @RequestMapping("/Advertise")
    public ModelAndView advertise(HttpServletResponse response) throws Exception {
        // MFA 인증 확인
        if (!isMfaAuthenticated(request)) {
            response.sendRedirect("/Users/2fa");
            return null; 
        }

        ModelAndView mv = new ModelAndView();
        mv.setViewName("/admin/manager/advertise");
        return mv;
    }

    @RequestMapping("/Home")
    public String adminhome(HttpServletResponse response) throws Exception {
        // MFA 인증 확인
        if (!isMfaAuthenticated(request)) {
            response.sendRedirect("/Users/2fa"); 
            return null; 
        }

        return "admin/dashboard/dashboard";
    }
}
