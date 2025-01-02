package com.board.store.service;

import org.apache.ibatis.annotations.Mapper;

import com.board.store.dto.ImageStoreVo;
import com.board.store.dto.StoreDetailsVo;
import com.board.store.dto.StoreTagsVo;
import com.board.store.dto.StoresVo;

@Mapper
public interface StoreMapper {

    void insertStore(StoresVo store);

    void insertStoreDetail(StoreDetailsVo storeDetail);

    void insertStoreTag(StoreTagsVo storeTag);

    void insertImageStore(ImageStoreVo imageStore);
}