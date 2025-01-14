package com.board.business.service;

import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
import java.time.temporal.ChronoUnit;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;
import java.util.stream.Collectors;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.board.business.dto.CountConfigDto;
import com.board.business.dto.ReservationTimeSlotDto;
import com.board.business.dto.ReservationUserDto;
import com.board.business.dto.StoreAddNoteDto;
import com.board.business.dto.StoreListDto;
import com.board.business.dto.StoreStatusDto;
import com.board.business.dto.WaitingDelayDto;
import com.board.business.dto.WaitingDto;
import com.board.business.mapper.WatingMapper;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class WaitingServiceimpl  implements WaitingService {
	
	@Autowired
	private WatingMapper watingMapper;
	
	@Override
	public void insertWatingList(WaitingDto watingDto) {
		watingMapper.insertWatingList(watingDto);
		
	}

	@Override
	public List <WaitingDto> getWatingList(int store_idx) {
		List <WaitingDto> watingList = watingMapper.getWatingList(store_idx);
		return watingList;
	}
	
	@Override
	@Transactional
	public List<WaitingDto> updateWatingList(WaitingDto waitingDto) {
		
    	//해당 건 취소 업데이트
		watingMapper.updateWatingList(waitingDto);

		
		//status- 노쇼시 팝콘 차감
        if (waitingDto.getStatus().trim().equals("노쇼")) {
        	System.out.println("확인 상태 보기2 :" + waitingDto.getStatus());
        	
        	watingMapper.updatePopconNoShow(waitingDto.getWaiting_idx());	
        	watingMapper.updatePopCornWNo(waitingDto.getWaiting_idx());	      	
        };	
		
		//store 구하기
		int store_idx =watingMapper.getStore_idxWaiting(waitingDto.getWaiting_idx());
		
	     
        // 순번 업데이트
        List<WaitingDto> updatedListConfig = watingMapper.getWatingList(store_idx);   
        System.out.println(updatedListConfig);
        int newOrder = 1;
        for (WaitingDto waiting : updatedListConfig) {
        	watingMapper.updateWaitingOrder(store_idx, waiting.getWating_order(), newOrder);
            newOrder++;
        }  
        //최종 대기 리스트 추출
        List<WaitingDto> updatedList = watingMapper.getWatingList(store_idx);
		
        System.out.println(updatedList);
		
		return updatedList;
		
	}

	@Override
	public List<WaitingDto> sendWatingList(WaitingDto waitingDto) {
		
		//해당건 현재순번으로 업데이트
		watingMapper.updateWatingList(waitingDto);
        System.out.println("확인요망합니다");
        System.out.println(waitingDto);
		//store 구하기
		int store_idx =watingMapper.getStore_idxWaiting(waitingDto.getWaiting_idx());
		List<WaitingDto> updatedList = watingMapper.getWatingList(store_idx);
		
		return updatedList;
	}

	@Override
	public void updateOnsiteUse(StoreStatusDto storeStatusDTO) {
		System.out.println("한번더 확인" + storeStatusDTO);
		watingMapper.updateOnsiteUse(storeStatusDTO);
		
	}

	@Override
	public StoreStatusDto getStoreStauts(int store_idx) {
		StoreStatusDto onsiteDto = watingMapper.getStoreStauts(store_idx);
		return onsiteDto;
	}

	@Override
	public WaitingDto getUserWaiting(int user_idx) {
		WaitingDto wDto = watingMapper.getUserWaiting(user_idx);
		return wDto;
	}

	@Override
	public List<WaitingDto> getUserWaitingList(int user_idx) {
		List<WaitingDto> wList = watingMapper.getUserWaitingList(user_idx);
		return wList;
	}

	@Override
	public List<ReservationUserDto> getadvanceList(int user_idx) {
		 List<ReservationUserDto> ruList = watingMapper.getadvanceList(user_idx);
		 System.out.println("확인합니다"+ruList);
		return ruList;
	}

	@Override
	public List<WaitingDto> getonStieList(int user_idx) {
		List<WaitingDto> WList = watingMapper.getonStieList(user_idx);
		 System.out.println("확인합니다WList"+WList);
		return WList;
	}

	@Override
	public List<WaitingDto> getcheckWaiting(int user_idx) {
		List<WaitingDto> wcheck =  watingMapper.getcheckWaiting(user_idx);
		System.out.println("확인합니다wcheck"+wcheck);
		return wcheck;
	}

	@Override
	public StoreAddNoteDto getStoreAddressNote(int store_idx) {
		StoreAddNoteDto anDto = watingMapper.getStoreAddressNote(store_idx);
		System.out.println("확인합니다anDto"+anDto);
		return anDto;
	}

    private static final DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy-MM-dd HH:mm:ss");

	@Override
    public List<Map<String, Object>> getTimeGrape(int store_idx) {
        // DB에서 데이터 가져오기
        List<Map<String, String>> waitingData = watingMapper.getWatingTime(store_idx);

        System.out.println("timeBucket");
        System.out.println(waitingData);
        // 30분 단위로 대기 시간 계산 (대기 종료 시간 기준)
        Map<LocalDateTime, List<Long>> timeBuckets = new TreeMap<>();

        for (Map<String, String> entry : waitingData) {
            String cdateStr = entry.get("CDATE");
            String edateStr = entry.get("EDATE");

            // String을 LocalDateTime으로 변환
            LocalDateTime cdate = LocalDateTime.parse(cdateStr, formatter);
            LocalDateTime edate = LocalDateTime.parse(edateStr, formatter);

            System.out.println("cdate: " + cdate);
            System.out.println("edate: " + edate);

            // 대기 시간 계산
            long waitMinutes = ChronoUnit.MINUTES.between(cdate, edate);
            System.out.println("waitMinutes: " + waitMinutes);

            // edate 기준 30분 단위 구간 생성
            LocalDateTime bucket = edate.truncatedTo(ChronoUnit.HOURS)
                    .plusMinutes((edate.getMinute() / 30) * 30);

            // 구간별 대기 시간 저장
            timeBuckets.computeIfAbsent(bucket, k -> new ArrayList<>()).add(waitMinutes);
        }

        // 구간별 평균 대기 시간 계산
        return timeBuckets.entrySet().stream()
                .map(entry -> {
                    Map<String, Object> result = new HashMap<>();
                    result.put("time", entry.getKey());
                    result.put("average", entry.getValue().stream().mapToLong(Long::longValue).average().orElse(0.0));
                    return result;
                })
                .collect(Collectors.toList());
    }

	@Override
	public List<ReservationTimeSlotDto> getadvanceTimeSlotList(int store_idx) {
		 List<ReservationTimeSlotDto> rtimeList =  watingMapper.getadvanceTimeSlotList(store_idx);
		return rtimeList;
	}

	@Override
	public List<ReservationTimeSlotDto> getadvanceDateList(int store_idx) {
		 List<ReservationTimeSlotDto> advanceDateList =watingMapper.getadvanceDateList(store_idx);
		return advanceDateList;
	}

	@Override
	public void getReservationWrite(HashMap<String, Object> map) {

		watingMapper.getReservationWrite(map);
		
	}

	@Override
	public StoreListDto getStoreShort(int store_idx) {
		StoreListDto sDTO = watingMapper.getStoreShort(store_idx);
		return sDTO;
	}

	@Override
	public List<StoreListDto> getStoreCategory(int store_idx) {

		List<StoreListDto> scDTOList = watingMapper.getStoreCategory(store_idx);
		return scDTOList;
	}

	@Override
	public CountConfigDto getCountConfig(HashMap<String, Object> map) {
		System.out.println("map예약 등록 확인: "+map);
		CountConfigDto ccDto = watingMapper.getCountConfig(map);
		return ccDto;
	}

	@Override
	public ReservationUserDto getadvanceUser(int reservation_idx) {
		ReservationUserDto ruDto = watingMapper.getadvanceUser(reservation_idx);
		return ruDto;
	}

	@Override
	public void deleteReservation(int reservation_idx) {
		watingMapper.deleteReservation(reservation_idx);
		
	}

	@Override
	public WaitingDto getWaitingStatus(int waiting_idx) {
		WaitingDto wDto = watingMapper.getWaitingStatus(waiting_idx);
		return wDto;
	}

	@Override
	public void getDelay(WaitingDelayDto waitingDelayDto ){
        
        System.out.println("newMyOrder 안에서"+ waitingDelayDto.getNewMyOrder());
        System.out.println("myOrder 안에서"+ waitingDelayDto.getMyOrder());
        int myOrder =  waitingDelayDto.getMyOrder();
        int newMyOrder =  waitingDelayDto.getNewMyOrder();
        for (int i = myOrder + 1; i <= newMyOrder; i++) {
            // 변화가 필요한 인원: 4, 5, 6, 7, 8
            // 이 인원들의 순번을 1씩 줄여줌
        	watingMapper.updateWaitingOrderInt(waitingDelayDto.getStore_idx(), i, i - 1);
        }
        
        // 현재 인원(3번)의 순번을 8번으로 업데이트
        watingMapper.updateWaitingOrderUser(waitingDelayDto.getWaiting_idx(), myOrder, newMyOrder);
        
        //팝콘 차감
        watingMapper.updatePopcornDelay(waitingDelayDto.getWaiting_idx());
     	watingMapper.updatePopCornWDelay(waitingDelayDto.getWaiting_idx());	
		
	}






	
	
	
}
