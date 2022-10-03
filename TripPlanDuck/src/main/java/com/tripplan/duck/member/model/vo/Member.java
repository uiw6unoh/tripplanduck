package com.tripplan.duck.member.model.vo;

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
	
	private String memberName;
	
	private String memberNickname;
	
	private String memberEmail;
	
	private char memberType;
	
	private char memberWarning;
	
	private char memberStatus;
	
	private char memberGender;
	
	private int memberAge;
	
}
