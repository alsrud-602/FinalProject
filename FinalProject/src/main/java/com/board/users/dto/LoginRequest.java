package com.board.users.dto;

public class LoginRequest {
    private String id;
    private String password;

    // 기본 생성자
    public LoginRequest() {
    }

    // Getter와 Setter
    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}