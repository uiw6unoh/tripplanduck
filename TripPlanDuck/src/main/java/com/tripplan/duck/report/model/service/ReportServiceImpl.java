package com.tripplan.duck.report.model.service;


import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.tripplan.duck.report.model.mapper.ReportMapper;
import com.tripplan.duck.report.model.vo.Report;
import com.tripplan.duck.trip.model.vo.Comments;
import com.tripplan.duck.withduck.model.vo.WithDuck;

@Service
public class ReportServiceImpl implements ReportService {

	@Autowired
	private ReportMapper reportMapper;

	@Override
	public int isReported(String reportCategory, String reportNoType) {
		return reportMapper.selectCommentReport(reportCategory, reportNoType);
	}

	@Override
	public Comments getComments(String reportNoType) {
		return reportMapper.getComments(reportNoType);
	}

	@Override
	@Transactional
	public void updateReportCount(Report report) {
		reportMapper.updateReportCount(report);
	}

	@Override
	@Transactional
	public void insertCommentReport(Report report) {
		reportMapper.insertCommentReport(report);
	}

	@Override
	public Report getReportComments(String reportNoType) {
		return reportMapper.getReportComments(reportNoType);
	}

	@Override
	public int selectWithDuckReport(String reportCategory, int reportNoType) {
		return reportMapper.selectWithDuckReport(reportCategory, reportNoType);
	}

	@Override
	public WithDuck getWithDuck(int reportNoType) {
		return reportMapper.getWithDuck(reportNoType);
	}

	@Override
	@Transactional
	public void insertWithDuckReport(Report report) {
		reportMapper.insertWithDuckReport(report);
	}

	@Override
	public Report getReportWithDuck(String reportNoType) {
		
		return reportMapper.getReportWithDuck(reportNoType);
	}





}
