package com.board.fcm;



import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class FcmToken {
    
	@Id
    private String userId;
    private String token;

    
}