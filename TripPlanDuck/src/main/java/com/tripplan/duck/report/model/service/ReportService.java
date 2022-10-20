package com.tripplan.duck.report.model.service;

import com.tripplan.duck.report.model.vo.Report;
import com.tripplan.duck.trip.model.vo.Comments;

public interface ReportService {

	int isReported(String reportCategory, String reportNoType);

	Comments getComments(String reportNoType);

	void updateReportCount(Report report);

	void insertCommentReport(Report report);

	Report getReportComments(String reportNoType);



}
