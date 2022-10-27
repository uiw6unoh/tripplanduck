package com.tripplan.duck.trip.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.planner.model.mapper.LocationMapper;
import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.trip.model.service.DestinationService;
import com.tripplan.duck.trip.model.vo.Comments;
import com.tripplan.duck.trip.model.vo.Destination;
import com.tripplan.duck.trip.model.vo.DestinationLike;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/trip")
public class TripController {
		
	@Autowired
	private DestinationService destinationService;
	
	@Autowired
	LocationMapper locationMapper; 
	
	@GetMapping("/main")
	public ModelAndView TripMain(ModelAndView model,
								@RequestParam(value = "sort_name", defaultValue = "추천순") String sort_name,
								@RequestParam(value="sort", required = false)String sort,
								@RequestParam(value="page", defaultValue = "0")int limit){
		
		String order = "DEST_RATING_AVG";
		List<Location> list = new ArrayList<Location>();    
		
		Map<String, Object> params = new HashMap<String, Object>();
		params.put("order", order);
		params.put("limit", limit);
		
		if(sort == null)
			sort = "4";
		
		switch(sort){
			case "1":
				params.put("order", "DEST_LIKE_SUM");
				sort_name = "인기순";
				list = destinationService.getLocations(params);
				break;
			case "2":
				params.put("order", "LOCATION");
				sort_name = "오름차순";
				list = destinationService.getLocationsByName(params);
				break;
			case "3":
				params.put("order", "LOCATION DESC");
				sort_name = "내림차순";
				list = destinationService.getLocationsByName(params);
				break;
			default:
				sort_name = "추천순";
				list = destinationService.getLocations(params);
				break;
		}
		
		model.addObject("sort_name", sort_name);
		model.addObject("list", list);
		model.setViewName("trip/TripMain");
		
		return model;
	}
	
	@GetMapping("/detail")
	public ModelAndView TripDetail(ModelAndView model, @RequestParam(value="destNo")int destNo,
			HttpSession session) {
		
		Destination dest = destinationService.getDestination(destNo);
		destinationService.updateCount(destNo);
		List<Destination> destnations = destinationService.getDestinationsByCategory(destNo);
		List<Comments> comments = destinationService.getDestinationComments(destNo);
		
		System.out.println("comments : " + comments);
		int isLike = 0;
		
		Member member = (Member)session.getAttribute("loginMember");
		
		System.out.println(member);
		
		if(member != null) {
			DestinationLike destinationLike = new DestinationLike();
			destinationLike.setDestNo(destNo);
			destinationLike.setMemberNo(member.getMemberNo());
			isLike = destinationService.isLike(destinationLike);
			
			model.addObject("member", member);

		}
		model.addObject("isLike", isLike);
		model.addObject("comments", comments);
		model.addObject("dest", dest);
		model.addObject("destnations", destnations);
		model.setViewName("trip/TripDetail");
		
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
	
	@GetMapping("/search")
	public ModelAndView list(ModelAndView model, @RequestParam("keyword")String keyword) {
		
		
		List<Destination> destinations = destinationService.getDestinationsByKeyWord(keyword);
		
		model.addObject("destinations", destinations);
		model.addObject("keyword", keyword);
		model.setViewName("trip/TripSearch");
		
		return model;
	}
}