package com.tripplan.duck.member.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Member {

	private int memberNo;
	
	private String memberId;
	
	private String memberPassword;
	
	private String memberNickname;
	
	private String memberEmail;
	
	private char memberType;
	
	private char memberWarning;
	
	private char memberStatus;
	
	private String memberGender;
	
	private String memberAge;
	
	private String memberSnsId;
	
	private String sessionId;
	
	private Date sessionLimit;

	public boolean isUseCookie;
	
}
