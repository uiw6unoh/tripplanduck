package com.tripplan.duck.report.model.vo;

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
	
	private String reportNoType;
	
	private int memberNo;
}
