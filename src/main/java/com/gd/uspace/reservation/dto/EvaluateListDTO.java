package com.gd.uspace.reservation.dto;

public class EvaluateListDTO {
	private String user_id;
	private String isAttendance;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getIsAttendance() {
		return isAttendance;
	}
	public void setIsAttendance(String isAttendance) {
		this.isAttendance = isAttendance;
	}
	@Override
	public String toString() {
		return "EvaluateListDTO [user_id=" + user_id + ", isAttendance=" + isAttendance + "]";
	}	
}
