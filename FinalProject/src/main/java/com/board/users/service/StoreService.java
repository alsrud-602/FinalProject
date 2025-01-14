package com.board.users.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.business.dto.StoreListDto;
import com.board.users.mapper.UserCategoryMapper;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

@Service
public class StoreService {
	
	@Autowired
    private UserCategoryMapper userCategoryMapper;

    public List<StoreListDto> getRandomStoresByUserCategories(Long userIdx) {
        List<Integer> categoryIds = userCategoryMapper.getUserCategories(userIdx);
        Collections.shuffle(categoryIds); // 카테고리 ID 랜덤화

        List<StoreListDto> randomStores = new ArrayList<>();
        
        for (int categoryId : categoryIds) {
            List<StoreListDto> stores = userCategoryMapper.getStoresByCategoryId(categoryId);
            Collections.shuffle(stores); // 스토어 랜덤화
            randomStores.addAll(stores);
            if (randomStores.size() >= 2) {
                break; // 스토어가 2개 이상이면 중단
            }
        }

        return randomStores.subList(0, Math.min(2, randomStores.size())); // 최대 2개의 스토어 반환
    }

	
}
