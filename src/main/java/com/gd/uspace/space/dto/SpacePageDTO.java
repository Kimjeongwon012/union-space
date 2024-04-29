package com.gd.uspace.space.dto;

import java.util.List;

public class SpacePageDTO {
    private SpaceDTO spaceDTO;
    private List<SpaceImageDTO> spaceImageDTO;
    private List<SpaceOperatingDTO> spaceOperatingDTO;
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
    
}
