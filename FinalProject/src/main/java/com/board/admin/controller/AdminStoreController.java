package com.board.admin.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;



@Controller
@RequestMapping("/Admin")
public class AdminStoreController {
     
	@RequestMapping("/Store/View")
	public ModelAndView view() {				
		ModelAndView mv = new ModelAndView();
		mv.setViewName("admin/store/view");
	        return mv;
	}
	

}
