package com.gd.uspace.reservation.dto;

public class ReservationTime {
	private int start_hour;
	private int end_hour;
	public int getStart_hour() {
		return start_hour;
	}
	public void setStart_hour(int start_hour) {
		this.start_hour = start_hour;
	}
	public int getEnd_hour() {
		return end_hour;
	}
	public void setEnd_hour(int end_hour) {
		this.end_hour = end_hour;
	}
	@Override
	public String toString() {
		return "ReservationTime [start_hour=" + start_hour + ", end_hour=" + end_hour + "]";
	}
}
