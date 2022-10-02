package com.tripplan.duck.trip.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class TripController {
	@GetMapping("/trip/main")
	public String tripMain() {
		return "trip/TripMain";
	}
	
	@GetMapping("/trip/detail")
	public String TripDetail() {
		return "trip/TripDetail";
	}
	
	@GetMapping("/trip/list")
	public String login() {
		return "trip/TripPlace";
	}
}
