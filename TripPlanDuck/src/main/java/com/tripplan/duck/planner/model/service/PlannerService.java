package com.tripplan.duck.planner.model.service;

import java.util.List;

import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.planner.model.vo.MyPlanner;
import com.tripplan.duck.trip.model.vo.Destination;

public interface PlannerService {

	
	List<Location> getLocationList();

	List<Destination> getDestination(int locationSelect);

	List<Destination> addDestination();
	
	public int detailInsert(
			String place1, 
			String imagea);

	void insertPlanner(MyPlanner myPlanner);

	Location getLocation(int locationSelect);
}
