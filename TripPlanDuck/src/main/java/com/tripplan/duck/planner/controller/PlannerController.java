package com.tripplan.duck.planner.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.tripplan.duck.planner.model.mapper.LocationMapper;
import com.tripplan.duck.planner.model.mapper.PlannerMapper;
import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.planner.model.vo.MyPlanner;
@Controller
@RequestMapping("/planner")
public class PlannerController {
	
		@Autowired
		PlannerMapper plannerMapper; 
		
		// 페이지 요청하고 Location 정보 받아옴
		@GetMapping("/myplanner")
		public String MyPlannerLocation(Model model, HttpSession session
    		 ,HttpServletRequest request) throws IllegalStateException, IOException {
			model.addAttribute("location", plannerMapper.locationInsert());
			
			return "/planner/myplanner";
     }

		
		
		
		
		
		
		
		
		
		
		
		
 }