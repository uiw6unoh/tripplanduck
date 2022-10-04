package com.tripplan.duck.withduck.controller;

import java.util.Arrays;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tripplan.duck.common.util.PageInfo;
import com.tripplan.duck.withduck.model.service.WithDuckService;
import com.tripplan.duck.withduck.model.vo.WithDuck;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/withduck")
public class WithDuckController {
	
	@Autowired
	private WithDuckService service;
	
	@GetMapping("/list")
	public ModelAndView withDuckList(ModelAndView model, 
							  @RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<WithDuck> list = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 8, service.getWithDuckCount(), 8);
		list = service.getWithDuckList(pageInfo);
		
		System.out.println(pageInfo +" " + list);
		
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("withduck/ListWithDuck");
		
		return model;
	}
	
	@GetMapping("/filter") 
	public ModelAndView withDuckFilter(ModelAndView model,
									   @RequestParam(value = "location_val") String location_val, 
									   @RequestParam(value = "gender_val") String gender_val,
									   @RequestParam(value = "age_val") String age_val,
									   @RequestParam(value = "page", defaultValue = "1") int page){
		List<WithDuck> listFilter = null;

		System.out.println(location_val);
		System.out.println(gender_val);
		System.out.println(age_val);
		
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 8, service.getWithDuckFilterCount(location_val, gender_val, age_val), 8);		
		listFilter = service.withDuckFilter(pageInfo, location_val, gender_val, age_val);
		
		System.out.println(listFilter);
		
		model.addObject("listFilter", listFilter);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("withduck/ListWithDuck");
		return model;
	}
}
