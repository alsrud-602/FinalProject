package com.board.store.service;

public class InstagramPost {
    private String brand;
    private String text;
    private String imageUrl;
    private String date;

    public InstagramPost(String brand, String text, String imageUrl, String date) {
        this.brand = brand;
        this.text = text;
        this.imageUrl = imageUrl;
        this.date = date;
    }

    public String getBrand() {
        return brand;
    }

    public String getText() {
        return text;
    }

    public String getImageUrl() {
        return imageUrl;
    }

    public String getDate() {
        return date;
    }

    @Override
    public String toString() {
        return "InstagramPost{" +
                "brand='" + brand + '\'' +
                ", text='" + text + '\'' +
                ", imageUrl='" + imageUrl + '\'' +
                ", date='" + date + '\'' +
                '}';
    }
}

