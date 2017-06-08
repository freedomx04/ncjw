package com.hongmeng.ncjw.service;

import java.util.List;

import com.hongmeng.ncjw.entity.ReportEntity;

public interface ReportService {
	
	ReportEntity findOne(Long reportId);
	
	void save(ReportEntity report);
	
	void delete(Long reportId);
	
	ReportEntity findBySearchCode(String searchCode);

	List<ReportEntity> list();
	
}
