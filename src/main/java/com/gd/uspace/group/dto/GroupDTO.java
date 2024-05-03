package com.gd.uspace.group.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;

public class GroupDTO {
    private int group_no;
    private int space_no;
    private String user_id;
    private String group_name;
    private String group_state;
    private Date group_create_date;
    private int group_people;
    private String par_people;
    private String group_introduce;
    private String group_caution;
    private Timestamp group_confirm;
    private Timestamp group_starttime;
    private Timestamp group_endtime;
    private String group_time;
    private int group_lowpeople;
    private int group_highpeople;
    private String attenDance_status;
    
    // 예약한 모임의 장소 이름
    private String space_name;
    
    // 해당 유저가 리뷰 작성했는지 여부
    private int isReviewed;
    
	public int getIsReviewed() {
		return isReviewed;
	}
	public void setIsReviewed(int isReviewed) {
		this.isReviewed = isReviewed;
	}
	public String getSpace_name() {
		return space_name;
	}
	public void setSpace_name(String space_name) {
		this.space_name = space_name;
	}
	public int getGroup_no() {
		return group_no;
	}
	public void setGroup_no(int group_no) {
		this.group_no = group_no;
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
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getGroup_state() {
		return group_state;
	}
	public void setGroup_state(String group_state) {
		this.group_state = group_state;
	}
	public Date getGroup_create_date() {
		return group_create_date;
	}
	public void setGroup_create_date(Date group_create_date) {
		this.group_create_date = group_create_date;
	}
	public int getGroup_people() {
		return group_people;
	}
	public void setGroup_people(int group_people) {
		this.group_people = group_people;
	}
	public String getGroup_introduce() {
		return group_introduce;
	}
	public void setGroup_introduce(String group_introduce) {
		this.group_introduce = group_introduce;
	}
	public String getGroup_caution() {
		return group_caution;
	}
	public void setGroup_caution(String group_caution) {
		this.group_caution = group_caution;
	}
	public Timestamp getGroup_confirm() {
		return group_confirm;
	}
	public void setGroup_confirm(Timestamp group_confirm) {
		this.group_confirm = group_confirm;
	}
	public Timestamp getGroup_starttime() {
		return group_starttime;
	}
	public void setGroup_starttime(Timestamp group_starttime) {
		this.group_starttime = group_starttime;
	}
	public Timestamp getGroup_endtime() {
		return group_endtime;
	}
	public void setGroup_endtime(Timestamp group_endtime) {
		this.group_endtime = group_endtime;
	}
	public String getGroup_time() {
		return group_time;
	}
	public void setGroup_time(String startTime, String endTime) {
	    this.group_time = startTime + " ~ " + endTime;
	}
	public int getGroup_lowpeople() {
		return group_lowpeople;
	}
	public void setGroup_lowpeople(int group_lowpeople) {
		this.group_lowpeople = group_lowpeople;
	}
	public int getGroup_highpeople() {
		return group_highpeople;
	}
	public void setGroup_highpeople(int group_highpeople) {
		this.group_highpeople = group_highpeople;
	}
	
	public void setGroup_time(String group_time) {
		this.group_time = group_time;
	}
	public String getPar_people() {
		return par_people;
	}
	public void setPar_people(String par_people) {
		this.par_people = par_people;
	}
	public String getAttenDance_status() {
		return attenDance_status;
	}
	public void setAttenDance_status(String attenDance_status) {
		this.attenDance_status = attenDance_status;
	}
	@Override
	public String toString() {
	    return "GroupDTO{" +
	            "group_no=" + group_no +
	            ", space_no=" + space_no +
	            ", user_id='" + user_id + '\'' +
	            ", group_name='" + group_name + '\'' +
	            ", group_state='" + group_state + '\'' +
	            ", group_create_date=" + group_create_date +
	            ", group_people=" + group_people +
	            ", group_introduce='" + group_introduce + '\'' +
	            ", group_caution='" + group_caution + '\'' +
	            ", group_confirm='" + group_confirm + '\'' +
	            ", group_starttime='" + group_starttime + '\'' +
	            ", group_endtime='" + group_endtime + '\'' +
	            ", group_time='" + group_time + '\'' +
	            ", group_lowpeople=" + group_lowpeople +
	            ", group_highpeople=" + group_highpeople +
	            '}';
	}
}
