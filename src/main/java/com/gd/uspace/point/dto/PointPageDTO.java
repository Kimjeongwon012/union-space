package com.gd.uspace.point.dto;

public class PointPageDTO {
	
	private int page;
	private String sort;
	private String state;
	
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
	@Override
	public String toString() {
		return "SpaceReviewPaginationDTO [page =" + page + ", sort =" + sort + ", state = "+state+"]";
	}

}
