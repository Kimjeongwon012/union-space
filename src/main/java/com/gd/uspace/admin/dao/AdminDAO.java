package com.gd.uspace.admin.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.gd.uspace.admin.dto.AdminDTO;

public interface AdminDAO {

	List<AdminDTO> adminQna_list();

	List<AdminDTO> selectAdminQna(Map<String, String> params);

}
