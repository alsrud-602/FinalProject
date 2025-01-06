package com.board.exception;

import com.board.companys.dto.Company;

public class CompanyNotFoundOAuth2Exception extends RuntimeException {
    private final Company company;

    public CompanyNotFoundOAuth2Exception(String message, Company company) {
        super(message);
        this.company = company;
    }

    public Company getCompany() {
        return company;
    }
}