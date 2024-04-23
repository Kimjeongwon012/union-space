package com.gd.uspace.space.dto;

public class SpaceReviewPaginationDTO {
	private int space_no;
	private int page;
	private String sort;
	public int getSpace_no() {
		return space_no;
	}
	public void setSpace_no(int space_no) {
		this.space_no = space_no;
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
	@Override
	public String toString() {
		return "SpaceReviewPaginationDTO [space_no=" + space_no + ", page=" + page + ", sort=" + sort + "]";
	}
}
