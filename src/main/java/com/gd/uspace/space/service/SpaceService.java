package com.gd.uspace.space.service;

import java.io.File;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;
import java.util.Map;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import com.gd.uspace.space.dao.SpaceDAO;
import com.gd.uspace.space.dto.PaginationDTO;
import com.gd.uspace.space.dto.PhotoDTO;
import com.gd.uspace.space.dto.SpaceAnswerDTO;
import com.gd.uspace.space.dto.SpaceDTO;
import com.gd.uspace.space.dto.SpacePageDTO;
import com.gd.uspace.space.dto.SpaceQuestionDTO;
import com.gd.uspace.space.dto.SpaceReviewDTO;

@Service
public class SpaceService {
	@Autowired SpaceDAO dao;
	@Autowired SpaceDAO spacedao;

	Logger logger = LoggerFactory.getLogger(this.getClass());
	public static final String fileRoot = "C:/workspaces/GitHub/union-space/UnionSpace/src/main/webapp/resources/images/spaceImg/";
	
	// 장소 목록 조회
	public List<SpaceDTO> getSpaceList() {
		List<SpaceDTO> list= dao.getSpaceList();
		for (SpaceDTO space : list) {
			int space_no = space.getSpace_no();		// 장소 번호
			String idx = Integer.toString(space_no);
//			logger.info("idx: "+idx);
			int rsvCnt = dao.getRsvCnt(idx);	// 장소별 예약건수 조회
//			logger.info("예약 건수: "+rsvCnt);
			space.setSpace_rsvCnt(rsvCnt);
		}
		return list;
	}
	

	// 장소 삭제
	public int delSpace(List<String> spaces) {
		int row = -1;
		for (String idx : spaces) {
			List<PhotoDTO> list = dao.getFiles(idx);
//			String filename = dao.getFiles(idx);
			logger.info("idx: "+idx);
			
			if(list != null) {
				for (PhotoDTO photo : list) {
					String filename = photo.getSpace_update_name();
					logger.info("filename: "+filename);
					
					File file = new File(fileRoot+filename);
					if(file.exists()) {
						file.delete();
						logger.info("���� ���� �Ϸ�");
					}	
					
				}
				row = dao.delSpace(idx);
			}
			
		}
		return row;
	}
	
	// 장소 상세보기 페이지의 사진, 상세정보, 운영시간 등을 SpacePageDTO 형태로 담아서 반환한다 
	public SpacePageDTO getSpacePage(int space_no) {
		SpacePageDTO spacepageDTO = new SpacePageDTO();
		spacepageDTO.setSpaceDTO(dao.getSpaceInfo(space_no));
		spacepageDTO.setSpaceImageDTO(dao.getSpaceImage(space_no));
		spacepageDTO.setSpaceOperatingDTO(dao.getSpaceOperating(space_no));
 		return spacepageDTO;
	}
	
	// 페이징, 정렬처리된 리뷰 목록을 반환한다
	public List<SpaceReviewDTO> getSpaceReview(int space_no, int page, String sort) {
		PaginationDTO pageDTO = new PaginationDTO();
		pageDTO.setSpace_no(space_no); // 장소 번호
		pageDTO.setPage((page - 1) * 5); // 보여줄 페이지의 시작 번호 
		pageDTO.setSort(sort); // 최신순, 과거순
		
		// DB에서 리뷰 목록을 가져온다
		List<SpaceReviewDTO> result = dao.getSpaceReview(pageDTO);
		return result;
	}
	
	// 페이징 처리를 위해 리뷰 총 페이지 갯수를 반환한다
	public int getReviewAllPageCount() {
		return dao.getReviewAllPageCount();
	}

	// 페이징 처리를 위해 장소 질문 및 답변 총 페이지 갯수를 반환한다
	public int getQnaAllPageCount() {
		return dao.getQuestionAllPageCount();
	}
	
	// 장소 상세보기 페이지에서 페이징 처리된 질문 목록을 반환한다 
	public List<SpaceQuestionDTO> getSpaceQna(int space_no, int page, String sort) {
		PaginationDTO pageDTO = new PaginationDTO();
		pageDTO.setSpace_no(space_no); // 장소 번호
		pageDTO.setPage((page - 1) * 5); // 보여줄 페이지의 시작 번호 
		pageDTO.setSort(sort); // 최신순, 과거순
		
		// 해당 space_no 번인 장소의 질문 목록을 데이터베이스에서 가져온다
		List<SpaceQuestionDTO> question = dao.getSpaceQna(pageDTO);
		
		// SpaceQuestionDTO의 SpaceAnswerDTO 필드 에 답변 데이터를 저장한다
		for (SpaceQuestionDTO dto : question) {
			int space_question_no = dto.getSpace_question_no();
			SpaceAnswerDTO answer = dao.getSpaceAnswer(space_question_no);
			dto.setSpaceAnswerDTO(answer);
		}
		return question;
	}

	// 사용자가 작성한 질문을 DB에 저장
	public void insertQuestion(int space_no, String user_id, String question_content) {
		dao.insertQuestion(space_no, user_id, question_content);
	}
	
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
				dao.uploadPhotos(idx, fileName, newFileName, photType);
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

	 public SpaceDTO getSpaceById(Integer space_no) {
	        return spacedao.getSpaceById(space_no);
	    }


	 public int updateSpace(Map<String, String> params, MultipartFile mainPhoto, MultipartFile[] photos) {
	        int row = -1;

	        SpaceDTO dto = dao.getSpaceInfo(Integer.parseInt(params.get("space_no")));
	        logger.info("dto1 : {}", dto);
	        // 수정된 내용을 파라미터에서 가져와서 SpaceDTO에 저장한다
	        dto.setSpace_no(Integer.parseInt(params.get("space_no")));
	        dto.setSpace_name(params.get("space_name"));
	        dto.setSpace_type(params.get("space_type"));
	        dto.setSpace_point(Integer.parseInt(params.get("space_point")));
	        dto.setSpace_region(params.get("space_region"));
	        dto.setSpace_address(params.get("space_address"));
	        dto.setSpace_max(Integer.parseInt(params.get("space_max")));
	        dto.setSpace_min(Integer.parseInt(params.get("space_min")));
	        dto.setSpace_intro_content(params.get("space_intro_content"));
	        dto.setSpace_guide_content(params.get("space_guide_content"));
	        dto.setSpace_notice_content(params.get("space_notice_content"));
	        dto.setSpace_contact(params.get("space_contact"));
	        
	        

	        // SpaceDTO를 이용하여 데이터베이스에서 해당 장소의 정보를 업데이트한다
	        row = dao.updateSpace(dto);

	        // 대표 사진 및 업체 사진을 업데이트한다
	        if (row > 0) {
	            // 대표 사진 업데이트 로직
	            // 업체 사진 업데이트 로직
	        }

	        return row;
	    }
	}
