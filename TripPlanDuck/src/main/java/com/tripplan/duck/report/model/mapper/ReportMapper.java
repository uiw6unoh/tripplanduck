package com.tripplan.duck.report.model.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.tripplan.duck.report.model.vo.Report;
import com.tripplan.duck.trip.model.vo.Comments;
import com.tripplan.duck.withduck.model.vo.WithDuck;

@Mapper
public interface ReportMapper {
	
	int selectCommentReport(@Param("reportCategory")String reportCategory, @Param("reportNoType") String reportNoType);

	Comments getComments(String reportNoType);

	void updateReportCount(Report report);

	void insertCommentReport(Report report);

	Report getReportComments(String reportNoType);

	int selectWithDuckReport(@Param("reportCategory")String reportCategory, @Param("reportNoType") int reportNoType);

	WithDuck getWithDuck(int reportNoType);

	void insertWithDuckReport(Report report);

	Report getReportWithDuck(String reportNoType);

}
