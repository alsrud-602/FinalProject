package com.board.store.dto;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreTagsVo {
    private Integer tag_idx;
    private Integer store_idx;
    private String tag_name;
}
