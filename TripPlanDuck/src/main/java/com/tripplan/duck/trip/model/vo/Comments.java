package com.tripplan.duck.trip.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Comments {
	private int commentsId;
	
	private int memberNo;
	
	private String memberImage;
	
	private String commentsWriterId;
	
	private String commentsContent;
	
	private int commentsRating;
	
	private String commentsCreateDate;
	
	private String commentsUpdateDate;
	
	private int destNo;
	
	private String destSubject;
	
	private String destCategory;
	
	private String commentsCreateDateSt;
	
	private String commentsUpdateDateSt;
}
