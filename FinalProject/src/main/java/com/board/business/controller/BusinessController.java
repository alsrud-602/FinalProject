package com.board.business.controller;

import java.util.Arrays;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.board.business.service.BusinessService;

@Controller
@RequestMapping("/Business")
public class BusinessController {
     
	@Autowired
	private  BusinessService businessService;

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
		                                   required = false) String[] reservation_start_date) {	
		
		System.out.println("!!!!!!!!"+ map);
		System.out.println("!!!!!!!!"+ map.get("title"));
		System.out.println("!!!!!!태그네임!!"+ Arrays.toString(tag_name));
		System.out.println("!!!!!스타트 !!!"+ Arrays.toString(start_time));
		System.out.println("!!!!!엔드!!!"+ Arrays.toString(end_time));
		System.out.println("!!!!!최종 맥스치!!!"+ Arrays.toString(max_number));
		System.out.println("!!!!계획!!!"+ Arrays.toString(rp_plan));
		System.out.println("!!!!!!!!"+ Arrays.toString(reservation_start_date));
		System.out.println("!!!!!!!!"+ Arrays.toString(reservation_end_date));
		System.out.println("!!!!!!!!"+ Arrays.toString(rd_plan));

		
		
		int company_idx =2;
        map.put("company_idx", company_idx );
       
		businessService.setRegistration(map,tag_name);
		businessService.setReservation(map,start_time,end_time,max_number,rp_plan,rd_plan,reservation_end_date,reservation_start_date);
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("business/registration/write");		
		return mv;
	}
    

}
