package com.gd.uspace.member.dto;

import java.sql.Date;

public class MemberDTO {
	private String user_id;
	private String user_pw;
	private String user_name;
	private String user_phone;
	private String user_gender;
	private String user_email;
	private Date user_joindate;
	private int user_mannerpoint;
	private int user_state;
	private String user_permission;
	private int user_point;
	
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
	public String getUser_gender() {
		return user_gender;
	}
	public void setUser_gender(String user_gender) {
		this.user_gender = user_gender;
	}
	public String getUser_email() {
		return user_email;
	}
	public void setUser_email(String user_email) {
		this.user_email = user_email;
	}
	public Date getUser_joindate() {
		return user_joindate;
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
	public int getUser_state() {
		return user_state;
	}
	public void setUser_state(int user_state) {
		this.user_state = user_state;
	}
	public String getUser_permission() {
		return user_permission;
	}
	public void setUser_permission(String user_permission) {
		this.user_permission = user_permission;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	
	
	
	
	
}
