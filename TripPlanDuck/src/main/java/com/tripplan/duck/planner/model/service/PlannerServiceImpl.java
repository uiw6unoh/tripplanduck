package com.tripplan.duck.planner.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripplan.duck.planner.model.mapper.PlannerMapper;
import com.tripplan.duck.planner.model.vo.Location;
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
	public List<Destination> getDestination() {
		
		
		return plannerMapper.selectDest();
	}
	
	
//	@Override
//	public Destination searchDestination(int locationId) {
//		
//		return mapper.searchDestination(locationId);
//	}
	
}
