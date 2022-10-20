package com.tripplan.duck.report.model.service;

import com.tripplan.duck.report.model.vo.Report;
import com.tripplan.duck.trip.model.vo.Comments;
import com.tripplan.duck.withduck.model.vo.WithDuck;

public interface ReportService {

	int isReported(String reportCategory, String reportNoType);

	Comments getComments(String reportNoType);

	void updateReportCount(Report report);

	void insertCommentReport(Report report);

	Report getReportComments(String reportNoType);

	int selectWithDuckReport(String reportCategory, int reportNoType);

	WithDuck getWithDuck(int reportNoType);

	void insertWithDuckReport(Report report);

	Report getReportWithDuck(String reportNoType);



}
