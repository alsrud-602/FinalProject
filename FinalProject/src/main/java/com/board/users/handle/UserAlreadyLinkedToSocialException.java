package com.board.users.handle;

public class UserAlreadyLinkedToSocialException extends RuntimeException {
    public UserAlreadyLinkedToSocialException(String message) {
        super(message);
    }
}
