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
import org.springframework.web.bind.annotation.ResponseBody;
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
		public String locatinList(Model model) {
			
			List<Location> location;
			List<Destination> destination;			
			
			location = service.getLocationList();
			System.out.println("location"+location);
			
			destination = service.getDestination();
			System.out.println("destination"+destination);
			
			model.addAttribute("destination", destination);
			model.addAttribute("location",location);
		//	model.setViewName("planner/myplanner");
		//	return model;
			
			return "planner/myplanner";    //입력페이지
		}
		
		
		@RequestMapping("/myplannerAction")
		public String myplannerAction(
				@RequestParam("demo") String demo,
				@RequestParam("locationSelect") String locationSelect,
				@RequestParam("place") String place,
				@RequestParam("destImage") String destImage
				) {
			
//			System.out.println("넘어오는 demo값은"+demo);	
//			System.out.println("넘어오는 locationSelect값은"+locationSelect);	
//			System.out.println("넘어는 오는 place값"+ place);
//			System.out.println("넘어오는 페이지");
			
//			String[] arrayPlace = place.split(",");
//			for(int i = 0; i<arrayPlace.length;i++) {
//				System.out.println("구분된 제목은?"+arrayPlace[i]);
//				
//			}
			
			
			
			int value = service.plannerInsert(demo, locationSelect, destImage, place);
			
			String path="";
			if (value ==1) {
				System.out.println("입력이 되었음");
				path= "planner/myplanner";
			}else {
				System.out.println("입력이 안되었음");
				path="planner/myplanner";
			}
			
			
			return path;   //일단 다시 넘기는 페이지로
		}
		
		
		
		@GetMapping("/addDesti")
		public @ResponseBody List<Destination> addDesti(ModelAndView model) {
			List<Destination> destination;
			destination = service.addDestination();
			model.addObject("destination", destination);
			model.setViewName("planner/myplanner");
			return destination;
		}
			
		
//		@PostMapping("/myplanner")
//			public ModelAndView routePlanner(ModelAndView model) {
//				return model;
//			}
//		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
 }