package com.gd.uspace.point.dto;

import java.sql.Date;
import java.time.LocalDate;

public class PointDTO {
	
	private String user_id;
	private int point_price;
	private String point_list;
	private Date point_date;
	private String space_name;
	private int user_point;
	
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
	public String getPoint_date() {
		return point_date.toString();
	}
	public void setPoint_date(Date point_date) {
		this.point_date = point_date;
	}
	@Override
	public String toString() {
		return "PointDTO{" +
				"user_id='" + user_id + '\'' +
				", point_price=" + point_price +
				", point_list='" + point_list + '\'' +
				", point_date=" + point_date +
				", space_name='" + space_name + '\'' +
				", user_point=" + user_point +
				'}';
	}
	
	
}
