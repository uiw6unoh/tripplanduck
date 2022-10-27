package com.tripplan.duck.planner.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.trip.model.vo.Destination;
@Mapper
public interface LocationMapper {
	List<Location> locationAll();
	
	
	
	int insertDesti(Destination destination);


	Location selectLoca(int locationId);
	
}
