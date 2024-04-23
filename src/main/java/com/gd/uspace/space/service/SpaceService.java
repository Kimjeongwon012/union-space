package com.gd.uspace.space.service;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.gd.uspace.space.dao.SpaceDAO;
import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpacePageDTO;

@Service
public class SpaceService {
	@Autowired SpaceDAO dao;
	Logger logger = LoggerFactory.getLogger(this.getClass());
	public static final String fileRoot = "C:/workspaces/GitHub/union-space/UnionSpace/src/main/webapp/resources/images/spaceImg/";
	
	// 장소 등록
	public int addSpace(Map<String, String> param, MultipartFile mainPhoto, MultipartFile[] photos) {
		int row = -1;
		
		SpaceDTO dto = new SpaceDTO();
		
		// SpaceDTO에 값 저장
		dto.setSpace_name(param.get("space_name"));
		dto.setSpace_type(param.get("space_type"));
		int point = Integer.parseInt(param.get("space_point"));
		dto.setSpace_point(point);
		dto.setSpace_address(param.get("space_address"));
		dto.setSpace_region(param.get("space_region"));
		float latitude = Float.parseFloat(param.get("space_latitude"));
		dto.setSpace_latitude(latitude);
		float longitude = Float.parseFloat(param.get("space_longitude"));
		dto.setSpace_longitude(longitude);
		int min = Integer.parseInt(param.get("space_min"));
		dto.setSpace_min(min);
		int max = Integer.parseInt(param.get("space_max"));
		dto.setSpace_max(max);
		dto.setSpace_intro_content(param.get("space_intro_content"));
		dto.setSpace_guide_content(param.get("space_guide_content"));
		dto.setSpace_notice_content(param.get("space_notice_content"));
		dto.setSpace_contact(param.get("space_contact"));
		dto.setSpace_status(1);	// 운영 상태 디폴트(운영중) 지정
		
		row = dao.addSpace(dto);

		if(row > 0) {
			logger.info("장소 다른 값 저장 완료");
			
			int idx = dto.getSpace_no();
			logger.info("space_no: "+idx);

			addTimeTable(idx, param);		// 운영시간 저장
			uploadMainPhoto(idx, mainPhoto);// 대표 사진 저장
			uploadPhotos(idx, photos);		// 업체 사진 저장
		}
		return row;
	}
	// 장소 운영 시간
	public void addTimeTable(int idx, Map<String, String> param) {
		logger.info("운영시간 저장");
		for(int i=0; i<7; i++) {
			int day = i;
			String startKey = i+"start";
			String endKey = i+"end";

			int start = Integer.parseInt(param.get(startKey));
			int end = Integer.parseInt(param.get(endKey));
			logger.info("i: "+i+" idx: "+idx+" start: "+start+" end: "+end);
			
			dao.addTimeTable(idx, day, start, end);
		}
	}
	// 대표 사진 저장
	public void uploadMainPhoto(int idx, MultipartFile photo) {
		int photType = 1;
		logger.info("대표 사진 저장");

		String fileName = photo.getOriginalFilename();
//		logger.info("uploaded file name: "+fileName);
		
		if(!fileName.isEmpty()) {
			String ext = fileName.substring(fileName.lastIndexOf(".")); 
			String newFileName = idx+"main_"+System.currentTimeMillis()+ext;
			logger.info("사진명 변경: "+fileName+"->"+newFileName);
			try {
				byte[] bytes = photo.getBytes();
				Path path = Paths.get(fileRoot+newFileName);
				Files.write(path, bytes);
				//dao.uploadPhotos(idx, fileName, newFileName, photType);
				Thread.sleep(1);
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}
	// 업체 사진 저장
	public void uploadPhotos(int idx, MultipartFile[] photos) {
		int photType = 0;
		logger.info("업체 사진들 저장");

		for (MultipartFile photo : photos) {
			String fileName = photo.getOriginalFilename();
//			logger.info("uploaded file name: "+fileName);
			
			if(!fileName.isEmpty()) {
				String ext = fileName.substring(fileName.lastIndexOf(".")); 
				String newFileName = idx+"basic_"+System.currentTimeMillis()+ext;
				logger.info("사진명 변경: "+fileName+"->"+newFileName);
				try {
					byte[] bytes = photo.getBytes();
					Path path = Paths.get(fileRoot+newFileName);
					Files.write(path, bytes);
					dao.uploadPhotos(idx, fileName, newFileName, photType); 
					Thread.sleep(1);
				} catch (Exception e) {
					e.printStackTrace();
				}
			}
		}
	}
	
	@Autowired SpaceDAO spacedao;
	
	public SpacePageDTO getSpacePage(int space_no) {
		SpacePageDTO spacepageDTO = new SpacePageDTO();
		spacepageDTO.setSpaceDTO(spacedao.getSpaceInfo(space_no));
		spacepageDTO.setSpaceImageDTO(spacedao.getSpaceImage(space_no));
		spacepageDTO.setSpaceReviewDTO(spacedao.getSpaceReview(space_no));
		spacepageDTO.setSpaceQuestionDTO(spacedao.getSpaceQuestion(space_no));
		spacepageDTO.setSpaceAnswerDTO(spacedao.getSpaceAnswer(space_no));
		spacepageDTO.setSpaceOperatingDTO(spacedao.getSpaceOperating(space_no));
 		return spacepageDTO;
	}
}
