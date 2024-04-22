package com.gd.uspace.space.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.gd.uspace.space.dao.SpaceDAO;
import com.gd.uspace.space.dto.SpaceAnswerDTO;
import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpaceImageDTO;
import com.gd.uspace.space.dto.SpaceOperatingDTO;
import com.gd.uspace.space.dto.SpacePageDTO;
import com.gd.uspace.space.dto.SpaceQuestionDTO;
import com.gd.uspace.space.dto.SpaceReviewDTO;

@Service
public class SpaceService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
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
