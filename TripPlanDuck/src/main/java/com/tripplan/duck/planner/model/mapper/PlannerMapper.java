package com.tripplan.duck.planner.model.mapper;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.planner.model.vo.MyPlanner;
import com.tripplan.duck.trip.model.vo.Destination;


@Mapper
public interface PlannerMapper {
	

	List<Destination> selectDest(int locationSelect);

	List<Location> locationInsert();
	
	List<Destination> addDest();

	public int detailInsert(HashMap<String,String> hm);
	
	public void insertPlanner(MyPlanner myPlanner);

	Location location(int locationSelect);

}
