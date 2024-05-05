package com.gd.uspace.reservation.dto;

import java.sql.Timestamp;

public class EvaluateDTO {
    private int attendance_no;
    private int group_no;
    private String user_id;
    private String user_evid;
    private Timestamp user_review_log_date;
    private double user_review_total_manner_score;
	public int getAttendance_no() {
		return attendance_no;
	}
	public void setAttendance_no(int attendance_no) {
		this.attendance_no = attendance_no;
	}
	public int getGroup_no() {
		return group_no;
	}
	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_evid() {
		return user_evid;
	}
	public void setUser_evid(String user_evid) {
		this.user_evid = user_evid;
	}
	public Timestamp getUser_review_log_date() {
		return user_review_log_date;
	}
	public void setUser_review_log_date(Timestamp user_review_log_date) {
		this.user_review_log_date = user_review_log_date;
	}
	public double getUser_review_total_manner_score() {
		return user_review_total_manner_score;
	}
	public void setUser_review_total_manner_score(double user_review_total_manner_score) {
		this.user_review_total_manner_score = user_review_total_manner_score;
	}
	@Override
	public String toString() {
		return "EvaluateDTO [attendance_no=" + attendance_no + ", group_no=" + group_no + ", user_id=" + user_id
				+ ", user_evid=" + user_evid + ", user_review_log_date=" + user_review_log_date
				+ ", user_review_total_manner_score=" + user_review_total_manner_score + "]";
	}
    
    
}
