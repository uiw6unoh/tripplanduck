package com.tripplan.duck.report.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tripplan.duck.report.model.service.ReportService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/report")
public class ReportController {
		
	@Autowired
	private ReportService reportService;
	
	@GetMapping("/review")
	public ModelAndView TripMain(ModelAndView model
										){
		
		
		return model;
	}
	
	
}