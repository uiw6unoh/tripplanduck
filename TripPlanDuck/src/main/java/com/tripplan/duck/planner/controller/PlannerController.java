package com.tripplan.duck.planner.controller;

import java.io.IOException;
import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.planner.model.mapper.PlannerMapper;
import com.tripplan.duck.planner.model.service.PlannerService;
import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.planner.model.vo.MyPlanner;
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
		
		@GetMapping("/myplanner")
		public String locatinList(Model model , HttpSession session) {
			
			Member member = (Member)session.getAttribute("loginMember");
			model.addAttribute("member", member);
			
			System.out.println("logined memger : " + member);
			
			
			
			List<Location> location;
			List<Destination> destination;			
			
			location = service.getLocationList();
			
			destination = service.getDestination();
			
			model.addAttribute("destination", destination);
			model.addAttribute("location",location);
			
			return "planner/myplanner";    //입력페이지
		}
		
		
		@RequestMapping("/myplannerAction")
		public String myplannerAction(
				@RequestParam("locationSelect") int locationSelect,
				@RequestParam("place") String place,
				@RequestParam("imagea") String imagea,
				@RequestParam("destNos") String destNos,
				@SessionAttribute("loginMember") Member loginMember) {
			
			MyPlanner myPlanner = new MyPlanner();
			
			
			myPlanner.setMNo(loginMember.getMemberNo());
			myPlanner.setLocationId(locationSelect);
			myPlanner.setDestNo(Integer.parseInt(destNos));
			
			String[] arrayPlace = place.split(",");
			String[] arrayImage = imagea.split(",");
			
			// 마이코스에 넣을 매퍼 만들기
			
			service.insertPlanner(myPlanner);
			
			for (int i = 0; i < arrayPlace.length; i++) {
				String imagea1 = arrayImage[i];
				String place1 = arrayPlace[i];
				// 디테일에 넣기
				service.detailInsert(imagea1, place1);
			}
			return "/planner/myplanner";  
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