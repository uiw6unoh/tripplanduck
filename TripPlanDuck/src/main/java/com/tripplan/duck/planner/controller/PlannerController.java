package com.tripplan.duck.planner.controller;

import java.util.Iterator;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.cglib.transform.impl.AddDelegateTransformer;
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
		public ModelAndView locatinList(ModelAndView model , HttpSession session,
				@RequestParam(name = "locationSelect" , defaultValue = "1") int locationSelect ) {
			Member loginMember = (Member)session.getAttribute("loginMember");
			if(loginMember == null ) {
				model.addObject("msg", "로그인 후 이용이 가능합니다.");
				model.addObject("location", "/member/login");
				model.setViewName("member/msg");
			}else {
				
				List<Location> loca = service.getLocationList();
				
				Location location = service.getLocation(locationSelect);
				
				List<Destination> destination= service.getDestination(locationSelect);			
				
				model.addObject("loginMember", loginMember);
				model.addObject("destination", destination);
				model.addObject("location",location);
				model.addObject("loca",loca);
				model.setViewName("planner/myplanner");
			}
			return model;
			
		}
		
		@RequestMapping("/myplannerAction")
		public ModelAndView myplannerAction(
				ModelAndView model,
				@RequestParam("demo") String demo,
				@RequestParam("locationSelect") int locationSelect,
				@RequestParam(value="place", required= false) String place,
				@RequestParam(value="imagea", required= false) String imagea,
				@SessionAttribute("loginMember") Member loginMember) {
			MyPlanner myPlanner = new MyPlanner();
			
			myPlanner.setMNo(loginMember.getMemberNo());
			myPlanner.setLocationId(locationSelect);
			myPlanner.setDemo(demo);
			
			
			String[] arrayPlace = place.split(",");
			String[] arrayImage = imagea.split(",");
			// 마이플래너에 넣기
			
			if(arrayPlace.length <= 1) {
				model.addObject("msg", "여행지를 두군데 이상 선택해주세요");
				model.addObject("location", "/planner/myplanner");
				
			}else {
				service.insertPlanner(myPlanner);
				// 마이플래너에 넣기
				for (int i = 0; i < arrayPlace.length; i++) {
					String place1 = arrayPlace[i];
					String imagea1 = arrayImage[i];
					// 디테일에 넣기
					service.detailInsert(imagea1, place1);
					
				}
				model.addObject("msg", "여행지 등록이 완료되었습니다.");
				model.addObject("location", "/mypage?select=planner");
				
				
			}
				model.setViewName("member/msg");
				
				return model;
	
		}
		
 }