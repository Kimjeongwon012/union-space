package com.gd.uspace.group.dto;

import java.sql.Date;
import java.time.LocalDate;

public class GroupMemberDTO {
	private int group_no;
	private String user_id;
	private int groupmember_state;
	private Date groupmember_date;
	private int groupmember_permission;
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
	public int getGroupmember_state() {
		return groupmember_state;
	}
	public void setGroupmember_state(int groupmember_state) {
		this.groupmember_state = groupmember_state;
	}
	public Date getGroupmember_date() {
		return groupmember_date;
	}
	public void setGroupmember_date(Date groupmember_date) {
		this.groupmember_date = groupmember_date;
	}
	public int getGroupmember_permission() {
		return groupmember_permission;
	}
	public void setGroupmember_permission(int groupmember_permission) {
		this.groupmember_permission = groupmember_permission;
	}
	@Override
	public String toString() {
		return "PointMemberDTO [group_no=" + group_no + ", user_id=" + user_id + ", groupmember_state="
				+ groupmember_state + ", groupmember_date=" + groupmember_date + ", groupmember_permission="
				+ groupmember_permission + "]";
	}
}
