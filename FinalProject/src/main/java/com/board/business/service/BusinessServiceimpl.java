package com.board.business.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.board.business.dto.StoreTagDto;
import com.board.business.mapper.BusinessMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class BusinessServiceimpl  implements BusinessService{
	
	
	@Autowired
	private BusinessMapper businessMapper;
	
	@Override
	public void setRegistration(HashMap<String, Object> map, String[] tag_name) {
	
	//1. 기본정보	
    businessMapper.insertStore(map);
    //2. 상세정보
    businessMapper.insertStoreDetail(map);   
    //3. 태그 정보
	List<StoreTagDto> TagList = new ArrayList<>();
    for (String tag : tag_name) {
    	StoreTagDto tagDto = new StoreTagDto(tag);
    	TagList.add(tagDto);           
    }   
    businessMapper.insertStoreTage(TagList);
	//4. 운영정보
    businessMapper.insertStoreOperation(map);    
	}
	
	

}
