package com.board.admin.controller;



import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.board.business.dto.CategoryDto;
import com.board.business.dto.ImageStoreDTO;
import com.board.business.dto.ResponseDto;
import com.board.business.dto.StoreTagDto;
import com.board.business.dto.StoreUpdateDto;
import com.board.business.service.BusinessService;
import com.board.business.service.PdsService;



@Controller
@RequestMapping("/Admin")
public class AdminStoreController {
    
	// 1./Store/View - store_idx 연결   
	
	@Autowired
	private  BusinessService businessService;
    
	@Autowired
	private PdsService pdsService;
	
	@RequestMapping("/Store/View")
	 public ModelAndView StoreView() {		
		int store_idx = 97;
		StoreUpdateDto suDto = businessService.getStoreUpdateinfo(store_idx);	
	    List<StoreTagDto> stList = businessService.getStoreTag(store_idx);
	    List <CategoryDto> scList = businessService.getStoreCategory(store_idx);
	    List<ImageStoreDTO> isList= pdsService.getImageStorList(store_idx);
	    List<ResponseDto> rqList = businessService.getRequestList(store_idx);
	    
	    for (ImageStoreDTO image : isList) {
	    String imagePath = image.getImage_path().replace("\\", "/");
	    image.setImage_path(imagePath);
		}
	     
	    
	    System.out.println("store 확인"+suDto);
	    
		ModelAndView mv = new ModelAndView();
		mv.addObject("store",suDto);
	    mv.addObject("tagList", stList);	
	    mv.addObject("categoryList", scList);	
	    mv.addObject("imageList", isList);	
	    mv.addObject("requestList", rqList);	
		mv.setViewName("admin/store/view");
	 return mv;
	}
	
	@RequestMapping("/Store/UpdateForm")
	 public ModelAndView StoreUpdate(int store_idx) {	
		StoreUpdateDto suDto = businessService.getStoreUpdateinfo(store_idx);	
	    List<StoreTagDto> stList = businessService.getStoreTag(store_idx);
	    List <CategoryDto> scList = businessService.getStoreCategory(store_idx);
	    List<ImageStoreDTO> isList= pdsService.getImageStorList(store_idx);
	    List <CategoryDto> cList = businessService.getCategoryList();

		ModelAndView mv = new ModelAndView();
		mv.addObject("store",suDto);
	    mv.addObject("tagList", stList);	
	    mv.addObject("categoryList", scList);	
	    mv.addObject("imageList", isList);
	    mv.addObject("cList", cList);
		mv.setViewName("admin/store/update");
		 return mv;
	}
	
	@RequestMapping("/Store/Update")
	public ModelAndView StoreUpdate(@RequestParam HashMap<String, Object> map,
									            @RequestParam (value="tag_name", 
									            required = false) String[] tag_name,
		                                        @RequestParam (value="category_id", 
				                                required = false) String[] category_id,
									            @RequestParam(value="upfile",required = false) MultipartFile[] uploadfiles) {	
	
	ModelAndView mv = new ModelAndView();
	businessService.updateAdminStore(map,tag_name,category_id);
	pdsService.setUpdate(map, uploadfiles);
	
	System.out.println("!!!!map 확인중 "+map);
	int company_idx = Integer.valueOf(map.get("company_idx").toString());
	mv.setViewName("redirect:/Admin/Store/View");
	return mv;	
		
	}

}
