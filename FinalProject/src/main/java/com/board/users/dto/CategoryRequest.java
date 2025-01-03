package com.board.users.dto;

public class CategoryRequest {
    private int userIdx;
    private int categoryId;

    // 기본 생성자
    public CategoryRequest() {}

    // Getters and Setters
    public int getUserIdx() {
        return userIdx;
    }

    public void setUserIdx(int userIdx) {
        this.userIdx = userIdx;
    }

    public int getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(int categoryId) {
        this.categoryId = categoryId;
    }
}
