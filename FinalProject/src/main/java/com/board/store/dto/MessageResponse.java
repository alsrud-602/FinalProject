package com.board.store.dto;

import java.util.List;


import lombok.Data;

@Data
public class MessageResponse {
    private String id;
    private List<Content> content;
}