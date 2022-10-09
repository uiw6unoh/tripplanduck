package com.tripplan.duck.trip.model.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.trip.model.vo.Destination;

@Mapper
public interface DestinationMapper {

	void insertData(Map<String, Object> param);

	String getCategoryName(int i);

	List<Destination> getDestinations(String order);

	Destination getDestination(int destNo);

	List<Destination> getDestinationsByCategory(int destNo);

	List<Destination> getDestinationsByLocationId(int locationId);

	Location getLocation(int locationId);

	List<Location> getLocations(String string);

	List<Location> getLocationsByName(String order);

}
