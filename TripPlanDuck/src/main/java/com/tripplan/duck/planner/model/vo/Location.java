package com.tripplan.duck.planner.model.vo;


import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Location {
	
	private int locationId;
	
	private String location;
	
	private double lcenterx;
	
	private double lcentery;
	
	private String locationImage;
	
	private String locationTitle;
	
}
