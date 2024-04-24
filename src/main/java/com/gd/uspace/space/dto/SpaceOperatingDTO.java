package com.gd.uspace.space.dto;

import java.sql.Date;
import java.sql.Timestamp;
import java.text.SimpleDateFormat;
import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class SpaceOperatingDTO {
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private int space_no;
	// weekday HashMap 으로 숫자를 String 요일로 매핑한다
	private String space_day;
	// 아래의 Getter, Setter 를 보면 TimeStamp 형태를 String HH 로 변경함
	private int space_start_time; 
	private int space_end_time;
	private static final Map<Integer, String> weekday = new HashMap<>();
    static {
        weekday.put(0, "월요일");
        weekday.put(1, "화요일");
        weekday.put(2, "수요일");
        weekday.put(3, "목요일");
        weekday.put(4, "금요일");
        weekday.put(5, "토요일");
        weekday.put(6, "일요일");
    }
	public int getSpace_no() {
		return space_no;
	}
	public void setSpace_no(int space_no) {
		this.space_no = space_no;
	}
	public String getSpace_day() {
		return space_day;
	}
	public void setSpace_day(int space_day) {
		this.space_day = weekday.get(space_day);
	}
	public int getSpace_start_time() {
		return space_start_time;
	}
	public void setSpace_start_time(int space_start_time) {
		this.space_start_time = space_start_time;
	}
	public int getSpace_end_time() {
		return space_end_time;
	}
	public void setSpace_end_time(int space_end_time) {
		this.space_end_time = space_end_time;
	}
	
}
