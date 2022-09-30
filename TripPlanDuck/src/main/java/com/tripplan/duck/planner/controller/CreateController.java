package com.tripplan.duck.planner.controller;

import java.io.IOException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.tripplan.duck.planner.model.mapper.LocationMapper;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller



    public class CreateController {
	
		@Autowired
		LocationMapper locationMapper; 
	
		@RequestMapping(value="/planner/create", method = RequestMethod.GET)
        public String create(Model model, HttpSession session) throws IllegalStateException, IOException {
			model.addAttribute("Location", locationMapper.createTrip());
			return "planner/create";
        }

    }