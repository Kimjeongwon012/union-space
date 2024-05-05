package com.gd.uspace.main.dto;

import java.sql.Date;
import java.sql.Timestamp;

public class MainDTO {
	
    private String user_id;
    private int user_mannerpoint;
    private double user_attendance;
    private long user_point;
    
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
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
	public long getUser_point() {
		return user_point;
	}
	public void setUser_point(long user_point) {
		this.user_point = user_point;
	}
	@Override
	public String toString() {
		return "MainDTO [user_id=" + user_id + ", user_mannerpoint=" + user_mannerpoint + ", user_attendance="
				+ user_attendance + ", user_point=" + user_point + "]";
	}


}
