package com.board.admin.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.board.admin.dto.Banner;
import com.board.admin.dto.ImageInfo;

@Mapper
public interface BannerMapper {

	int updateBanStatus(int store_idx);

	void insertBanner(Map<String, Object> params);

	List<ImageInfo> getImageInfo(int storeIdx);

	void retreiveBanStatus(int store_idx);

	List<Banner> getAllBanners();

}
