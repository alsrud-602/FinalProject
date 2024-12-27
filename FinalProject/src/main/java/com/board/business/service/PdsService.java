package com.board.business.service;

import java.util.HashMap;

import org.springframework.web.multipart.MultipartFile;

public interface PdsService {

	void serWrite(HashMap<String, Object> map, MultipartFile[] uploadfiles);

}
