package com.tripplan.duck.withduck.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WithDuckChat {
	private int chatNo;

	private int withNo;
	
	private String withCategory;
	
	private String chatTitle;
	
	private String chatTime;
	
	private String chatMemNick;
	
	private int withMemNo;
}
