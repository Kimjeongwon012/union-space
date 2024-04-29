package com.gd.uspace.admin.dto;

public class AdminDTO {
	
	// adminQnA list && filtering
	private String space_no;                                           
	private String user_id;                                            
	private String space_content1;                                      
	private String space_write_date1;                                   
	private String space_content2;                                      
	private String qna_state;                                          
	private String space_write_date2;
	private String space_qna_no;
	
	
	private int start; // 페이지의 시작 인덱스
	private int pageSize; // 페이지 크기
	private int page;
	private int totalRecords;
	private int totalPages;
	
	private String sort;
	private String state;
	
	private String type;
	private String keyword;
	
	// adminMain group list && filtering
	private String group_no;
	private String group_name;
	private String group_starttime;
	private String meeting_status;
	private String group_confirm;
	private String group_state;
	
	// adminSpaceReview list
	private String review_content;
	private String review_date;
	
	
	// adminQnA list && filtering get/setter
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSpace_qna_no() {
		return space_qna_no;
	}
	public void setSpace_qna_no(String space_qna_no) {
		this.space_qna_no = space_qna_no;
	}
	public String getSpace_no() {
		return space_no;
	}
	public void setSpace_no(String space_no) {
		this.space_no = space_no;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	public String getSpace_content1() {
		return space_content1;
	}
	public void setSpace_content1(String space_content1) {
		this.space_content1 = space_content1;
	}
	public String getSpace_write_date1() {
		return space_write_date1;
	}
	public void setSpace_write_date1(String space_write_date1) {
		this.space_write_date1 = space_write_date1;
	}
	public String getSpace_content2() {
		return space_content2;
	}
	public void setSpace_content2(String space_content2) {
		this.space_content2 = space_content2;
	}
	public String getQna_state() {
		return qna_state;
	}
	public void setQna_state(String qna_state) {
		this.qna_state = qna_state;
	}
	public String getSpace_write_date2() {
		return space_write_date2;
	}
	public void setSpace_write_date2(String space_write_date2) {
		this.space_write_date2 = space_write_date2;
	}
	
	// adminMain group list && filtering get/setter
	public String getGroup_no() {
		return group_no;
	}
	public void setGroup_no(String group_no) {
		this.group_no = group_no;
	}
	public String getGroup_name() {
		return group_name;
	}
	public void setGroup_name(String group_name) {
		this.group_name = group_name;
	}
	public String getGroup_starttime() {
		return group_starttime;
	}
	public void setGroup_starttime(String group_starttime) {
		this.group_starttime = group_starttime;
	}
	public String getMeeting_status() {
		return meeting_status;
	}
	public void setMeeting_status(String meeting_status) {
		this.meeting_status = meeting_status;
	}
	public String getGroup_confirm() {
		return group_confirm;
	}
	public void setGroup_confirm(String group_confirm) {
		this.group_confirm = group_confirm;
	}
	public String getGroup_state() {
		return group_state;
	}
	public void setGroup_state(String group_state) {
		this.group_state = group_state;
	}      
	
	// adminSpaceReview && filtering get/setter
	
	public String getReview_content() {
		return review_content;
	}
	public void setReview_content(String review_content) {
		this.review_content = review_content;
	}
	public String getReview_date() {
		return review_date;
	}
	public void setReview_date(String review_date) {
		this.review_date = review_date;
	}
	
	
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	
	public int getStart() {
		return start;
	}
	public void setStart(int start) {
		this.start = start;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	
	public int getTotalRecords() {
		return totalRecords;
	}
	public void setTotalRecords(int totalRecords) {
		this.totalRecords = totalRecords;
	}
	public int getTotalPages() {
		return totalPages;
	}
	public void setTotalPages(int totalPages) {
		this.totalPages = totalPages;
	}
	
	@Override
	public String toString() {
		return "AdminDTO [space_no=" + space_no + ", user_id=" + user_id + ", space_content1=" + space_content1
				+ ", space_write_date1=" + space_write_date1 + ", space_content2=" + space_content2 + ", qna_state="
				+ qna_state + ", space_write_date2=" + space_write_date2 + ", space_qna_no=" + space_qna_no + ", start="
				+ start + ", pageSize=" + pageSize + ", page=" + page + ", totalRecords=" + totalRecords
				+ ", totalPages=" + totalPages + ", sort=" + sort + ", state=" + state + ", type=" + type + ", keyword="
				+ keyword + ", group_no=" + group_no + ", group_name=" + group_name + ", group_starttime="
				+ group_starttime + ", meeting_status=" + meeting_status + ", group_confirm=" + group_confirm
				+ ", group_state=" + group_state + ", review_content=" + review_content + ", review_date=" + review_date
				+ "]";
	}
	
	

}
