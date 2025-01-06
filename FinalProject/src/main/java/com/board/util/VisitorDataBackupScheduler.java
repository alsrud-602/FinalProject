package com.board.util;
import java.io.IOException;

import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Component;

import com.board.admin.service.VisitorDataService;

@Component
public class VisitorDataBackupScheduler {

    private final VisitorDataService visitorDataService;

    public VisitorDataBackupScheduler(VisitorDataService visitorDataService) {
        this.visitorDataService = visitorDataService;
    }

    // 매일 자정에 실행
    @Scheduled(cron = "0 7 13 * * ?")
    public void backupVisitorData() {
        try {
            visitorDataService.backupAndDeleteOldData();
            System.out.println("Old visitor data backed up to S3.");
        } catch (IOException e) {
            System.err.println("Failed to backup visitor data: " + e.getMessage());
        }
    }
}
