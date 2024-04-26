package com.gd.uspace.group.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class PenaltyDTO {
    private String user_id;
    private int total_penalty_count;
    private Timestamp latest_penalty_date;
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getTotal_penalty_count() {
		return total_penalty_count;
	}
	public void setTotal_penalty_count(int total_penalty_count) {
		this.total_penalty_count = total_penalty_count;
	}
	public Timestamp getLatest_penalty_date() {
		return latest_penalty_date;
	}
	public void setLatest_penalty_date(Timestamp latest_penalty_date) {
		this.latest_penalty_date = latest_penalty_date;
	}
	@Override
	public String toString() {
		return "PenaltyDTO [user_id=" + user_id + ", total_penalty_count=" + total_penalty_count
				+ ", latest_penalty_date=" + latest_penalty_date + "]";
	}
    
    
}
