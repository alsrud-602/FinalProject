package com.board.admin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class Banner {
    private int banner_idx;
    private int store_idx;
    private String imagename;
    private String imageext;
    private String image_path;
    private String rdate;
   

}
