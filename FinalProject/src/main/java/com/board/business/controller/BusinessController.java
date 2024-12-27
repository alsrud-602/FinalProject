package com.board.business.controller;

import java.io.Console;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.board.business.dto.CategoryDto;
import com.board.business.dto.CompanyDto;
import com.board.business.dto.RequestDto;
import com.board.business.dto.StoreListDto;
import com.board.business.dto.StoreUpdateDto;
import com.board.business.service.BusinessService;
import com.board.business.service.PdsService;

@Controller
@RequestMapping("/Business")
public class BusinessController {
     
	@Autowired
	private  BusinessService businessService;
	
	@Autowired
	private PdsService pdsService;
	
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
;

		
		int company_idx =1;
        map.put("company_idx", company_idx );
       
		businessService.setRegistration(map,tag_name,category_id);
		pdsService.serWrite(map,uploadfiles);
		businessService.setReservation(map,start_time,end_time,max_number,rp_plan,rd_plan,reservation_end_date,reservation_start_date);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("business/registration/write");		
		return mv;
	}
	@RequestMapping("/Registraion/Writefrom")
	public ModelAndView registrationWritefrom() {
	
	List <CategoryDto> cList = businessService.getCategoryList();	
		
	ModelAndView mv = new ModelAndView();
	mv.addObject("cList", cList);
	mv.setViewName("business/registration/write");
	return mv;	
	}
	
	@RequestMapping("/SearchAddress")
	public String searchAddress() {
	        return "business/registration/popupaddress";
	}
	
	@RequestMapping("/Management/Main/List")
	public ModelAndView managementMlist(int company_idx) {
	     
    List <StoreListDto>	shList = businessService.getStoreHistoryList(company_idx);
    List <StoreListDto> soList = businessService.getStoreOpertaionList(company_idx);
	ModelAndView mv = new ModelAndView();
	mv.addObject("shList", shList);	
	mv.addObject("soList", soList);	
	mv.addObject("company_idx", company_idx);	
	mv.setViewName("business/management/main/list");
	return mv;
	}
	@RequestMapping("/Management/Main/UpdateForm")
	public ModelAndView managementMupdateFrom( int store_idx) {
	
	HashMap<String, Object> map	 = new HashMap<>();
	businessService.getStoreUpdateinfo(map,store_idx);
	StoreUpdateDto suDto =(StoreUpdateDto) map.get("suDto");
	System.out.println(suDto);	
	ModelAndView mv = new ModelAndView();
	mv.addObject("suDto", suDto);	
	mv.setViewName("business/management/main/update");
	return mv;
				
	}
	
	
	@RequestMapping("/Management/Main/update")
	public ModelAndView managementMupdate( int store_idx) {
	
		
		
	ModelAndView mv = new ModelAndView();
	mv.setViewName("business/management/main/update");
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
	mv.setViewName("redirect:/Business/Management/Main/List?company_idx="+company_idx);
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
	mv.setViewName("redirect:/Business/Management/Main/List?company_idx="+companydto.getCompany_idx());
	return mv;	
		
	}
	
	
}
