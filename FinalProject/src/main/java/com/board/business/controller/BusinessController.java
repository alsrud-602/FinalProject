package com.board.business.controller;

import java.util.Arrays;
import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.board.business.dto.CategoryDto;
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
		System.out.println("!!!!!!태그네임!!"+ Arrays.toString(tag_name));
		System.out.println("!!!!!!예약!!"+ Arrays.toString(reservation_end_date));
		System.out.println("!!!!!!예약!!"+ Arrays.toString(rp_plan));

		
		int company_idx =2;
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

}
