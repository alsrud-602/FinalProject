package com.board.store.dto;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoresVo {
    private Integer store_idx;
    private Integer company_idx;
    private String title;
    private String age;
    private String brand1;
    private String brand2;
    private Date cdate;
    private String status;
    private String ban;
    
}