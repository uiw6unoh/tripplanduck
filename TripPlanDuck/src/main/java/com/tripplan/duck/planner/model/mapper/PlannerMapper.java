package com.tripplan.duck.planner.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.planner.model.vo.MyPlanner;
import com.tripplan.duck.trip.model.vo.Destination;


@Mapper
public interface PlannerMapper {
	
	List<Location> locationInsert();

	List<Destination> selectDest();

	List<Destination> addDest();
	
	public int plannerInsert(HashMap<String,String> hm );
}
