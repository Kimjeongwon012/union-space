package com.gd.uspace.space.service;

import java.util.HashMap;
import java.util.List;

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
import com.gd.uspace.space.dto.SpaceReviewPaginationDTO;

@Service
public class SpaceService {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired SpaceDAO spacedao;
	
	public SpacePageDTO getSpacePage(int space_no) {
		SpacePageDTO spacepageDTO = new SpacePageDTO();
//		HashMap<String, String> params = new HashMap<String,String>();
//		params.put("sort", "최신순");
//		params.put("page", "1");
//		params.put("space_no", "" + space_no);
		SpaceReviewPaginationDTO pageDTO = new SpaceReviewPaginationDTO();
		pageDTO.setSpace_no(space_no);
		pageDTO.setPage(1);
		pageDTO.setSort("최신순");
		spacepageDTO.setSpaceDTO(spacedao.getSpaceInfo(space_no));
		spacepageDTO.setSpaceImageDTO(spacedao.getSpaceImage(space_no));
		spacepageDTO.setSpaceReviewDTO(spacedao.getSpaceReview(pageDTO));
		spacepageDTO.setSpaceQuestionDTO(spacedao.getSpaceQuestion(space_no));
		spacepageDTO.setSpaceAnswerDTO(spacedao.getSpaceAnswer(space_no));
		spacepageDTO.setSpaceOperatingDTO(spacedao.getSpaceOperating(space_no));
 		return spacepageDTO;
	}
	
	public List<SpaceReviewDTO> getSpaceReview(int space_no, int page, String sort) {
//		HashMap<String, String> params = new HashMap<String,String>();
//		params.put("sort", sort);
//		params.put("page", page);
//		params.put("space_no", "" + space_no);
		SpaceReviewPaginationDTO pageDTO = new SpaceReviewPaginationDTO();
		pageDTO.setSpace_no(space_no);
		pageDTO.setPage(page);
		pageDTO.setSort("최신순");
		logger.info("params : {}", pageDTO);
		List<SpaceReviewDTO> result = spacedao.getSpaceReview(pageDTO);
		logger.info("장소 번호 : {}, 리뷰 목록", space_no);
		for (SpaceReviewDTO review : result) {
			logger.info("리뷰 작성자 : {}, 내용 : {}", review.getUser_id(), review.getReview_content());
		}
		return result;
	}

}
