package com.gd.uspace.member.dto;

import java.sql.Date;
import java.time.LocalDate;
import java.time.format.DateTimeFormatter;

public class MemberDTO {

    private String user_id;
    private String user_pw;
    private String user_name;
    private String user_phone;
    private String user_email;
    private String user_gender;
    private Date user_joindate;
    private int user_mannerpoint;
    private double user_attendance;
    private int user_status;
    private String user_permission;
    private long user_point;
    private int panalty_warning_cnt;
    
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getUser_pw() {
		return user_pw;
	}
	public void setUser_pw(String user_pw) {
		this.user_pw = user_pw;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getUser_phone() {
		return user_phone;
	}
	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_joindate() {
		if (this.user_joindate == null) {
            // `null` 대신 반환할 기본값이나, 처리 로직 적용
			return LocalDate.now().format(DateTimeFormatter.ofPattern("yyyy-MM-dd"));
        }
		return user_joindate.toString();
	}
	public void setUser_joindate(Date user_joindate) {
		this.user_joindate = user_joindate;
	}
	public int getUser_mannerpoint() {
		return user_mannerpoint;
	}
	public void setUser_mannerpoint(int user_mannerpoint) {
		this.user_mannerpoint = user_mannerpoint;
	}
	public double getUser_attendance() {
		return user_attendance;
	}
	public void setUser_attendance(double user_attendance) {
		this.user_attendance = user_attendance;
	}
	public int getUser_status() {
		return user_status;
	}
	public void setUser_status(int user_status) {
		this.user_status = user_status;
	}
	public String getUser_permission() {
		return user_permission;
	}
	public void setUser_permission(String user_permission) {
		this.user_permission = user_permission;
	}
	public long getUser_point() {
		return user_point;
	}
	public void setUser_point(long user_point) {
		this.user_point = user_point;
	}
	public int getPanalty_warning_cnt() {
		return panalty_warning_cnt;
	}
	public void setPanalty_warning_cnt(int panalty_warning_cnt) {
		this.panalty_warning_cnt = panalty_warning_cnt;
	}

	
}
