package com.tripplan.duck.admin.controller;

import java.util.List;

import com.tripplan.duck.common.util.PageInfo;
import com.tripplan.duck.member.model.vo.Member;

public interface AdminService {

	int getMemberCount();

	List<Member> getMemberList(PageInfo pageInfo);

}
