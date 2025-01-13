package com.board.business.service;

import java.io.File;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.board.business.dto.ImageReivewDTO;
import com.board.business.dto.ImageStoreDTO;

public class PdsFile {
	//uploadFILES에 넘어온 파일을 저장
		public static void save( MultipartFile[] uploadfiles, HashMap<String, Object> map) {
			
			//저장된 경로를 가져온다
			String uploadPath = String.valueOf(map.get("uploadPath"));
			
			//파일들을 저장하고 Files table에 저장할 정보를 map에 담는다
			List <ImageStoreDTO> fileList = new ArrayList<>();
			
			//파일별로 반복
			for (MultipartFile uploadfile : uploadfiles) {
			if(uploadfile.isEmpty())	
				continue;
			
			String orgName = uploadfile.getOriginalFilename();
			System.out.println(orgName);
			String fileName = 
					(orgName.lastIndexOf("\\")<0)
					?orgName
				    :orgName.substring(orgName.lastIndexOf("\\")+1);
			String fileExt = 
			 (orgName.lastIndexOf('.')<0)
			 ? ""
		     :orgName.substring(orgName.lastIndexOf('.')); 
			
			//날짜 폴더 생성 d:\\dev\\data\\2024\\11\\05
			String folderPath = makeFolder(uploadPath);
			
			//파일 중복방지 : 같은 폴더에 같은 파일명의 파일을 저장하면 마지막 파일만 남는다
			//중복되지 않는 고유한 문자열 생성 : UUID
			String uuid = UUID.randomUUID().toString();
			
			//File.separator(/,\\)
			String saveName = uploadPath +  File.separator
			                + folderPath + File.separator
			                +uuid + "" +fileName;
			String saveName2 = folderPath +File.separator
					         + uuid + "" +fileName;
			Path savePath = Paths.get(saveName);
			// import java.nio.file.Path
			// Paths.get():특정경로의 파일정보를 가져온다
			
			// 파일저장
			try {
				uploadfile.transferTo(savePath); //업로드 폴더에 파일을 저장
				System.out.println( savePath + "가 저장됨");
			} catch (Exception e) {
			e.printStackTrace();
			}; 
			
			//저장된 파일들의 정보를 map에 list 방식으로 저장 -> pdsServiceImpl에 전달 
			ImageStoreDTO dto = new ImageStoreDTO (fileName,fileExt,saveName2, Integer.valueOf(map.get("store_idx").toString()));
			fileList.add(dto);
			
			} //for end
			
			//돌려줄 정보 map 저장
	        map.put("fileList", fileList );
	        System.out.println( map);
		}

		//날짜 폴더 생성
		private static String makeFolder(String uploadPath) {
			
			//d:\\dev\\data + \\2024\\11\\05
			//uploadPath + folderPath
			//String dataStr = LocalDate.now().format();
			//DateTimeFormatter.ofPattern("yyyy/MM/dd");
			
		    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("yyyy/MM/dd");
		    String dataStr = LocalDate.now().format(formatter);
			String folderPath = dataStr.replace("/",File.separator);
			
			File uploadPathFolder = new File(uploadPath,folderPath);
			if(uploadPathFolder.exists() == false) {
				uploadPathFolder.mkdirs(); // make directory  - mkdir() : make directory 상위폴더 없으면 생성 실패  - mkdirs() : 상위폴더가 없어도 폴더전체를 생성한다
			}
			return folderPath;
		}
		
		//실제물리파일 삭제 : 여러파일 삭제
		public static void delete(String uploadPath,List<ImageStoreDTO> fileList) {
		String path = uploadPath;
		   fileList.forEach((file)-> {
		   String sfile = file.getImage_path(); // 실제 파일명 uuid	
			
		   File dfile = new File(path + sfile);
		   if(dfile.exists())
		   dfile.delete();
			});
			
		}
		
		public static void reveiwSave( MultipartFile[] uploadfiles, HashMap<String, Object> map) {
			
			//저장된 경로를 가져온다
			String uploadPath = String.valueOf(map.get("uploadPath"));
			
			//파일들을 저장하고 Files table에 저장할 정보를 map에 담는다
			List <ImageReivewDTO> fileList = new ArrayList<>();
			
			//파일별로 반복
			for (MultipartFile uploadfile : uploadfiles) {
			if(uploadfile.isEmpty())	
				continue;
			
			String orgName = uploadfile.getOriginalFilename();
			System.out.println(orgName);
			String fileName = 
					(orgName.lastIndexOf("\\")<0)
					?orgName
				    :orgName.substring(orgName.lastIndexOf("\\")+1);
			String fileExt = 
			 (orgName.lastIndexOf('.')<0)
			 ? ""
		     :orgName.substring(orgName.lastIndexOf('.')); 
			
			//날짜 폴더 생성 d:\\dev\\data\\2024\\11\\05
			String folderPath = makeFolder(uploadPath);
			
			//파일 중복방지 : 같은 폴더에 같은 파일명의 파일을 저장하면 마지막 파일만 남는다
			//중복되지 않는 고유한 문자열 생성 : UUID
			String uuid = UUID.randomUUID().toString();
			
			//File.separator(/,\\)
			String saveName = uploadPath +  File.separator
			                + folderPath + File.separator
			                +uuid + "" +fileName;
			String saveName2 = folderPath +File.separator
					         + uuid + "" +fileName;
			Path savePath = Paths.get(saveName);
			// import java.nio.file.Path
			// Paths.get():특정경로의 파일정보를 가져온다
			
			// 파일저장
			try {
				uploadfile.transferTo(savePath); //업로드 폴더에 파일을 저장
				System.out.println( savePath + "가 저장됨");
			} catch (Exception e) {
			e.printStackTrace();
			}; 
			
			//저장된 파일들의 정보를 map에 list 방식으로 저장 -> pdsServiceImpl에 전달 
			ImageReivewDTO dto = new ImageReivewDTO (fileName,fileExt,saveName2, 
					                                Integer.valueOf(map.get("store_idx").toString()),
					                                Integer.valueOf(map.get("user_idx").toString()),
					                                Integer.valueOf(map.get("review_idx").toString()));
			fileList.add(dto);
			
			} //for end
			
			//돌려줄 정보 map 저장
	        map.put("fileList", fileList );
	        System.out.println( map);
		}


		
}
