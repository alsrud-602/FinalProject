package com.board.handle;

public class CompanyAlreadyLinkedToSocialException extends RuntimeException {
    public CompanyAlreadyLinkedToSocialException(String message) {
        super(message);
    }
}
