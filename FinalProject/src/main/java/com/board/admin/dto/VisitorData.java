package com.board.admin.dto;

import java.time.LocalDateTime;

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
@Table(name = "VISITOR_DATA")
public class VisitorData  {

    @Id
    @GeneratedValue(strategy = GenerationType.SEQUENCE, generator = "visitor_data_seq_gen")
    @SequenceGenerator(name = "visitor_data_seq_gen", sequenceName = "VISITOR_DATA_SEQ", allocationSize = 1)
    
    @Column(name = "VISITOR_ID", length = 10)
    private Long visitorId;

    @Column(name = "IP_ADDRESS", length=50)
    private String ipAddress;
    
    @Column(name = "USER_AGENT", length = 255)
    private String userAgent;

    @Column(name = "URL_INFO", length = 255)
    private String urlInfo;

    @Column(name = "VISITOR_TIME", length = 6, columnDefinition = "DATE DEFAULT CURRENT_TIMESTAMP")
    private LocalDateTime visitorTime;

    @Column(name = "SESSION_ID", length = 100)
    private String sessionId;




}
