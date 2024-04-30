package com.gd.uspace.point.dto;

import java.sql.Date;

public class PointPageDTO {
	
	private int page;
	private String sort;
	private String state;
	private Date startdate;
	private Date enddate;
	
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

	
	public Date getStartdate() {
		return startdate;
	}
	public void setStartdate(Date startdate) {
		this.startdate = startdate;
	}
	public Date getEnddate() {
		return enddate;
	}
	public void setEnddate(Date enddate) {
		this.enddate = enddate;
	}
	@Override
	public String toString() {
		return "SpaceReviewPaginationDTO [page =" + page + ", sort =" + sort + ", state = "+state+"]";
	}

}
