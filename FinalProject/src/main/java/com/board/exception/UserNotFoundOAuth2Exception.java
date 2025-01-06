package com.board.exception;

import com.board.users.dto.User;

public class UserNotFoundOAuth2Exception extends RuntimeException {
    private final User user;

    public UserNotFoundOAuth2Exception(String message, User user) {
        super(message);
        this.user = user;
    }

    public User getUser() {
        return user;
    }
}