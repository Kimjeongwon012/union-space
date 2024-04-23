package com.gd.uspace.admin.dao;

import java.util.HashMap;
import java.util.List;

import com.gd.uspace.admin.dto.AdminDTO;

public interface AdminDAO {

	List<AdminDTO> adminQna_list(HashMap data);

}
