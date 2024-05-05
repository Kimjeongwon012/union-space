package com.gd.uspace.point.dto;

public class PointPageDTO {
	
	private int page;
	private String sort;
	private String state;
	private String userId;
	private String user_id;
	
	
	
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

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUser_id() {
		return user_id;
	}
	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}
	@Override
	public String toString() {
		return "SpaceReviewPaginationDTO [page =" + page + ", sort =" + sort + ", state = "+state+"]";
	}

}
