package com.board.store.service;
import java.util.regex.*;
import java.util.ArrayList;
import java.util.List;

public class RegexExtractor {

    public static void main(String[] args) {
        String text = "제목\n장소 : 서울 강남구\n📆 2025년 1월 4일\n⏰ 10:00 ~ 20:00\n내용\n광고 없이 이벤트 진행 중입니다.\n";

        // Title
        Pattern titlePattern = Pattern.compile("^(?!.*#광고)(.*?)(?=\\n)", Pattern.MULTILINE);
        Matcher titleMatcher = titlePattern.matcher(text);
        String title = titleMatcher.find() ? titleMatcher.group(1) : "";

        // Location
        Pattern locationPattern = Pattern.compile("(?:장소 : |📍)(.*?)(?=\\n)");
        Matcher locationMatcher = locationPattern.matcher(text);
        String location = locationMatcher.find() ? locationMatcher.group(1) : "";

        // Operating Period
        Pattern periodPattern = Pattern.compile("(?:기간 : |\\n📆 )(.*?)(?=\\n)");
        Matcher periodMatcher = periodPattern.matcher(text);
        String operatingPeriod = periodMatcher.find() ? periodMatcher.group(1) : "";

        // Operating Hours
        Pattern hoursPattern = Pattern.compile("(?:시간 : |\\n⏰)(.*?)(?=\\n)");
        Matcher hoursMatcher = hoursPattern.matcher(text);
        String operatingHours = hoursMatcher.find() ? hoursMatcher.group(1) : "";

        // Content
        String content = text.replace("#광고", "").replace(title, "").trim();

        // Print Results
        System.out.println("Title: " + title);
        System.out.println("Location: " + location);
        System.out.println("Operating Period: " + operatingPeriod);
        System.out.println("Operating Hours: " + operatingHours);
        System.out.println("Content: " + content);
    }
}
