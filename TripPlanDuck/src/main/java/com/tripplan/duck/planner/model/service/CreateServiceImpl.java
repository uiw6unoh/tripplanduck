package com.tripplan.duck.planner.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripplan.duck.planner.model.mapper.LocationMapper;
import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.trip.model.vo.Destination;
@Service
public class CreateServiceImpl implements CreateService {

	@Autowired
	private LocationMapper mapper;
	
	@Override
	public int save(Destination destination) {
		
		return mapper.insertDesti(destination);
	}

	@Override
	public Location selectLoca(int locationId) {
		
		return mapper.selectLoca(locationId);
	}

	@Override
	public List<Location> locationAll() {
		
		
		return mapper.locationAll();
	}

}
