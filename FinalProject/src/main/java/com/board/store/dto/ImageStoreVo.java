package com.board.store.dto;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class ImageStoreVo {
    private Integer is_idx;
    private String imagename;
    private String imageext;
    private String image_path;
    private Integer store_idx;
    
}