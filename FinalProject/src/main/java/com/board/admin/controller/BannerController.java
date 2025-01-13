package com.board.admin.controller;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.board.admin.dto.ImageInfo;
import com.board.admin.mapper.BannerMapper;

@Controller
@RequestMapping("/Admin")
public class BannerController {

    @Autowired
    private BannerMapper bannerMapper;
   
    
    private Logger logger =  LoggerFactory.getLogger(BannerController.class);
    
    @RequestMapping("/updateBanStatus")
    public String registerBanner(
            @RequestParam("store_idx") int store_idx,
            RedirectAttributes redirectAttributes) {
        
    	bannerMapper.updateBanStatus(store_idx);
        //try {
            // IMAGE_STORE에서 이미지 정보를 가져오기
        	logger.info("배너 이미지"+bannerMapper.getImageInfo(store_idx));
        	List<ImageInfo> imageInfos = bannerMapper.getImageInfo(store_idx); // ImageInfo는 이미지 정보를 담는 DTO 클래스입니다.

            System.out.println("배너 이미지 정보: " + imageInfos);
            if (imageInfos != null && !imageInfos.isEmpty()) {
                for (ImageInfo imageInfo : imageInfos) {
                    System.out.println("이미지 이름: " + imageInfo.getImagename());
                    System.out.println("이미지 확장자: " + imageInfo.getImageext());
                    System.out.println("이미지 경로: " + imageInfo.getImage_path());
                    
                    // BANNER 테이블에 광고 등록
                    Map<String, Object> params = new HashMap<>();
                    params.put("store_idx", store_idx);
                    params.put("imagename", imageInfo.getImagename());
                    params.put("imageext", imageInfo.getImageext());
                    params.put("image_path", imageInfo.getImage_path());

                    bannerMapper.insertBanner(params);
                }
            } else {
                redirectAttributes.addFlashAttribute("errorMessage", "이미지 정보를 찾을 수 없습니다.");
            }
        //} catch (Exception e) {
        //    redirectAttributes.addFlashAttribute("errorMessage", "광고 등록에 실패했습니다.");
        //}
        

        return "redirect:/Admin/Advertise";
    }
    @RequestMapping("/deleteBanner")
    public String registerBanner(
    		@RequestParam("store_idx") int store_idx) {
    	
    	bannerMapper.retreiveBanStatus(store_idx);

    	return "redirect:/Admin/Advertise"; // 업데이트 후 리다이렉트할 페이지
    }
    
}
