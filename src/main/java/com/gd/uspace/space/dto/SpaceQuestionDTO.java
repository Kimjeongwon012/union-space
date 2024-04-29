package com.gd.uspace.space.dto;

import java.sql.Date;
import java.util.List;

public class SpaceQuestionDTO {
    private int space_question_no;
    private int space_no;
    private String user_id;
    private Date question_write_date;
    private String question_content;
    private SpaceAnswerDTO spaceAnswerDTO;
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
	public Date getQuestion_write_date() {
		return question_write_date;
	}
	public void setQuestion_write_date(Date question_write_date) {
		this.question_write_date = question_write_date;
	}
	public String getQuestion_content() {
		return question_content;
	}
	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}
	public SpaceAnswerDTO getSpaceAnswerDTO() {
		return spaceAnswerDTO;
	}
	public void setSpaceAnswerDTO(SpaceAnswerDTO spaceAnswerDTO) {
		this.spaceAnswerDTO = spaceAnswerDTO;
	}
	
    
}
