package com.gd.uspace.reservation.dto;

public class EvaluateItemDTO {
	private int item_no;
	private String item_content;
	private double item_score;
	public int getItem_no() {
		return item_no;
	}
	public void setItem_no(int item_no) {
		this.item_no = item_no;
	}
	public String getItem_content() {
		return item_content;
	}
	public void setItem_content(String item_content) {
		this.item_content = item_content;
	}
	public double getItem_score() {
		return item_score;
	}
	public void setItem_score(double item_score) {
		this.item_score = item_score;
	}
	@Override
	public String toString() {
		return "EvaluateItemDTO [item_no=" + item_no + ", item_content=" + item_content + ", item_score=" + item_score
				+ "]";
	}
}
