package com.board.admin.repo;
import java.time.LocalDateTime;	
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.board.admin.dto.VisitorData;

public interface VisitorDataRepository extends JpaRepository<VisitorData, Long> {
    List<VisitorData> findByVisitorTimeBefore(LocalDateTime visitorTime);

    @Query("SELECT urlInfo FROM VisitorData")
    List<String> findAllUrlInfo();

    @Query("SELECT COUNT(DISTINCT v.sessionId) FROM VisitorData v WHERE v.visitorTime BETWEEN :startOfDay AND :endOfDay")
    long countDistinctByVisitorIdAndVisitorTimeBetween(@Param("startOfDay") LocalDateTime startOfDay, @Param("endOfDay") LocalDateTime endOfDay);
}
