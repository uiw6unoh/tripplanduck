package com.tripplan.duck.withduck.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.tripplan.duck.withduck.model.service.WithDuckService;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/withduck")
public class WithDuckController {
	
	@GetMapping("/withduck/list")
	public String login() {
		return "withduck/ListWithDuck";
	}
}
