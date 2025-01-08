package com.board.store.dto;

import java.util.List;

import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class MessageRequest {
    private String model;
    private Integer maxTokens;
    private List<Message> messages;
}
