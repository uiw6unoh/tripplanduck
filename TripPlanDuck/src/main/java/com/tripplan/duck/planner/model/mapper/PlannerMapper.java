package com.tripplan.duck.planner.model.mapper;

import java.util.List;

import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.planner.model.vo.MyPlanner;

public interface PlannerMapper {
	List<Location> locationInsert();
	
}
