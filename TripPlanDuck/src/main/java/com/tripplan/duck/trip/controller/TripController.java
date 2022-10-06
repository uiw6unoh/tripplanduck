package com.tripplan.duck.trip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/trip")
public class TripController {
	
//	@Autowired
//	private TripService service;
	
	@GetMapping("/main")
	public String TripMain() {
		
		return "trip/TripMain";
	}
	
	@GetMapping("/detail")
	public String TripDetail() {
		return "trip/TripDetail";
	}
	
	@GetMapping("/list")
	public String list() {
		return "trip/TripPlace";
	}
	
	
	

}
