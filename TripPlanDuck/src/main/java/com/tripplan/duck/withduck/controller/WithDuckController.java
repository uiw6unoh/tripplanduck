package com.tripplan.duck.withduck.controller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.JavaType;
import com.fasterxml.jackson.databind.type.TypeFactory;
import com.fasterxml.jackson.databind.util.Converter;
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
									   @RequestParam(value = "location_val") String location_val , 
									   @RequestParam(value = "gender_val") String gender_val,
									   @RequestParam(value = "age_val") String age_val,
									   @RequestParam(value = "start_val") String start_val,
									   @RequestParam(value = "end_val") String end_val,
									   @RequestParam(value = "personnel_val") int personnel_val,
									   @RequestParam(value = "page", defaultValue = "1") int page){
		List<WithDuck> listFilter = null;
		
		System.out.println(location_val);
		System.out.println(gender_val);
		System.out.println(age_val);
		System.out.println(start_val);
		System.out.println(end_val);
		System.out.println(personnel_val);
		
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 8, service.getWithDuckFilterCount(location_val, gender_val, age_val, start_val, end_val, personnel_val), 8);		
		listFilter = service.withDuckFilter(pageInfo, location_val, gender_val, age_val, start_val, end_val, personnel_val);
		
		System.out.println(listFilter);
		
		model.addObject("listFilter", listFilter);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("withduck/ListWithDuck");
		return model;
	}
	
	@GetMapping("/create")
	public String create() {
		return ("withduck/CreateWithDuck");
	}
	
	@GetMapping("/sort")
	public ModelAndView withDuckReadcountSort(ModelAndView model,
									   @RequestParam(value = "location_val") String location_val, 
									   @RequestParam(value = "gender_val") String gender_val,
									   @RequestParam(value = "age_val") String age_val,
									   @RequestParam(value = "start_val") String start_val,
									   @RequestParam(value = "end_val") String end_val,
									   @RequestParam(value = "personnel_val") int personnel_val,
									   @RequestParam(value = "page", defaultValue = "1") int page ) {
		
		List<WithDuck> listFilter = null;
		
		System.out.println(location_val);
		System.out.println(gender_val);
		System.out.println(age_val);
		System.out.println(start_val);
		System.out.println(end_val);
		System.out.println(personnel_val);
		
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 8, service.getWithDuckFilterCount(location_val, gender_val, age_val, start_val, end_val, personnel_val), 8);		
		listFilter = service.withDuckReadcountSort(pageInfo, location_val, gender_val, age_val, start_val, end_val, personnel_val);
		
		System.out.println(listFilter);
		
		model.addObject("listFilter", listFilter);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("withduck/ListWithDuck");
		return model;
	}
}
