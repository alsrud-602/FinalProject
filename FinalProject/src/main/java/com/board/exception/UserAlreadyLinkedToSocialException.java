package com.board.exception;

public class UserAlreadyLinkedToSocialException extends RuntimeException {
    public UserAlreadyLinkedToSocialException(String message) {
        super(message);
    }
}
