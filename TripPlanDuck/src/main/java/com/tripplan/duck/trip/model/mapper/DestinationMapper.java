package com.tripplan.duck.trip.model.mapper;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.tripplan.duck.planner.model.vo.Location;
import com.tripplan.duck.trip.model.vo.Comments;
import com.tripplan.duck.trip.model.vo.Destination;
import com.tripplan.duck.trip.model.vo.DestinationLike;

@Mapper
public interface DestinationMapper {

	void insertData(Map<String, Object> param);
	
	void updateCount(int destNo);

	String getCategoryName(int i);

	List<Destination> getDestinations(String order);

	Destination getDestination(int destNo);

	List<Destination> getDestinationsByCategory(int destNo);

	List<Destination> getDestinationsByLocationId(int locationId);

	Location getLocation(int locationId);

	List<Location> getLocations(Map<String, Object> params);

	List<Location> getLocationsByName(Map<String, Object> params);

	List<Destination> getDestinationsByKeyWord(String keyword);

	void insertLike(DestinationLike destinationLike);

	void deleteLike(DestinationLike destinationLike);

	int isLike(DestinationLike destinationLike);

	void updateDestLike(DestinationLike destinationLike);

	void insertComment(Comments comments);

	List<Comments> getDestinationComments(int destNo);

	void updateComment(Comments comments);

	void deleteComment(int commentsId);

	void updateDestRating(Comments comments);

}
