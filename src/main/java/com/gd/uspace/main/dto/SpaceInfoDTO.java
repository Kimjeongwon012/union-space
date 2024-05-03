package com.gd.uspace.main.dto;

public class SpaceInfoDTO {
	private int space_no;
    private String space_name;
    private int space_min;
    private int space_max;
    private String space_region;
    private String space_update_name;
	public int getSpace_no() {
		return space_no;
	}
	public void setSpace_no(int space_no) {
		this.space_no = space_no;
	}
	public String getSpace_name() {
		return space_name;
	}
	public void setSpace_name(String space_name) {
		this.space_name = space_name;
	}
	public int getSpace_min() {
		return space_min;
	}
	public void setSpace_min(int space_min) {
		this.space_min = space_min;
	}
	public int getSpace_max() {
		return space_max;
	}
	public void setSpace_max(int space_max) {
		this.space_max = space_max;
	}
	public String getSpace_region() {
		return space_region;
	}
	public void setSpace_region(String space_region) {
		this.space_region = space_region;
	}
	public String getSpace_update_name() {
		return space_update_name;
	}
	public void setSpace_update_name(String space_update_name) {
		this.space_update_name = "/resources/images/spaceImg/" + space_update_name;
	}
	@Override
	public String toString() {
		return "SpaceInfoDTO [space_name=" + space_name + ", space_min=" + space_min + ", space_max=" + space_max
				+ ", space_region=" + space_region + ", space_update_name=" + space_update_name + "]";
	}
    
}
