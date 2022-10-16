package com.tripplan.duck.trip.model.service;

import java.util.List;
import java.util.Map;

import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.trip.model.vo.Destination;
import com.tripplan.duck.trip.model.vo.DestinationLike;


public interface DestinationService {

	void insertData(Map<String, Object> param);
	
	void updateCount(int destNo);

	String getCateogryName(int i);

	Destination getDestination(int destNo);

	List<Destination> getDestinationsByCategory(int destNo);

	List<Destination> getDestinationsByLocationId(int locationId);

	Location getLocation(int locationId);

	List<Location> getLocations(String string);

	List<Location> getLocationsByName(String order);

	List<Destination> getDestinationsByKeyWord(String keyword);

	void insertLike(DestinationLike destinationLike);

	void deleteLike(DestinationLike destinationLike);

	int isLike(DestinationLike destinationLike);

}
