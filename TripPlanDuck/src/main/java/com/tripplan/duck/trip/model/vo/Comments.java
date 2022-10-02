package com.tripplan.duck.trip.model.vo;

import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comments {
	int commentsId;
	
	int memberNo;
	
	String commentsWriterId;
	
	String commentsWriterPw;
	
	String commentsContent;
	
	int commentsRating;
	
	Date commentsCreateDate;
	
	Date commentsUpdateDate;
	
	String commentsIpAddress;
	
	int destNo;
}
