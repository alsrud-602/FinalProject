package com.board.exception;

public class CompanyAlreadyLinkedToSocialException extends RuntimeException {
    public CompanyAlreadyLinkedToSocialException(String message) {
        super(message);
    }
}
