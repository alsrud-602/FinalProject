package com.board.store.dto;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class StoreDetailsVo {
    private Integer detail_idx;
    private Integer store_idx;
    private String address;
    private Date start_date;
    private Date end_date;
    private String homepage;
    private String sns;
    private String introduction;
    private String content;
    private String parking;
    private String fare;
    private String age_limit;
    private String shooting;
    private Integer like;
    private Integer hit;
    private String goods;
    private String igdate;
    


}