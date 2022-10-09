package com.tripplan.duck.trip.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.trip.model.mapper.DestinationMapper;
import com.tripplan.duck.trip.model.vo.Destination;

@Service
public class DestinationServiceImpl implements DestinationService {

	@Autowired
	private DestinationMapper destinationMapper;

	@Override
	public void insertData(Map<String, Object> param) {
		destinationMapper.insertData(param);
	}

	@Override
	public String getCateogryName(int i) {
		return destinationMapper.getCategoryName(i);
	}

	@Override
	public Destination getDestination(int destNo) {
		return destinationMapper.getDestination(destNo);
	}

	@Override
	public List<Destination> getDestinationsByCategory(int destNo) {
		return destinationMapper.getDestinationsByCategory(destNo);
	}

	@Override
	public List<Destination> getDestinationsByLocationId(int locationId) {
		return destinationMapper.getDestinationsByLocationId(locationId);
	}

	@Override
	public Location getLocation(int locationId) {
		return destinationMapper.getLocation(locationId);
	}

	@Override
	public List<Location> getLocations(String string) {
		return destinationMapper.getLocations(string);
	}


}
