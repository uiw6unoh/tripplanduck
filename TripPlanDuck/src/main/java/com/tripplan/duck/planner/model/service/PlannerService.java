package com.tripplan.duck.planner.model.service;

import java.util.List;

import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.trip.model.vo.Destination;

public interface PlannerService {

	List<Location> getLocationList();

	List<Destination> getDestination();
	
}
