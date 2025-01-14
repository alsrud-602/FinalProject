package com.board.fcm;

import java.io.FileInputStream;
import java.io.IOException;
import java.util.concurrent.ExecutionException;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.google.firebase.messaging.FirebaseMessaging;
import com.google.firebase.messaging.Message;

@Service
public class FcmService {

    @Value("${firebase.config.path}")
    private String firebaseConfigPath;

    // FCM 초기화
    public void initializeFirebase() throws IOException {
        FileInputStream serviceAccount =
                new FileInputStream(firebaseConfigPath);

        GoogleCredentials credentials = GoogleCredentials.fromStream(serviceAccount);
        FirebaseApp.initializeApp(FirebaseOptions.builder()
                .setCredentials(credentials)
                .build());
    }

    // 알림 보내기
    public void sendNotification(String token, String title, String body) throws InterruptedException, ExecutionException {
        Message message = Message.builder()
                .setToken(token)
                .putData("title", title)
                .putData("body", body)
                .build();

        String response = FirebaseMessaging.getInstance().sendAsync(message).get();
        System.out.println("Successfully sent message: " + response);
    }
}
