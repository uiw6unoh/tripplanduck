package com.tripplan.duck.trip.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Destination {
	int destNo;
	
	String destCategory;
	
	String destSubject;
	
	String destSummary;
	
	String destContent;
	
	String destAddress;
	
	int destMapX;
	
	int destMapY;
	
	int destLikeSum;
	
	int destRatingAvg;
	
	int destHit;
	
	Date destCreateDate;
	
	Date destUpdateDate;
	
	int locationId;
	
}
