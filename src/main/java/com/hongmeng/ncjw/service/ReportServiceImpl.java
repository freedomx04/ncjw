package com.hongmeng.ncjw.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.hongmeng.ncjw.entity.ReportEntity;
import com.hongmeng.ncjw.repository.ReportRepository;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	ReportRepository reportRepository;

	@Override
	public ReportEntity findOne(Long reportId) {
		return reportRepository.findOne(reportId);
	}

	@Override
	public void save(ReportEntity report) {
		reportRepository.save(report);
	}

	@Override
	public void delete(Long reportId) {
		reportRepository.delete(reportId);
	}

	@Override
	public ReportEntity findBySearchCode(String searchCode) {
		return reportRepository.findBySearchCode(searchCode);
	}

	@Override
	public List<ReportEntity> list() {
		return (List<ReportEntity>) reportRepository.findAllByOrderByCreateTimeDesc();
	}

}