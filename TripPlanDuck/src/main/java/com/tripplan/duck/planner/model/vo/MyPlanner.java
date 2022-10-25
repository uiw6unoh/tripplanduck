package com.tripplan.duck.planner.model.vo;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.swing.ListModel;

import com.tripplan.duck.member.model.vo.Member;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;


@Data
@NoArgsConstructor
@AllArgsConstructor
public class MyPlanner {
	private int pNo;
	
	private int mNo;
	
	private int locationId;
	
	private List<Location> loca;
	
	private String demo;
	
	private Location loc; 
	
	private String route;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	// 생각 좀 해보자
//	public long Dateminus () {
//		String a = this.pStartDate;
//		String b = this.pEndDate;
//		long result=0L;
//		
//	    SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
//		
//		Date start;
//		Date end;
//		try {
//			start = format.parse(a);
//			end = format.parse(b);
//			
//			long minus = end.getTime() - start.getTime();
//			
//			result = minus / ( 24*60*60*1000);
//
//			long  minusResult = Math.abs(result);
//		} catch (ParseException e) {
//			e.printStackTrace();
//		}
//		return minusResult;
//	}
}



