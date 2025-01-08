/*
 * package com.board.users.controller;
 * 
 * import org.springframework.http.HttpStatus; import
 * org.springframework.http.ResponseEntity; import
 * org.springframework.security.access.prepost.PreAuthorize; import
 * org.springframework.web.bind.annotation.GetMapping; import
 * org.springframework.web.bind.annotation.RequestMapping; import
 * org.springframework.web.bind.annotation.RestController;
 * 
 * @RestController
 * 
 * @RequestMapping("/SomeProtectedResource") public class
 * ProtectedResourceController {
 * 
 * // 이 메소드는 인증된 사용자만 접근 가능
 * 
 * @GetMapping
 * 
 * @PreAuthorize("isAuthenticated()") // 인증된 사용자만 접근 허용 public
 * ResponseEntity<String> getProtectedResource() { // 보호된 리소스의 데이터 생성 String
 * resourceData = "This is a protected resource data!";
 * 
 * System.out.println("왔니?"); // 200 OK 응답과 데이터 반환 return
 * ResponseEntity.status(HttpStatus.OK).body(resourceData); } }
 */