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

	int destNo;				// 여행지번호
	
	String destCategory;	// 여행지카테고리
	
	String destSubject;		// 여행지제목
	
	String destSummary;		// 여행지요약정보
	
	String destContent;		// 여행지내용
	
	String destAddress;		// 여행지주소
	
	double destMapX; 		// 여행지X좌표
	
	double destMapY;		// 여행지Y좌표
	
	int destLikeSum;		// 좋아요합
	
	int destRatingAvg; 		// 별점평균
	
	int destHit;			// 조회수
	
	Date destCreateDate;	// 등록일
	
	Date destUpdateDate;	// 수정일
	
	int locationId;			// 지역번호
	
	String destImage;		// 여행지사진
	
	private List<Location> loca;
}
