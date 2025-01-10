package com.board.admin.dto;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class ImageInfo {
    private String imagename;
    private String imageext;
    private String image_path;

}
