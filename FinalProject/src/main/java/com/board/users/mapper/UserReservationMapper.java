package com.board.users.mapper;

import java.util.List;

import com.board.store.dto.StoreDetailsVo;
import com.board.store.dto.StoresVo;
import com.board.users.dto.ReservationUsersDto;
import com.board.users.dto.UsersDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface UserReservationMapper {
	UsersDto getUserByUsername(String username);
    List<ReservationUsersDto> getUserReservations(int user_idx);
    List<StoresVo> getStoresForReservations(int user_idx);
    List<StoreDetailsVo> getStoreDetailsForReservations(int user_idx);
}
