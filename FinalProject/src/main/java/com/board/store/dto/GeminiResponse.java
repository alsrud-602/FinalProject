package com.board.store.dto;
import java.util.Date;
import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class GeminiResponse {
    private String title;
    private String age;
    private String brand1;
    private String brand2;
    private String location;
    private String schedule;
    private String introduction;
    private String content;
    private List<String> tags;
    private List<Media> media;

    @Data
    public static class Location {
        private String address;
    }

    @Data
    public static class Schedule {
        private String igdate;
    }

    @Data
    public static class Media {
        private String imagename;
        private String imageext;
        private String image_path;
    }
}
