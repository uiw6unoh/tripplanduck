package com.tripplan.duck.planner.model.service;

import java.util.List;

import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.planner.model.vo.MyPlanner;
import com.tripplan.duck.trip.model.vo.Destination;

public interface CreateService {

	int save(Destination destination);

	Location selectLoca(int locationId);

	List<Location> locationAll();

}
