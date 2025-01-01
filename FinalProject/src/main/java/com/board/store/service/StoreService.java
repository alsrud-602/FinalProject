/*
 * package com.board.store.service;
 * 
 * import javax.print.attribute.standard.Media;
 * 
 * import org.springframework.beans.factory.annotation.Autowired; import
 * org.springframework.stereotype.Service;
 * 
 * import com.board.store.dto.GeminiResponse; import
 * com.board.store.dto.ImageStoreVo; import com.board.store.dto.StoreDetailsVo;
 * import com.board.store.dto.StoreTagsVo; import com.board.store.dto.StoresVo;
 * 
 * @Service public class StoreService {
 * 
 * @Autowired private StoreMapper storeMapper;
 * 
 * public void processAndSaveData(GeminiResponse response) { // 1. STORES 데이터 분리
 * StoresVo store = new StoresVo(); store.setTitle(response.getTitle());
 * store.setAge(response.getAge()); store.setBrand1(response.getBrand1());
 * store.setBrand2(response.getBrand2()); store.setStatus("관리자 개별 승인"); // 기본 상태
 * 설정 storeMapper.insertStore(store);
 * 
 * // 2. STORE_DETAILS 데이터 분리 StoreDetailsVo storeDetail = new StoreDetailsVo();
 * storeDetail.setAddress(response.getLocation());
 * storeDetail.setIgdate(response.getSchedule());
 * storeDetail.setIntroduction(response.getIntroduction());
 * storeDetail.setContent(response.getContent());
 * storeMapper.insertStoreDetail(storeDetail);
 * 
 * // 3. STORE_TAGS 데이터 분리 for (String tag : response.getTags()) { StoreTagsVo
 * storeTag = new StoreTagsVo(); storeTag.setTag_name(String.join(",",
 * response.getTags())); // 태그를 ","로 결합 //storeTag.setTag_name(tag);
 * storeMapper.insertStoreTag(storeTag); }
 * 
 * // 4. IMAGE_STORE 데이터 분리 for (String media : response.getMedia()) {
 * ImageStoreVo imageStore = new ImageStoreVo();
 * imageStore.setImagename(media.getImagename());
 * imageStore.setImageext(media.getImageExtension());
 * imageStore.setImage_path(media.getImagePath());
 * imageStore.setStore_idx(store.getStoreIdx()); // 매핑된 Store ID 사용
 * storeMapper.insertImageStore(imageStore); } } }
 */