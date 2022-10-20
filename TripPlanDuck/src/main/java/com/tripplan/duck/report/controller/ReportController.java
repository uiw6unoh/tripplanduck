package com.tripplan.duck.report.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.ModelAndView;

import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.report.model.service.ReportService;
import com.tripplan.duck.report.model.vo.Report;
import com.tripplan.duck.trip.model.vo.Comments;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@RestController
@RequestMapping("/report")
public class ReportController {
		
	@Autowired
	private ReportService reportService;
	
	@PostMapping("/review")
	public int reportComments(HttpSession session,
								@RequestBody Report report) throws Exception {
		
		Member member = (Member)session.getAttribute("loginMember");
		
		if(member == null)
			return 0;
		
		int isReport = reportService.isReported(report.getReportCategory(), report.getReportNoType());
		Comments comments = reportService.getComments(report.getReportNoType());
		
		report.setReportMemberNo(comments.getMemberNo());
		report.setMemberNo(member.getMemberNo());
		
		System.out.println("comments: "+comments);
		System.out.println("report :" + report);
		
		if (isReport > 0) {
			report = reportService.getReportComments(report.getReportNoType());
			reportService.updateReportCount(report);
		} else {
			reportService.insertCommentReport(report);
			
		}
		
		return 1;
	}
}