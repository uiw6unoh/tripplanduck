package com.tripplan.duck.trip.model.service;


import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripplan.duck.trip.model.mapper.DestinationMapper;

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
	

}
