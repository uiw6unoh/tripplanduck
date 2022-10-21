package com.tripplan.duck.trip.model.service;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.trip.model.mapper.DestinationMapper;
import com.tripplan.duck.trip.model.vo.Comments;
import com.tripplan.duck.trip.model.vo.Destination;
import com.tripplan.duck.trip.model.vo.DestinationLike;

@Service
public class DestinationServiceImpl implements DestinationService {

	@Autowired
	private DestinationMapper destinationMapper;

	@Override
	public void insertData(Map<String, Object> param) {
		destinationMapper.insertData(param);
	}

	@Override
	public void updateCount(int destNo) {
		destinationMapper.updateCount(destNo);
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
	public List<Location> getLocations(Map<String, Object> params) {
		return destinationMapper.getLocations(params);
	}

	@Override
	public List<Location> getLocationsByName(Map<String, Object> params) {
		return destinationMapper.getLocationsByName(params);
	}

	@Override
	public List<Destination> getDestinationsByKeyWord(String keyword) {
		return destinationMapper.getDestinationsByKeyWord(keyword);
	}

	@Override
	public void insertLike(DestinationLike destinationLike) {
		destinationMapper.insertLike(destinationLike);
	}

	@Override
	public void deleteLike(DestinationLike destinationLike) {
		destinationMapper.deleteLike(destinationLike);
	}

	@Override
	public int isLike(DestinationLike destinationLike) {
		return destinationMapper.isLike(destinationLike);
	}

	@Override
	public void updateDestLike(DestinationLike destinationLike) {
		destinationMapper.updateDestLike(destinationLike);
	}

	@Override
	public void insertComment(Comments comments) {
		destinationMapper.insertComment(comments);
	}

	@Override
	public List<Comments> getDestinationComments(int destNo) {
		return destinationMapper.getDestinationComments(destNo);
	}

	@Override
	public void updateComment(Comments comments) {
		destinationMapper.updateComment(comments);
	}

	@Override
	public void deleteComment(int commentsId) {
		destinationMapper.deleteComment(commentsId);
	}

	@Override
	public void updateDestRating(Comments comments) {
		destinationMapper.updateDestRating(comments);
	}

}
