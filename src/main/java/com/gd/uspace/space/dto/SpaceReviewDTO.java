package com.gd.uspace.space.dto;

import java.sql.Date;

public class SpaceReviewDTO {
    private int space_no;
    private String user_id;
    private String review_content;
    private Date review_date;
    private int review_score;
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
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public Date getReview_date() {
		return review_date;
	}
	public void setReview_date(Date review_date) {
		this.review_date = review_date;
	}
	public int getReview_score() {
		return review_score;
	}
	public void setReview_score(int review_score) {
		this.review_score = review_score;
	}
	
	@Override
	public String toString() {
		return "SpaceReviewDTO{" +
				"space_no='" + space_no + '\'' +
				", user_id=" + user_id +
				", review_content='" + review_content + '\'' +
				", review_date='" + review_date + '\'' +
				", review_score=" + review_score +
				'}';
	}

 
    
}
