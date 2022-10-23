package com.tripplan.duck.planner.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
		public String locatinList(Model model , HttpSession session,
				@RequestParam(name = "locationSelect" , defaultValue = "1") int locationSelect ) {
			
			Member member = (Member)session.getAttribute("loginMember");
			
			List<Location> loca = service.getLocationList();
			
			Location location = service.getLocation(locationSelect);
			
			List<Destination> destination= service.getDestination(locationSelect);			
			
			model.addAttribute("member", member);
			model.addAttribute("destination", destination);
			model.addAttribute("location",location);
			model.addAttribute("loca",loca);
			
			
			return "planner/myplanner";    //입력페이지
		}
		
		@RequestMapping("/myplannerAction")
		public String myplannerAction(
				@RequestParam("demo") String demo,
				@RequestParam("locationSelect") int locationSelect,
				@RequestParam("place") String place,
				@RequestParam("imagea") String imagea,
				@RequestParam("destNos") String destNos,
				@SessionAttribute("loginMember") Member loginMember) {
			
			MyPlanner myPlanner = new MyPlanner();
			
			myPlanner.setMNo(loginMember.getMemberNo());
			myPlanner.setLocationId(locationSelect);
			myPlanner.setDestNo(Integer.parseInt(destNos));
			myPlanner.setDemo(demo);
			service.insertPlanner(myPlanner);
			
			String[] arrayPlace = place.split(",");
			String[] arrayImage = imagea.split(",");
			
			// 마이플래너에 넣기
			
			for (int i = 0; i < arrayPlace.length; i++) {
				String imagea1 = arrayImage[i];
				String place1 = arrayPlace[i];
				// 디테일에 넣기
				service.detailInsert(imagea1, place1);
			}
			return "/planner/myplanner";  
		}
		
		
		
		@GetMapping("/searchDesti")
		public ModelAndView addDesti(ModelAndView model, @RequestParam("destSubject") String destSubject) {
			
			List<Destination> destination = service.addDestination();
			
			//model.addObject("destination", destination);
			model.setViewName("planner/myplanner");
			
			
			return model;
		}
			
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		
 }