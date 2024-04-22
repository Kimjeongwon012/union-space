package com.gd.uspace.admin.dto;

public class AdminDTO {
	
	private String space_no;                                           
	private String user_id;                                            
	private String space_content1;                                      
	private String space_write_date1;                                   
	private String space_content2;                                      
	private String qna_state;                                          
	private String space_write_date2;
	
	public String getSpace_no() {
		return space_no;
	}
	public void setSpace_no(String space_no) {
		this.space_no = space_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSpace_content1() {
		return space_content1;
	}
	public void setSpace_content1(String space_content1) {
		this.space_content1 = space_content1;
	}
	public String getSpace_write_date1() {
		return space_write_date1;
	}
	public void setSpace_write_date1(String space_write_date1) {
		this.space_write_date1 = space_write_date1;
	}
	public String getSpace_content2() {
		return space_content2;
	}
	public void setSpace_content2(String space_content2) {
		this.space_content2 = space_content2;
	}
	public String getQna_state() {
		return qna_state;
	}
	public void setQna_state(String qna_state) {
		this.qna_state = qna_state;
	}
	public String getSpace_write_date2() {
		return space_write_date2;
	}
	public void setSpace_write_date2(String space_write_date2) {
		this.space_write_date2 = space_write_date2;
	}
	
	@Override
	public String toString() {
		return "AdminDTO [space_no=" + space_no + ", user_id=" + user_id + ", space_content1=" + space_content1
				+ ", space_write_date1=" + space_write_date1 + ", space_content2=" + space_content2 + ", qna_state="
				+ qna_state + ", space_write_date2=" + space_write_date2 + "]";
	}      
	
	

}
