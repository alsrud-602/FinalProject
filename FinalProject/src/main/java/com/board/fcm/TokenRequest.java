package com.board.fcm;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class TokenRequest {
	
    private String userId;
    private String token;
}