package com.gd.uspace.space.dto;

import java.sql.Date;

public class SpaceQuestionDTO {
    private int space_question_no;
    private int space_no;
    private String user_id;
    private Date space_write_date;
    private String space_content;
	public int getSpace_question_no() {
		return space_question_no;
	}
	public void setSpace_question_no(int space_question_no) {
		this.space_question_no = space_question_no;
	}
	public int getSpace_no() {
		return space_no;
	}
	public void setSpace_no(int space_no) {
		this.space_no = space_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public Date getSpace_write_date() {
		return space_write_date;
	}
	public void setSpace_write_date(Date space_write_date) {
		this.space_write_date = space_write_date;
	}
	public String getSpace_content() {
		return space_content;
	}
	public void setSpace_content(String space_content) {
		this.space_content = space_content;
	}
    
}
