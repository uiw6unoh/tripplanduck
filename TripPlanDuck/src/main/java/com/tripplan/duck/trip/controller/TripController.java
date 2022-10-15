package com.tripplan.duck.trip.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

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
		
	@Autowired
	private DestinationService destinationService;
	
	@GetMapping("/main")
	public ModelAndView TripMain(ModelAndView model,
								@RequestParam(value = "sort_name", defaultValue = "추천순") String sort_name,
								@RequestParam(value="sort", required = false)String sort){
		
		String order = "DEST_LIKE_SUM";
		List<Location> list = new ArrayList<Location>();                                       
		
		if(sort == null)
			sort = "4";
		
		switch(sort){
			case "1":
				order = "DEST_RATING_AVG";
				sort_name = "인기순";
				list = destinationService.getLocations(order);
				break;
			case "2":
				order = "LOCATION";
				sort_name = "오름차순";
				list = destinationService.getLocationsByName(order);
				break;
			case "3":
				order = "LOCATION DESC";
				sort_name = "내림차순";
				list = destinationService.getLocationsByName(order);
				break;
			default:
				sort_name = "추천순";
				list = destinationService.getLocations(order);
				break;
		}
		
		model.addObject("sort_name", sort_name);
		model.addObject("list", list);
		model.setViewName("trip/TripMain");
		
		return model;
	}
	
	@GetMapping("/detail")
	public ModelAndView TripDetail(ModelAndView model, @RequestParam(value="destNo")int destNo) {
		
		Destination dest = destinationService.getDestination(destNo);
		destinationService.updateCount(destNo);
		List<Destination> destnations = destinationService.getDestinationsByCategory(destNo);
		
		model.addObject("dest", dest);
		model.addObject("destnations", destnations);
		model.setViewName("trip/TripDetail");
		
		return model;
	}
	
	@GetMapping("/list")
	public ModelAndView list(ModelAndView model, @RequestParam(value="locationId")int locationId,
											 @RequestParam(value="keyword", required = false)String keyword) {
		
		Map<String, Object> param = new HashMap<String, Object>();
		param.put("locationId", locationId);
		param.put("keyword", keyword);
		
		
		Location location = destinationService.getLocation(locationId);
		List<Destination> destinations = destinationService.getDestinationsByLocationId(locationId);

		model.addObject("location", location);
		model.addObject("destinations", destinations);
		model.setViewName("trip/TripPlace");
		
		return model;
	}
	
	@GetMapping("/search")
	public ModelAndView list(ModelAndView model ) {
		
		model.setViewName("trip/TripSearch");
		
		return model;
	}
}
