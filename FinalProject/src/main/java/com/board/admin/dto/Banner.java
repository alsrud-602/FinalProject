package com.board.admin.dto;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.SequenceGenerator;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Entity
@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@Table(name = "banner")
public class Banner {
	
    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "banner_seq_gen")
    @SequenceGenerator(name = "banner_seq_gen", sequenceName = "BANNER_SEQ", allocationSize = 1)
    @Column(name = "BANNER_IDX", length=10)
    private Long bannerIdx;
    
    @Column(name = "STORE_IDX", length=10)
    private Long storeIdx;
    
    @Column(name = "IMAGE_NAME", length=300)
    private String imageName;
    
    @Column(name = "IMAGEXT", length=100)
    private String imagExt;
    
    @Column(name = "IMAGE_PATH", length=300)
    private String imagePath;
    
}