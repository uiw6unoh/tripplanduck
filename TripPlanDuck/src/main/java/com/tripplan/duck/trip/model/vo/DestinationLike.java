package com.tripplan.duck.trip.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DestinationLike {
	private int destNo;
	
	private int memberNo;
	
	private int like;
}
