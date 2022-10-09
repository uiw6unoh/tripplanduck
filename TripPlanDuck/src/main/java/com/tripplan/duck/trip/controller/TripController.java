package com.tripplan.duck.trip.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.trip.model.service.DestinationService;
import com.tripplan.duck.trip.model.vo.Destination;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/trip")
public class TripController {
	
//	@Autowired
//	private TripService service;
	
	@Autowired
	private DestinationService destinationService;
	
	@GetMapping("/main")
	public ModelAndView TripMain(ModelAndView model, @RequestParam(value="sort", required = false)String sort){
		
		String order = "DEST_LIKE_SUM";
		
		if(sort == null)
			sort = "4";
		
		switch(sort){
			case "1":
				order = "DEST_RATING_AVG";
				break;
			case "2":
				order = "DEST_CATEGORY";
				break;
			case "3":
				order = "DEST_CATEGORY DESC";
				break;
			default:
				break;
		}
		
		List<Location> list = destinationService.getLocations(order);
		
		model.addObject("list", list);
		model.setViewName("trip/TripMain");
		
		return model;
	}
	
	@GetMapping("/detail")
	public ModelAndView TripDetail(ModelAndView model, @RequestParam(value="destNo")int destNo) {
		
		Destination dest = destinationService.getDestination(destNo);
		List<Destination> destnations = destinationService.getDestinationsByCategory(destNo);
		
		System.out.println(destnations);
		
		model.addObject("dest", dest);
		model.addObject("destnations", destnations);
		model.setViewName("trip/TripDetail");
		
		System.out.println(dest);
		
		return model;
	}
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView model, @RequestParam(value="locationId")int locationId) {
		
		Location location = destinationService.getLocation(locationId);
		
		List<Destination> destinations = destinationService.getDestinationsByLocationId(locationId);

		model.addObject("location", location);
		model.addObject("destinations", destinations);
		model.setViewName("trip/TripPlace");
		
		return model;
	}
	

}
