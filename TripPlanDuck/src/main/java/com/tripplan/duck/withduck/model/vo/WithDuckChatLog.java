package com.tripplan.duck.withduck.model.vo;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class WithDuckChatLog {
	private int chatContentNo;
	
	private int chatMemNo;
	
	private String chatMemNickName;
	
	private String chatContent;
	
	private String chatTime;
	
	private int chatWithNo;
}
