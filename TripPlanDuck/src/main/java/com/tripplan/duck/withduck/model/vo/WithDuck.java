package com.tripplan.duck.withduck.model.vo;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WithDuck {
	private int withNo;
	
	private int withMemNo;
	
	private String withWriterNick;
	
	private String withLocation;
	
	private String withGender;
	
	private String withAge;
	
	private int withPersonner;
	
	private String withStatus;
	
	private String withStartDate;
	
	private String withEndDate;
	
	private String withOriginFileName;

	private String withRenameFileName;
	
	private String withTitle;
	
	private String withContent;
	
	private String withkeyword;
	
	private int withReadCount;
	
	private String createDate;
	
	private String updateDate;
}
