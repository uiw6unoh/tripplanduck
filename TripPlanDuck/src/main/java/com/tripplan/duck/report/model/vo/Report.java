package com.tripplan.duck.report.model.vo;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Report {
	private int reportId;
	
	private String reportCategory;
	
	private int reportMemberNo;
	
	private String reportCreateDate;
	
	private int reportCount;
	
	private String reportType;
	
	private int reportNoType;
	
	private int memberNo;
}
