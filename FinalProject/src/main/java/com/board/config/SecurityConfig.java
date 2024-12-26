package com.board.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityCustomizer;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.security.web.firewall.HttpFirewall;
import org.springframework.security.web.firewall.StrictHttpFirewall;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.CorsUtils;

import com.board.users.jwt.JwtAuthenticationFilter;
import com.board.users.jwt.JwtUtil;
import com.board.users.service.CustomOAuth2UserService;

import jakarta.servlet.DispatcherType;

@Configuration
@EnableWebSecurity
public class SecurityConfig {

    @Autowired
    private UserDetailsService userDetailsService;

    @Autowired
    private JwtUtil jwtUtil;
    
    public static final String PERMITTED_URI[] = {"/auth/**", "/Uesrs/Login"};
    private static final String PERMITTED_ROLES[] = {"USER", "ADMIN"};
    
    private final Logger logger = LoggerFactory.getLogger(SecurityConfig.class);
    
    @Autowired
    private CustomOAuth2UserService customOAuth2UserService;

    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity http, JwtAuthenticationFilter jwtAuthenticationFilter) throws Exception {
        http.csrf().disable()
                .authorizeHttpRequests(auth -> auth
                        .requestMatchers("/**", "/Users/Signup","/Users/CheckDuplication", "/Users/Login", "/Users/LoginForm", "/Users/SignupForm", "/resources/**", "/WEB-INF/view/**").permitAll()
                        .requestMatchers("/css/**", "/images/**", "/img/**", "/static/**").permitAll()
                        .requestMatchers("/oauth2/**","/error").permitAll()
                        .requestMatchers("/admin/**").hasRole("ADMIN")
                        .requestMatchers(CorsUtils::isPreFlightRequest).permitAll()
                        .requestMatchers(PERMITTED_URI).permitAll()
                        .dispatcherTypeMatchers(DispatcherType.FORWARD).permitAll()
                        .dispatcherTypeMatchers(DispatcherType.INCLUDE).permitAll()
                        //.anyRequest().hasAnyRole(PERMITTED_ROLES)
                        .anyRequest().authenticated()
                )
                .oauth2Login(oauth2 -> oauth2
                	    .loginPage("/Users/LoginForm")
                	    .failureUrl("/Users/LoginForm?error=true")
                	    .successHandler((request, response, authentication) -> {
                	        // SecurityContext 설정
                	        SecurityContextHolder.getContext().setAuthentication(authentication);
                	        // 리다이렉트
                	        response.sendRedirect("/");
                	    })
                	    .defaultSuccessUrl("/")
                	)
                .logout(logout -> logout
                	    .logoutUrl("/Users/Logout")
                	    .logoutSuccessUrl("/")
                	    .invalidateHttpSession(true)
                	    .clearAuthentication(true)
                	    .permitAll()
                )
                .sessionManagement(session -> session.sessionCreationPolicy(SessionCreationPolicy.IF_REQUIRED) // 세션 필요 시 생성
                        .sessionFixation().changeSessionId()) //새로운 세션을 생성하지 않는다. 대신에, Servelet Container에서 제공되는 세션 고정 보호를 사용
                .addFilterBefore(jwtAuthenticationFilter, UsernamePasswordAuthenticationFilter.class);

        http.cors().configurationSource(request -> {
            CorsConfiguration config = new CorsConfiguration();
            config.addAllowedOriginPattern("*");
            config.addAllowedMethod("*");
            config.addAllowedHeader("*");
            config.setAllowCredentials(true);
            return config;
        });
        return http.build();

    }

    @Bean
    public AuthenticationManager authenticationManager(HttpSecurity http) throws Exception {
        return http.getSharedObject(AuthenticationManagerBuilder.class)
                .userDetailsService(userDetailsService)
                .passwordEncoder(passwordEncoder())
                .and()
                .build();
    }

    @Bean
    public PasswordEncoder passwordEncoder() {
        return new BCryptPasswordEncoder();
    }

    @Bean
    public HttpFirewall allowDoubleSlashFirewall() {
        StrictHttpFirewall firewall = new StrictHttpFirewall();
        firewall.setAllowUrlEncodedDoubleSlash(true); // URL 인코딩된 "//" 허용
        return firewall;
    }

    @Bean
    public WebSecurityCustomizer webSecurityCustomizer() {
        return (web) -> web.httpFirewall(allowDoubleSlashFirewall());
    }
}

