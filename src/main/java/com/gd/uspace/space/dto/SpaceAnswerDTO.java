package com.gd.uspace.space.dto;

import java.sql.Date;

public class SpaceAnswerDTO {
    private int space_question_no;
    private Date space_write_date;
    private String space_content;
    private int qna_state;
	public int getSpace_question_no() {
		return space_question_no;
	}
	public void setSpace_question_no(int space_question_no) {
		this.space_question_no = space_question_no;
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
	public int getQna_state() {
		return qna_state;
	}
	public void setQna_state(int qna_state) {
		this.qna_state = qna_state;
	}
    
}
