package com.board.business.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.board.business.dto.ImageStoreDTO;
import com.board.business.mapper.BusinessMapper;

@Service 
public class PdsServiceimpl implements PdsService {

	@Value("${part4.upload-path}")	
	private String uploadPath;
	@Autowired
	private BusinessMapper businessMapper;
	@Override
	public void serWrite(HashMap<String, Object> map, MultipartFile[] uploadfiles) {
		
		int store_idx = businessMapper.getStoreIdxMax();
		map.put("store_idx", store_idx);
		map.put("uploadPath", uploadPath );
		//파일저장
		PdsFile.save(uploadfiles,map);	
		//db 저장
		System.out.println(map.get("fileList"));
		List<ImageStoreDTO> imageList = (List<ImageStoreDTO>)map.get("fileList");	
		System.out.println(imageList);
		if(imageList.size()>0)
	    businessMapper.setFileWriter(map);
		
	}

}