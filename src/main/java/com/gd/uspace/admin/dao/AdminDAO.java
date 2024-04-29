package com.gd.uspace.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gd.uspace.admin.dto.AdminDTO;

public interface AdminDAO {

	List<AdminDTO> adminQna_list();

	List<AdminDTO> selectAdminQna(Map<String, String> params);

	List<AdminDTO> adminMain_list();

	List<AdminDTO> selectAdminMain(Map<String, String> params);

	List<AdminDTO> adminSpaceReview_list();

	List<AdminDTO> adminSpaceReviewSerch(Map<String, String> params);

	boolean saveAnswer(String answer, String questionNo);

	int adminSpaceReviewTotalCount();

	int getAdminSpaceReviewCount(Map<String, String> params);

}
