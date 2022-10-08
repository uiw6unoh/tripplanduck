package com.tripplan.duck.planner.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.tripplan.duck.planner.model.mapper.LocationMapper;
import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.trip.model.vo.Destination;

import lombok.extern.log4j.Log4j;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@Controller

    public class CreateController {
		
		@Autowired
		LocationMapper locationMapper; 
	
		@RequestMapping(value="/planner/create", method = RequestMethod.GET)
        public String create(Model model, HttpSession session) throws IllegalStateException, IOException {
			model.addAttribute("location", locationMapper.locationAll());
			
			return "/planner/create";
        }

    }
