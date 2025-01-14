package com.board.config;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.board.util.VisitorLoggingInterceptor;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    private final VisitorLoggingInterceptor visitorLoggingInterceptor;

    public WebConfig(VisitorLoggingInterceptor visitorLoggingInterceptor) {
        this.visitorLoggingInterceptor = visitorLoggingInterceptor;
    }

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        // 모든 경로에 대해 인터셉터 적용
        registry.addInterceptor(visitorLoggingInterceptor)
                .addPathPatterns("/Users/**", "/Business/**", "/CompanyAuth/**", "/", "/app/**", "/Mobile/**")
                .excludePathPatterns("/Users/Admin/**","/static/**", "/css/**", "/js/**", "/images/**", "/image/**", "/WEB-INF/views/**", "/resources/**"); // 정적 리소스 제외
        //.excludePathPatterns("/**"); // 정적 리소스 제외
    }
}
