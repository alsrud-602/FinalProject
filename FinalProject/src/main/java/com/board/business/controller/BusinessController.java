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
		                                   required = false) String[] tag_name) {				
		System.out.println("!!!!!!!!"+ map);
		System.out.println("!!!!!!!!"+ map.get("title"));
		System.out.println("!!!!!!!!"+ Arrays.toString(tag_name));
		
		int company_idx =2;
        map.put("company_idx", company_idx );
        
		businessService.setRegistration(map,tag_name);
		
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("business/registration/write");		
		return mv;
	}
    

}
