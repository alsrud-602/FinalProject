package com.board.users.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

public class UserCategory {

    private int ucIdx;
    private int userIdx;
    private int categoryId;

    // Getters and setters
    public int getUcIdx() {
        return ucIdx;
    }

    public void setUcIdx(int ucIdx) {
        this.ucIdx = ucIdx;
    }

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