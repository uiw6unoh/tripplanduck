package com.tripplan.duck.planner.model.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyPlanner {
	private int pNo;
	
	private String pPlace;
	
	private String pStartDate;
	
	private String pEndDate;
	
	// 굳이 있어야 하나 의문??
	private Date lt;
	
	private String pMapX;
	
	private String pMapY;
	
	private int pLike;
	
	private String status;
	
	private String pType;
	
	private int destNo;
	
	private int mNo;
	
	private int locationId;
	
	// 생각 좀 해보자
	public long Dateminus () {
		String a = this.pStartDate;
		String b = this.pEndDate;
		long result=0L;
		
	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		
		Date start;
		Date end;
		try {
			start = format.parse(a);
			end = format.parse(b);
			
			long minus = end.getTime() - start.getTime();
			
			result = minus / ( 24*60*60*1000);

			long  minusResult = Math.abs(result);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return minusResult;
	}
}



