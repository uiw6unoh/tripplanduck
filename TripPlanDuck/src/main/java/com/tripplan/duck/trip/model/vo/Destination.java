package com.tripplan.duck.trip.model.vo;

import java.util.Date;
import java.util.List;

import com.tripplan.duck.planner.model.vo.Location;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Destination {

	private int destNo;				// 여행지번호
	
	private String destCategory;	// 여행지카테고리
	
	private String destSubject;		// 여행지제목
	
	private String destSummary;		// 여행지요약정보
	
	private String destContent;		// 여행지내용
	
	private String destAddress;		// 여행지주소
	
	private double destMapX; 		// 여행지X좌표
	
	private double destMapY;		// 여행지Y좌표
	
	private int destHit;			// 조회수
	
	private Date destCreateDate;	// 등록일
	
	private Date destUpdateDate;	// 수정일
	
	private int locationId;			// 지역번호
	
	private String destImage;		// 여행지사진
	
	private int destLikeSum;		// 좋아요합

	private int destRatingAvg;		// 별점평균
	
	private List<Location> loca;
}
