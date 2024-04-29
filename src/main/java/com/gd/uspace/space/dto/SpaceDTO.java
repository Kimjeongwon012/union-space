package com.gd.uspace.space.dto;

import java.sql.Date;

public class SpaceDTO {
    private int space_no;
    private String space_name;
    private String space_type;
    private int space_point;
    private String space_address;
    private String space_region;
    private float space_latitude;
    private float space_longitude;
    private int space_min;
    private int space_max;
    private String space_intro_content;
    private String space_guide_content;
    private String space_notice_content;
    private Date space_regist_date;
    private String space_contact;
	private int space_status;
    private int space_rsvCnt;
    
    
    public int getSpace_rsvCnt() {
		return space_rsvCnt;
	}
	public void setSpace_rsvCnt(int space_rsvCnt) {
		this.space_rsvCnt = space_rsvCnt;
	}
    
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
	public String getSpace_type() {
		return space_type;
	}
	public void setSpace_type(String space_type) {
		this.space_type = space_type;
	}
	public int getSpace_point() {
		return space_point;
	}
	public void setSpace_point(int space_point) {
		this.space_point = space_point;
	}
	public String getSpace_address() {
		return space_address;
	}
	public void setSpace_address(String space_address) {
		this.space_address = space_address;
	}
	public String getSpace_region() {
		return space_region;
	}
	public void setSpace_region(String space_region) {
		this.space_region = space_region;
	}
	public float getSpace_latitude() {
		return space_latitude;
	}
	public void setSpace_latitude(float space_latitude) {
		this.space_latitude = space_latitude;
	}
	public float getSpace_longitude() {
		return space_longitude;
	}
	public void setSpace_longitude(float space_longitude) {
		this.space_longitude = space_longitude;
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
	public String getSpace_intro_content() {
		return space_intro_content;
	}
	public void setSpace_intro_content(String space_intro_content) {
		this.space_intro_content = space_intro_content;
	}
	public String getSpace_guide_content() {
		return space_guide_content;
	}
	public void setSpace_guide_content(String space_guide_content) {
		this.space_guide_content = space_guide_content;
	}
	public String getSpace_notice_content() {
		return space_notice_content;
	}
	public void setSpace_notice_content(String space_notice_content) {
		this.space_notice_content = space_notice_content;
	}
	public Date getSpace_regist_date() {
		return space_regist_date;
	}
	public void setSpace_regist_date(Date space_regist_date) {
		this.space_regist_date = space_regist_date;
	}
	public String getSpace_contact() {
		return space_contact;
	}
	public void setSpace_contact(String space_contact) {
		this.space_contact = space_contact;
	}
	public int getSpace_status() {
		return space_status;
	}
	public void setSpace_status(int space_status) {
		this.space_status = space_status;
	}      


}
