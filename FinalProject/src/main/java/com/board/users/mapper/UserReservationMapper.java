package com.board.users.mapper;

import java.util.List;

import com.board.business.dto.StoreDto;
import com.board.business.dto.ImageStoreDTO;
import com.board.business.dto.StoreDetailDto;
import com.board.users.dto.ImageDto;
import com.board.users.dto.ReservationUsersDto;
import com.board.users.dto.UsersDto;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

@Mapper
public interface UserReservationMapper {
	UsersDto getUserByUsername(@Param("username") String  username);
    List<ReservationUsersDto> getUserReservations(int user_idx);
    List<StoreDto> getStoresForReservations(int user_idx);
    List<StoreDetailDto> getStoreDetailsForReservations(int user_idx);
    List<ImageStoreDTO> getImagesForStores(int user_idx);
    //테스트 
	List<ImageDto> getTestList(Integer user_idx);
}
