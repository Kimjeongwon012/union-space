package com.gd.uspace.space.dto;

import java.util.List;

public class SpacePageDTO {
    private SpaceDTO spaceDTO;
    private List<SpaceImageDTO> spaceImageDTO;
    private List<SpaceOperatingDTO> spaceOperatingDTO;
    private List<SpaceQuestionDTO> spaceQuestionDTO;
    private List<SpaceAnswerDTO> spaceAnswerDTO;
    private List<SpaceReviewDTO> spaceReviewDTO;
	public SpaceDTO getSpaceDTO() {
		return spaceDTO;
	}
	public void setSpaceDTO(SpaceDTO spaceDTO) {
		this.spaceDTO = spaceDTO;
	}
	public List<SpaceImageDTO> getSpaceImageDTO() {
		return spaceImageDTO;
	}
	public void setSpaceImageDTO(List<SpaceImageDTO> spaceImageDTO) {
		this.spaceImageDTO = spaceImageDTO;
	}
	public List<SpaceOperatingDTO> getSpaceOperatingDTO() {
		return spaceOperatingDTO;
	}
	public void setSpaceOperatingDTO(List<SpaceOperatingDTO> spaceOperatingDTO) {
		this.spaceOperatingDTO = spaceOperatingDTO;
	}
	public List<SpaceQuestionDTO> getSpaceQuestionDTO() {
		return spaceQuestionDTO;
	}
	public void setSpaceQuestionDTO(List<SpaceQuestionDTO> spaceQuestionDTO) {
		this.spaceQuestionDTO = spaceQuestionDTO;
	}
	public List<SpaceAnswerDTO> getSpaceAnswerDTO() {
		return spaceAnswerDTO;
	}
	public void setSpaceAnswerDTO(List<SpaceAnswerDTO> spaceAnswerDTO) {
		this.spaceAnswerDTO = spaceAnswerDTO;
	}
	public List<SpaceReviewDTO> getSpaceReviewDTO() {
		return spaceReviewDTO;
	}
	public void setSpaceReviewDTO(List<SpaceReviewDTO> spaceReviewDTO) {
		this.spaceReviewDTO = spaceReviewDTO;
	}
    
}
