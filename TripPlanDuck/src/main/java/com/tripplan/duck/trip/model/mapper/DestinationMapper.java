package com.tripplan.duck.trip.model.mapper;


import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface DestinationMapper {

	void insertData(Map<String, Object> param);

	String getCategoryName(int i);

}
