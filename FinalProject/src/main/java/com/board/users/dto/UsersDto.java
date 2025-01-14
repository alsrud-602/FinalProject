package com.board.users.dto;

import java.util.List;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class UsersDto {
   
   //스토어 기본 정보
   private int store_idx;
   private int company_idx;
   private String title;
   private String age;
   private String brand1;
   private String brand2;
   private String cdate;
   private String status;
   private String ban;
   
   private int detail_idx;
   private String address;
   private String start_date;
   private String end_date;
   private String homepage;
   private String sns;
   private String introduction;
   private String content;
   private String parking;
   private String fare;
   private String age_limit;
   private String shooting;
   private int like;
   private int hit;
    private String goods;
    private String igdate;
    private String like_count;
    

    private String user_id;
    private Integer user_idx;
    private String nickname;
    private String id;
    private String password;
    private String email;
    private String birthdate;
    private String phone;
    private String social_id;
    private String social_type;
    private String name;

    
    private int tage_idx;
    private String tag_name;
    
    private int rs_idx; 
    private String notes;
    private String open_date;
    private String link;
    
    private int operation_idx;
    private String smon;
    private String stue;
    private String swed;
    private String sthu;
    private String sfri;
    private String ssat;
    private String ssun;
    private String emon;
    private String etue;
    private String ewed;
    private String ethu;
    private String efri;
    private String esat;
    private String esun;
    private String onotes;
    
    private int category_idx;
    private String category_name;
    private int category_id;
    private int sc_idx;
    
    private int user_count;
    private int ls_idx;
    private int storelike;
    
    private int review_idx;
    private int score; 
    private String review_date;
    private int storeidx;
    
    
    private int is_idx;
    private String imagename;
    private String imageext;
    private String image_path;
    
    private int total_points;

    private int hit_count;
    
    private int review_count;

    private int region_idx;
    private String region_name; 
    private int region_id;    


  
    
}
