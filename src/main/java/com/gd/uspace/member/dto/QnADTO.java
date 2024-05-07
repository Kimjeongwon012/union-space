package com.gd.uspace.member.dto;

import java.sql.Date;

public class QnADTO {
	private int qna_no;
	private String qna_id;
	private String qna_pw;
	private String qna_title;
	private String qna_content;
	private Date qna_write_date;
	private int qna_state;
	private String reply_content;
	private Date reply_write_date;
	private int reply_state;

	
	public String getReply_content() {
		return reply_content;
	}
	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}
	public Date getReply_write_date() {
		return reply_write_date;
	}
	public void setReply_write_date(Date reply_write_date) {
		this.reply_write_date = reply_write_date;
	}
	public int getReply_state() {
		return reply_state;
	}
	public void setReply_state(int reply_state) {
		this.reply_state = reply_state;
	}
	public int getQna_no() {
		return qna_no;
	}
	public void setQna_no(int qna_no) {
		this.qna_no = qna_no;
	}
	public String getQna_id() {
		return qna_id;
	}
	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}
	public String getQna_pw() {
		return qna_pw;
	}
	public void setQna_pw(String qna_pw) {
		this.qna_pw = qna_pw;
	}
	public String getQna_title() {
		return qna_title;
	}
	public void setQna_title(String qna_title) {
		this.qna_title = qna_title;
	}
	public String getQna_content() {
		return qna_content;
	}
	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}
	public Date getQna_write_date() {
		return qna_write_date;
	}
	public void setQna_write_date(Date qna_write_date) {
		this.qna_write_date = qna_write_date;
	}
	public int getQna_state() {
		return qna_state;
	}
	public void setQna_state(int qna_state) {
		this.qna_state = qna_state;
	}
}
