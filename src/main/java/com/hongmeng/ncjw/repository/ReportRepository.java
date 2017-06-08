package com.hongmeng.ncjw.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.hongmeng.ncjw.entity.ReportEntity;

public interface ReportRepository extends CrudRepository<ReportEntity, Long> {

	ReportEntity findBySearchCode(String searchCode);
	
	List<ReportEntity> findAllByOrderByCreateTimeDesc();
	
}
