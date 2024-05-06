package com.gd.uspace.point.dto;

import java.sql.Timestamp;

public class PointDTO {
	private int group_no;
	private int point_no;
	private String user_id;
	private int point_price;
	private String point_list;
	private Timestamp point_date;
	private String space_name;
	private int user_point;
	private int point_balance;
	
	public int getGroup_no() {
		return group_no;
	}
	public void setGroup_no(int group_no) {
		this.group_no = group_no;
	}
	
	
	public int getPoint_no() {
		return point_no;
	}
	public void setPoint_no(int point_no) {
		this.point_no = point_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public int getPoint_price() {
		return point_price;
	}
	public void setPoint_price(int point_price) {
		this.point_price = point_price;
	}
	public String getPoint_list() {
		return point_list;
	}
	public void setPoint_list(String point_list) {
		this.point_list = point_list;
	}
	public String getPoint_date() {
		return point_date.toString();
	}
	public void setPoint_date(Timestamp point_date) {
		this.point_date = point_date;
	}
	public String getSpace_name() {
		return space_name;
	}
	public void setSpace_name(String space_name) {
		this.space_name = space_name;
	}
	public int getUser_point() {
		return user_point;
	}
	public void setUser_point(int user_point) {
		this.user_point = user_point;
	}
	public int getPoint_balance() {
		return point_balance;
	}
	public void setPoint_balance(int point_balance) {
		this.point_balance = point_balance;
	}
	@Override
	public String toString() {
		return "PointDTO{" +
				", point_price=" + point_price +
				", point_list='" + point_list + '\'' +
				", point_date=" + point_date +
				", space_name='" + space_name + '\'' +
				", point_balance=" + point_balance +
				'}';
	}

}
