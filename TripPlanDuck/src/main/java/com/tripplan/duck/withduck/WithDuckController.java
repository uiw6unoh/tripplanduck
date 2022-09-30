package com.tripplan.duck.withduck;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class WithDuckController {
	
	@GetMapping("/withduck/list")
	public String login() {
		return "withduck/WithDuckDetail";
	}
}
