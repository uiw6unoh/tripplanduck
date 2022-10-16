package com.tripplan.duck.trip.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class DestinationLike {
	int destNo;
	
	int memberNo;
	
	int like;
}
