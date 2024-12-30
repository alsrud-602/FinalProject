package com.board;

import com.warrenstrange.googleauth.GoogleAuthenticator;
import com.warrenstrange.googleauth.GoogleAuthenticatorKey;
import com.warrenstrange.googleauth.GoogleAuthenticatorQRGenerator;

public class GoogleAuthExample {

    public static void main(String[] args) {
        // 
        GoogleAuthenticator gAuth = new GoogleAuthenticator();

        //키
        GoogleAuthenticatorKey key = gAuth.createCredentials();
        String secret = key.getKey();
        System.out.println("Secret key: " + secret);

        //구글 앱부터 Generate a QR code URL to be scanned by Google Authenticator app
        String userName = "user@example.com";
        String issuer = "ExampleIssuer";
        String qrCodeUrl = GoogleAuthenticatorQRGenerator.getOtpAuthURL(issuer, userName, key);
        System.out.println("QR Code URL: " + qrCodeUrl);

        // Simulate the OTP that the user would provide from their Google Authenticator app
        int otp = gAuth.getTotpPassword(secret);
        System.out.println("Generated OTP: " + otp);

        // Verify the provided OTP
        boolean isCodeValid = gAuth.authorize(secret, otp);
        System.out.println("Is the OTP valid? " + isCodeValid);
    }
}
