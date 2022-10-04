package com.tripplan.duck.planner.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tripplan.duck.planner.model.mapper.PlannerMapper;
import com.tripplan.duck.planner.model.service.PlannerService;
import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.trip.model.vo.Destination;

import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller
@RequestMapping("/planner")
public class PlannerController {
	
		@Autowired
		PlannerMapper plannerMapper; 
		
		@Autowired
		private PlannerService service;
		// 페이지 요청하고 Location 정보 받아옴
//		@GetMapping("/myplanner")
//		public String MyPlannerLocation(Model model, HttpSession session
//    		 ,HttpServletRequest request) throws IllegalStateException, IOException {
//			model.addAttribute("location", plannerMapper.locationInsert());
//			
//			return "/planner/myplanner";
//     }
		
		@GetMapping("/myplanner")
		public ModelAndView locatinList(ModelAndView model) {
			
			List<Location> location;
			List<Destination> destination;			
			
			location = service.getLocationList();
			destination = service.getDestination();
			
			
			
			
			
			model.addObject("destination", destination);
			model.addObject("location",location);
			model.setViewName("planner/myplanner");
			return model;
		}
		
		@GetMapping("/addDesti")
		public  ModelAndView addDesti(ModelAndView model ) {
			List<Destination> destination;
			destination = service.addDestination();
			destination = service.getDestination();
			model.addObject("destination", destination);
			model.setViewName("planner/myplanner");
			return model;
		}
			
		
//		@PostMapping("/myplanner")
//			public ModelAndView routePlanner(ModelAndView model) {
//				return model;
//			}
//		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
 }