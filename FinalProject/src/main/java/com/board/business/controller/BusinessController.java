package com.board.business.controller;


import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Optional;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.board.business.dto.CategoryDto;
import com.board.business.dto.CompanyDto;
import com.board.business.dto.ImageStoreDTO;
import com.board.business.dto.RequestDto;
import com.board.business.dto.ReservationDateDto;
import com.board.business.dto.ReservationPlanDto;
import com.board.business.dto.ReservationStoreDto;
import com.board.business.dto.StoreAddNoteDto;
import com.board.business.dto.StoreListDto;
import com.board.business.dto.StoreTagDto;
import com.board.business.dto.StoreUpdateDto;
import com.board.business.dto.WaitingDto;
import com.board.business.service.BusinessService;
import com.board.business.service.PdsService;
import com.board.business.service.WaitingService;
import com.board.companys.dto.Company;
import com.board.companys.service.CompanyService;
import com.board.util.JwtUtil;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.datatype.jsr310.JavaTimeModule;

import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServletRequest;


//@PreAuthorize("hasRole('ROLE_ADMIN')")
@Controller
@RequestMapping("/Business")
public class BusinessController {
     
	@Autowired
	private  BusinessService businessService;
	
	@Autowired
	private PdsService pdsService;
	
	@Autowired
	private WaitingService waitingService;
	
	@RequestMapping
	public ModelAndView businesshome() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/business/login");
		return mv;
	}
	
	@Autowired
	private JwtUtil jwtUtil;
	
	@Autowired
	private CompanyService companyService;
	
	
	
	@RequestMapping("/Registraion/Write")
	public ModelAndView registrationWrite( @RequestParam HashMap<String, Object> map,
                                           @RequestParam (value="tag_name", 
		                                   required = false) String[] tag_name,
                                           @RequestParam (value="start_time", 
		                                   required = false) String[] start_time,
                                           @RequestParam (value="end_time", 
		                                   required = false) String[] end_time,
                                           @RequestParam (value="max_number", 
		                                   required = false) String[] max_number,
                                           @RequestParam (value="rp_plan", 
		                                   required = false) String[] rp_plan,
                                           @RequestParam (value="rd_plan", 
		                                   required = false) String[] rd_plan,
                                           @RequestParam (value="reservation_end_date", 
		                                   required = false) String[] reservation_end_date,
                                           @RequestParam (value="reservation_start_date", 
		                                   required = false) String[] reservation_start_date,
                                           @RequestParam (value="category_id", 
		                                   required = false) String[] category_id,
                                           @RequestParam(value="upfile",required = false) MultipartFile[] uploadfiles) {	
		

		System.out.println("!!!!!!!!"+ map);
		System.out.println("!!!!!!!!"+ map.get("title"));
		
		//int company_idx = Integer.valueOf(map.get("company_idx").toString());
      
		businessService.setRegistration(map,tag_name,category_id);
		pdsService.serWrite(map,uploadfiles);
		businessService.setReservation(map,start_time,end_time,max_number,rp_plan,rd_plan,reservation_end_date,reservation_start_date);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("redirect:/Business/Management/Main/List");		
		return mv;
	}
	@RequestMapping("/Registraion/Writefrom")
	public ModelAndView registrationWritefrom(HttpServletRequest request, Model model) {
		
		 Cookie[] cookies = request.getCookies();
	        String jwtToken = null;
	        boolean isKakaoUser = false;  // 카카오 사용자 여부를 판단하는 변수

	        if (cookies != null) {
	            for (int i = cookies.length - 1; i >= 0; i--) {
	                Cookie cookie = cookies[i];
	                if ("companyJwt".equals(cookie.getName())) {
	                    jwtToken = cookie.getValue();
	                    System.out.println("토큰: " + jwtToken);
	                    break; 
	                }
	            }
	        }
	    	ModelAndView mv = new ModelAndView();
	    	
	        if (jwtToken != null) {
	            String username = jwtUtil.extractUsername(jwtToken);
	            System.out.println("사용자 정보1: " + username);

	                // 일반 사용자라면 기존 방식으로 사용자 조회
	                Optional<Company> company = companyService.findByUserId(username);  // DB에서 사용자 정보 조회
	                System.out.println("사용자 정보: " + company);
	                model.addAttribute("user", company.orElse(null));  // 사용자가 없을 경우 null 반환
	        		
	                Long company_idx_long = company.get().getCompanyIdx();
	                int company_idx = company_idx_long.intValue();	 
	                
	                List <CategoryDto> cList = businessService.getCategoryList();	
	            	mv.addObject("cList", cList);
	            	mv.addObject("company_idx", company_idx);
	            	mv.setViewName("business/registration/write");
	            	
	            } else {
	            model.addAttribute("error", "JWT 토큰이 없습니다.");
	        }		
	return mv;	
	}
	
	@RequestMapping("/SearchAddress")
	public String searchAddress() {
	        return "business/registration/popupaddress";
	}
	
	@RequestMapping("/Management/Main/List")
	public ModelAndView managementMlist(HttpServletRequest request, Model model ) {
		
        Cookie[] cookies = request.getCookies();
        String jwtToken = null;
        boolean isKakaoUser = false;  // 카카오 사용자 여부를 판단하는 변수

        if (cookies != null) {
            for (int i = cookies.length - 1; i >= 0; i--) {
                Cookie cookie = cookies[i];
                if ("companyJwt".equals(cookie.getName())) {
                    jwtToken = cookie.getValue();
                    System.out.println("토큰: " + jwtToken);
                    break; 
                }
            }
        }
    	ModelAndView mv = new ModelAndView();
    	
        if (jwtToken != null) {
            String username = jwtUtil.extractUsername(jwtToken);
            System.out.println("사용자 정보1: " + username);

                // 일반 사용자라면 기존 방식으로 사용자 조회
                Optional<Company> company = companyService.findByUserId(username);  // DB에서 사용자 정보 조회
                System.out.println("사용자 정보: " + company);
                model.addAttribute("user", company.orElse(null));  // 사용자가 없을 경우 null 반환
        		
                Long company_idx_long = company.get().getCompanyIdx();
                int company_idx = company_idx_long.intValue();
                
                List <StoreListDto>	shList = businessService.getStoreHistoryList(company_idx);
                List <StoreListDto> soList = businessService.getStoreOpertaionList(company_idx);
            
            	mv.addObject("shList", shList);	
            	mv.addObject("soList", soList);	
            	mv.addObject("company_idx", company_idx);	
            	mv.setViewName("business/management/main/list");
            	
            } else {
            model.addAttribute("error", "JWT 토큰이 없습니다.");
        }
        return mv;

	}
	@RequestMapping("/Management/Main/UpdateForm")
	public ModelAndView managementMupdateFrom( int store_idx) {
	
	ModelAndView mv = new ModelAndView();		
    StoreUpdateDto suDto = businessService.getStoreUpdateinfo(store_idx);
    List<StoreTagDto> stList = businessService.getStoreTag(store_idx);
    List <CategoryDto> scList = businessService.getStoreCategory(store_idx);
    ReservationStoreDto rsDto =businessService.getReservationStore(store_idx);
    List <ReservationDateDto> rdList = businessService.getReservationDate(rsDto.getRs_idx());
    List<List<ReservationPlanDto>> allRPList = new ArrayList<>();
    Set<String> uniquePlans = new HashSet<>(); // 중복을 체크할 Set
    List<ImageStoreDTO> isList= pdsService.getImageStorList(store_idx);
    
    System.out.println("!!!!!!!!rsDto.getRs_idx()"+ rsDto.getRs_idx());	
    for (ReservationDateDto rDto : rdList) {
        String plan = rDto.getPlan();
        System.out.println("!!!!!!!!plan"+ plan);	
        
        // 중복된 plan인지 확인
        if (uniquePlans.add(plan)) { // Set에 추가하고, 이미 존재하면 false 반환
            List<ReservationPlanDto> rpList = businessService.getReservationPlan(plan);
            System.out.println("!!!!!!!!plan"+ plan);	
            
            allRPList.add(rpList);
        }
    }
    
    ObjectMapper objectMapper = new ObjectMapper();
    objectMapper.registerModule(new JavaTimeModule());

    String jsonPlanList = "";
    try {
        // allRPList를 JSON으로 변환
        jsonPlanList = objectMapper.writeValueAsString(allRPList);
    } catch (Exception e) {
        e.printStackTrace(); // 예외 처리
    }
    
    String jsonDateList = "";
    try {
        // allRPList를 JSON으로 변환
    	jsonDateList = objectMapper.writeValueAsString(rdList);
    } catch (Exception e) {
        e.printStackTrace(); // 예외 처리
    }
    
    mv.addObject("store", suDto);	
    mv.addObject("tagList", stList);	
    mv.addObject("categoryList", scList);	
    mv.addObject("reservation", rsDto);	
    mv.addObject("dateList", jsonDateList);	
    mv.addObject("planList", jsonPlanList);
    mv.addObject("imageList", isList);	
    
    System.out.println("!!!!!!!!리스트 리스트 넣기"+ allRPList);

	mv.setViewName("business/management/main/update");
	return mv;
				
	}
	
	
	@RequestMapping("/Management/Main/update")
	public ModelAndView managementMupdate( @RequestParam HashMap<String, Object> map,
								            @RequestParam (value="tag_name", 
								            required = false) String[] tag_name,
								            @RequestParam (value="start_time", 
								            required = false) String[] start_time,
								            @RequestParam (value="end_time", 
								            required = false) String[] end_time,
								            @RequestParam (value="max_number", 
								            required = false) String[] max_number,
								            @RequestParam (value="rp_plan", 
								            required = false) String[] rp_plan,
								            @RequestParam (value="rd_plan", 
								            required = false) String[] rd_plan,
								            @RequestParam (value="reservation_end_date", 
								            required = false) String[] reservation_end_date,
								            @RequestParam (value="reservation_start_date", 
								            required = false) String[] reservation_start_date,
								            @RequestParam (value="category_id", 
								            required = false) String[] category_id,
								            @RequestParam(value="upfile",required = false) MultipartFile[] uploadfiles) {
	
		

	businessService.updateStore(map,tag_name,category_id);
	pdsService.setUpdate(map, uploadfiles);
	businessService.updateReservation(map,start_time,end_time,max_number,rp_plan,rd_plan,reservation_end_date,reservation_start_date);
	ModelAndView mv = new ModelAndView();
	int company_idx = Integer.valueOf(map.get("company_idx").toString());
	mv.setViewName("redirect:/Business/Management/Main/List");
	return mv;
			
	}
	
	@RequestMapping("/Management/Request/WriteForm")
	public ModelAndView managementRwriteForm( int store_idx) {
	
    StoreListDto slDto = businessService.getStoreRequest(store_idx);
    int company_idx = businessService.getCompanyIdxByStoreIdx(slDto.getStore_idx());
    
	ModelAndView mv = new ModelAndView();
	mv.addObject("store",slDto);
	mv.addObject("company_idx",company_idx);
	mv.setViewName("business/management/request/write");
	return mv;
			
	}
	@RequestMapping("/Management/Request/Write")
	public ModelAndView managementRwrite( RequestDto requstDto) {
	businessService.insertRequest(requstDto);
	int company_idx = businessService.getCompanyIdxByStoreIdx(requstDto.getStore_idx());	
		
	ModelAndView mv = new ModelAndView();
	mv.setViewName("redirect:/Business/Management/Main/List");
	return mv;	
		
	}
	@RequestMapping("/Management/Request/List")
	public ModelAndView managementRlist( int company_idx) {
    System.out.println("!!!!!!!!확인 관리 컴퍼니 : "+ company_idx);
	List <StoreListDto> rList = businessService.getStoreRequestList(company_idx); 	
		
	ModelAndView mv = new ModelAndView();
	mv.addObject("rList",rList);
	mv.addObject("company_idx",company_idx);
	mv.setViewName("business/management/request/list");
	return mv;	
		
	}
	
	@RequestMapping("/Management/Request/View")
	public ModelAndView managementRview( int request_idx) {
    System.out.println("!!!!!!!!확인 관리 요청사항 : "+ request_idx);
    
    RequestDto rDto = businessService.getRequest(request_idx);
    StoreListDto slDto = businessService.getStoreRequest(rDto.getStore_idx());
    int company_idx = businessService.getCompanyIdxByStoreIdx(rDto.getStore_idx());
    
	ModelAndView mv = new ModelAndView();
	mv.addObject("store",slDto);
	mv.addObject("request",rDto);
	mv.addObject("company_idx",company_idx);
	mv.setViewName("business/management/request/view");
	return mv;	
		
	}
	@RequestMapping("/Management/Info")
	public ModelAndView managementInfo( int company_idx) {
	CompanyDto cDto = 	businessService.getCompany(company_idx);
	ModelAndView mv = new ModelAndView();
	mv.addObject("company",cDto);
	mv.setViewName("business/management/info");
	return mv;	
		
	}
	
	@RequestMapping("/Management/Info/Update")
	public ModelAndView managementInfoupdate(CompanyDto companydto) {
		businessService.updateCompany(companydto);
	ModelAndView mv = new ModelAndView();
	mv.setViewName("redirect:/Business/Management/Main/List");
	return mv;	
		
	}
	@RequestMapping("/Operation/UpdateFormStore")
	public ModelAndView operationUpdateFormStore(int store_idx) {	
	StoreUpdateDto suDto = businessService.getStoreUpdateinfo(store_idx);	
    List<StoreTagDto> stList = businessService.getStoreTag(store_idx);
    List <CategoryDto> scList = businessService.getStoreCategory(store_idx);
    List<ImageStoreDTO> isList= pdsService.getImageStorList(store_idx);
    
	ModelAndView mv = new ModelAndView();
	mv.addObject("store",suDto);
    mv.addObject("tagList", stList);	
    mv.addObject("categoryList", scList);	
    mv.addObject("imageList", isList);	
	mv.setViewName("business/operation/updatestore");
	return mv;	
		
	}
	
	@RequestMapping("/Operation/UpdateStore")
	public ModelAndView operationUpdateStore(@RequestParam HashMap<String, Object> map,
									            @RequestParam (value="tag_name", 
									            required = false) String[] tag_name,
		                                        @RequestParam (value="category_id", 
				                                required = false) String[] category_id,
									            @RequestParam(value="upfile",required = false) MultipartFile[] uploadfiles) {	
	
	ModelAndView mv = new ModelAndView();
	businessService.updateStore(map,tag_name,category_id);
	pdsService.setUpdate(map, uploadfiles);
	
	System.out.println("!!!!map 확인중 "+map);
	int company_idx = Integer.valueOf(map.get("company_idx").toString());
	mv.setViewName("redirect:/Business/Operation/View");
	return mv;	
		
	}	
	
	@RequestMapping("/Operation/View")
	public ModelAndView operationView(HttpServletRequest request, Model model) {		
	
		 Cookie[] cookies = request.getCookies();
	        String jwtToken = null;
	        boolean isKakaoUser = false;  // 카카오 사용자 여부를 판단하는 변수

	        if (cookies != null) {
	            for (int i = cookies.length - 1; i >= 0; i--) {
	                Cookie cookie = cookies[i];
	                if ("companyJwt".equals(cookie.getName())) {
	                    jwtToken = cookie.getValue();
	                    System.out.println("토큰: " + jwtToken);
	                    break; 
	                }
	            }
	        }
	    	ModelAndView mv = new ModelAndView();
	    	
	        if (jwtToken != null) {
	            String username = jwtUtil.extractUsername(jwtToken);
	            System.out.println("사용자 정보1: " + username);

                // 일반 사용자라면 기존 방식으로 사용자 조회
                Optional<Company> company = companyService.findByUserId(username);  // DB에서 사용자 정보 조회
                System.out.println("사용자 정보: " + company);
                model.addAttribute("user", company.orElse(null));  // 사용자가 없을 경우 null 반환
        		
                Long company_idx_long = company.get().getCompanyIdx();
                int company_idx = company_idx_long.intValue();	 
            	List<StoreListDto> sovList = businessService.getStoreOperationView(company_idx);
            	System.out.println("sovList 정보: " + sovList);
            	mv.addObject("storeList",sovList);
            	mv.setViewName("business/operation/view");
            	
	            } else {
	            model.addAttribute("error", "JWT 토큰이 없습니다.");
	        }			

	return mv;	
		
	}
	

	@RequestMapping("/Operation/UpdateFormReservation")
	public ModelAndView operationUpdateFormReservation( int store_idx) {
	
	ModelAndView mv = new ModelAndView();		
    StoreUpdateDto suDto = businessService.getStoreUpdateinfo(store_idx);
    List<StoreTagDto> stList = businessService.getStoreTag(store_idx);
    List <CategoryDto> scList = businessService.getStoreCategory(store_idx);
    ReservationStoreDto rsDto =businessService.getReservationStore(store_idx);
    List <ReservationDateDto> rdList = businessService.getReservationDate(rsDto.getRs_idx());
    List<List<ReservationPlanDto>> allRPList = new ArrayList<>();
    Set<String> uniquePlans = new HashSet<>(); // 중복을 체크할 Set
    List<ImageStoreDTO> isList= pdsService.getImageStorList(store_idx);
    
    System.out.println("!!!!!!!!rsDto.getRs_idx()"+ rsDto.getRs_idx());	
    for (ReservationDateDto rDto : rdList) {
        String plan = rDto.getPlan();	
        
        // 중복된 plan인지 확인
        if (uniquePlans.add(plan)) { // Set에 추가하고, 이미 존재하면 false 반환
            List<ReservationPlanDto> rpList = businessService.getReservationPlan(plan);
            System.out.println("!!!!!!!!plan"+ plan);	
            
            allRPList.add(rpList);
        }
    }
    
    ObjectMapper objectMapper = new ObjectMapper();
    objectMapper.registerModule(new JavaTimeModule());
    String jsonPlanList = "";
    try {
        // allRPList를 JSON으로 변환
        jsonPlanList = objectMapper.writeValueAsString(allRPList);
    } catch (Exception e) {
        e.printStackTrace(); // 예외 처리
    }
    
    String jsonDateList = "";
    try {
        // allRPList를 JSON으로 변환
    	jsonDateList = objectMapper.writeValueAsString(rdList);
    } catch (Exception e) {
        e.printStackTrace(); // 예외 처리
    }
    System.out.println("!!!!!!!!jsonPlanList"+ jsonPlanList);	
   
    
    mv.addObject("store", suDto);	
    mv.addObject("tagList", stList);	
    mv.addObject("categoryList", scList);	
    mv.addObject("reservation", rsDto);	
    mv.addObject("dateList", jsonDateList);	
    mv.addObject("planList", jsonPlanList);
    mv.addObject("imageList", isList);	
    
    System.out.println("!!!!!!!!리스트 리스트 넣기"+ allRPList);

    mv.setViewName("business/operation/updatereservation");
	return mv;
				
	}

	@RequestMapping("/Operation/UpdateReservation")
	public ModelAndView operationUpdateReservation( @RequestParam HashMap<String, Object> map,
								            @RequestParam (value="start_time", 
								            required = false) String[] start_time,
								            @RequestParam (value="end_time", 
								            required = false) String[] end_time,
								            @RequestParam (value="max_number", 
								            required = false) String[] max_number,
								            @RequestParam (value="rp_plan", 
								            required = false) String[] rp_plan,
								            @RequestParam (value="rd_plan", 
								            required = false) String[] rd_plan,
								            @RequestParam (value="reservation_end_date", 
								            required = false) String[] reservation_end_date,
								            @RequestParam (value="reservation_start_date", 
								            required = false) String[] reservation_start_date) {
	
		

		System.out.println("!!!!!!!!rp_plan: " + Arrays.toString(rp_plan));
		System.out.println("!!!!!!!!reservation_end_date: " + Arrays.toString(reservation_end_date));
		System.out.println("!!!!!!!!start_time: " + Arrays.toString(start_time));
	businessService.updateReservation(map,start_time,end_time,max_number,rp_plan,rd_plan,reservation_end_date,reservation_start_date);
	ModelAndView mv = new ModelAndView();
	int company_idx = Integer.valueOf(map.get("company_idx").toString());
	mv.setViewName("redirect:/Business/Operation/View");
	return mv;
			
	}
	
	
	
}
