package com.tripplan.duck.planner.model.service;

import java.util.HashMap;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.planner.model.mapper.PlannerMapper;
import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.planner.model.vo.MyPlanner;
import com.tripplan.duck.trip.model.vo.Destination;


@Service
public class PlannerServiceImpl implements PlannerService {
	@Autowired
	PlannerMapper plannerMapper;

	@Override
	public List<Location> getLocationList() {
		
		return plannerMapper.locationInsert();
	}

	@Override
	public List<Destination> getDestination(int locationSelect) {
		
		
		return plannerMapper.selectDest(locationSelect);
	}

	@Override
	public List<Destination> addDestination() {
		
		return plannerMapper.addDest();
	}

	@Override
	public int detailInsert(String imagea, String place) {
		
		HashMap<String,String> hm = new HashMap<String,String>();
		hm.put("destImage", imagea);
		hm.put("place", place);
		
		int value = plannerMapper.detailInsert(hm);
		
		return value;
	}

	@Override
	
	 public void insertPlanner(MyPlanner myPlanner) {
		
		plannerMapper.insertPlanner(myPlanner);
	}

	@Override
	public Location getLocation(int locationSelect) {
		return plannerMapper.location(locationSelect);
	}

	

	

	
	
	
//	@Override
//	public Destination searchDestination(int locationId) {
//		
//		return mapper.searchDestination(locationId);
//	}
	
}
