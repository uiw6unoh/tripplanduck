package com.tripplan.duck.withduck.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.ResourceLoader;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.tripplan.duck.common.util.MultipartFileUtil;
import com.tripplan.duck.common.util.PageInfo;
import com.tripplan.duck.member.model.vo.Member;
import com.tripplan.duck.withduck.model.service.WithDuckService;
import com.tripplan.duck.withduck.model.vo.WithDuck;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/withduck")
public class WithDuckController {
	
	@Autowired
	private WithDuckService service;
	
	@Autowired
	private ResourceLoader resourceLoader;
	/////////////////////////////////////////////////위드덕 리스트////////////////////////////////////////////////////////////////////////
	@GetMapping("/list")
	public ModelAndView withDuckList(ModelAndView model,
							  @RequestParam(value = "sort_name", defaultValue = "최신순") String sort_name,
							  @RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<WithDuck> list = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 8, service.getWithDuckCount(), 8);
		list = service.getWithDuckList(pageInfo);
		
		System.out.println(pageInfo +" " + list);
		
		model.addObject("sort_name", sort_name);
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("withduck/ListWithDuck");
		
		return model;
	}
	
	@GetMapping("/filter") 
	public ModelAndView withDuckFilter(ModelAndView model,
									   @RequestParam(value = "sort_name", defaultValue = "최신순") String sort_name,
									   @RequestParam(value = "location_val") String location_val , 
									   @RequestParam(value = "gender_val") String gender_val,
									   @RequestParam(value = "age_val") String age_val,
									   @RequestParam(value = "start_val") String start_val,
									   @RequestParam(value = "end_val") String end_val,
									   @RequestParam(value = "personnel_val") int personnel_val,
									   @RequestParam(value = "page", defaultValue = "1") int page){
		List<WithDuck> listFilter = null;
		List<Object> filter_val = new ArrayList<Object>();
		
		System.out.println(location_val);
		System.out.println(gender_val);
		System.out.println(age_val);
		System.out.println(start_val);
		System.out.println(end_val);
		System.out.println(personnel_val);
		
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 8, service.getWithDuckFilterCount(location_val, gender_val, age_val, start_val, end_val, personnel_val), 8);		
		listFilter = service.withDuckFilter(pageInfo, location_val, gender_val, age_val, start_val, end_val, personnel_val);
		
		System.out.println(listFilter);
		
		filter_val.add(location_val);
		filter_val.add(gender_val);
		filter_val.add(age_val);
		filter_val.add(start_val);
		filter_val.add(end_val);
		filter_val.add(personnel_val);
		filter_val.add(page);
		
		System.out.println("asdfasdfsadf : " + filter_val);
		
		model.addObject("sort_name", sort_name);
		model.addObject("filter_val", filter_val);
		model.addObject("listFilter", listFilter);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("withduck/ListWithDuck");
		return model;
	}
	
	@GetMapping("/sortfilter")
	public ModelAndView withDuckReadcountSort(ModelAndView model,
									   @RequestParam(value = "sort_name", defaultValue = "최신순") String sort_name,
									   @RequestParam(value = "location_val") String location_val, 
									   @RequestParam(value = "gender_val") String gender_val,
									   @RequestParam(value = "age_val") String age_val,
									   @RequestParam(value = "start_val") String start_val,
									   @RequestParam(value = "end_val") String end_val,
									   @RequestParam(value = "personnel_val") int personnel_val,
									   @RequestParam(value = "page", defaultValue = "1") int page ) {
		
		List<WithDuck> listFilter = null;
		List<Object> filter_val = new ArrayList<Object>();
		
		System.out.println(location_val);
		System.out.println(gender_val);
		System.out.println(age_val);
		System.out.println(start_val);
		System.out.println(end_val);
		System.out.println(personnel_val);
		
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 8, service.getWithDuckFilterCount(location_val, gender_val, age_val, start_val, end_val, personnel_val), 8);		
		listFilter = service.withDuckReadcountSort(pageInfo, location_val, gender_val, age_val, start_val, end_val, personnel_val);
		
		System.out.println(listFilter);
		
		filter_val.add(location_val);
		filter_val.add(gender_val);
		filter_val.add(age_val);
		filter_val.add(start_val);
		filter_val.add(end_val);
		filter_val.add(personnel_val);
		filter_val.add(page);
		
		model.addObject("sort_name", sort_name);
		model.addObject("filter_val", filter_val);
		model.addObject("listFilter", listFilter);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("withduck/ListWithDuck");
		return model;
	}
	
	@GetMapping("/sortList")
	public ModelAndView withDuckListSort(ModelAndView model,
										 @RequestParam(value = "sort_name", defaultValue = "최신순") String sort_name,
										 @RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<WithDuck> list = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 8, service.getWithDuckCount(), 8);
		list = service.getWithDuckListReadCount(pageInfo);
		
		System.out.println(pageInfo +" " + list);
		
		model.addObject("sort_name", sort_name);
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("withduck/ListWithDuck");
		
		return model;
	}
	
	@GetMapping("/joinFilter")
	public ModelAndView withDuckJoinList(ModelAndView model, 
							  @RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<WithDuck> list = null;
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 8, service.getWithDuckJoinCount(), 8);
		list = service.getWithDuckJoinList(pageInfo);
		
		System.out.println(pageInfo +" " + list);
		
		
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("withduck/ListWithDuck");
		
		return model;
	}
	
	@GetMapping("/joinValFilter")
	public ModelAndView withDuckJoinValList(ModelAndView model,
									   @RequestParam(value = "location_val") String location_val, 
									   @RequestParam(value = "gender_val") String gender_val,
									   @RequestParam(value = "age_val") String age_val,
									   @RequestParam(value = "start_val") String start_val,
									   @RequestParam(value = "end_val") String end_val,
									   @RequestParam(value = "personnel_val") int personnel_val,
									   @RequestParam(value = "page", defaultValue = "1") int page ) {
		
		List<WithDuck> listFilter = null;
		List<Object> filter_val = new ArrayList<Object>();
		
		System.out.println(location_val);
		System.out.println(gender_val);
		System.out.println(age_val);
		System.out.println(start_val);
		System.out.println(end_val);
		System.out.println(personnel_val);
		
		PageInfo pageInfo = null;
		
		pageInfo = new PageInfo(page, 8, service.getWithDuckJoinValCount(location_val, gender_val, age_val, start_val, end_val, personnel_val), 8);		
		listFilter = service.getWithDuckJoinValList(pageInfo, location_val, gender_val, age_val, start_val, end_val, personnel_val);
		
		System.out.println(listFilter);
		
		filter_val.add(location_val);
		filter_val.add(gender_val);
		filter_val.add(age_val);
		filter_val.add(start_val);
		filter_val.add(end_val);
		filter_val.add(personnel_val);
		filter_val.add(page);
		
		model.addObject("filter_val", filter_val);
		model.addObject("listFilter", listFilter);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("withduck/ListWithDuck");
		return model;
	}
	
	///////////////////////////////////////////////////위드덕 생성////////////////////////////////////////////////////////////
	
	@GetMapping("/create")
	public ModelAndView createPage(ModelAndView model, HttpSession session) {
		Member loginMember = (Member) session.getAttribute("loginMember");
		
		if(loginMember == null) {
			model.addObject("msg", "로그인 후 이용이 가능합니다.");
			model.addObject("location", "/member/login");
			model.setViewName("member/msg");
		} else {
			model.addObject("loginMember", loginMember);
			model.setViewName("withduck/CreateWithDuck");
		}
		
		return model;
	}
	
	@PostMapping("/create")
	public ModelAndView createWithDuck(ModelAndView model,
									   @ModelAttribute WithDuck withDuck, 
									   @RequestParam(value = "file1", required = false) MultipartFile file1,
									   @RequestParam(value = "file2", required = false) MultipartFile file2,
									   @RequestParam(value = "file3", required = false) MultipartFile file3,
									   @SessionAttribute("loginMember") Member loginMember) {
		int result = 0;
		
		System.out.println(withDuck + "\n" + file1.getOriginalFilename() + "\n" + file2.getOriginalFilename() + " ");
		
		
		// 1. 파일을 업로드 했는지 확인 후 파일을 저장
		if((file1 != null && !file1.isEmpty()) || (file2 != null && !file2.isEmpty()) || (file3 != null && !file3.isEmpty()) ) {
			// 파일을 저장하는 로직 작성
			String location = null;
			String renamedFileName1 = null;
			String renamedFileName2 = null;
			String renamedFileName3 = null;
			
			try {
				location = resourceLoader.getResource("resources/upload/withduck").getFile().getAbsolutePath();
				renamedFileName1 = MultipartFileUtil.save(file1, location);
				renamedFileName2 = MultipartFileUtil.save(file2, location);
				renamedFileName3 = MultipartFileUtil.save(file3, location);
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			if(renamedFileName1 != null || renamedFileName1 != null || renamedFileName1 != null) {
				withDuck.setWithOriginFileName(file1.getOriginalFilename() + ", " + file2.getOriginalFilename() + ", " + file3.getOriginalFilename());
				withDuck.setWithRenameFileName(renamedFileName1 + ", " + renamedFileName2 + ", " + renamedFileName3);
			}
			
		}
		
		System.out.println(loginMember.getMemberNickname());
		
		// 2. 작성한 게시글 데이터를 데이터 베이스에 저장
		withDuck.setWithWriterNo(loginMember.getMemberNo());
		withDuck.setWithWriterNick(loginMember.getMemberNickname());
		result = service.createWithDuck(withDuck);
		
		if(result > 0) {
			model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
			model.addObject("location", "/main");
		} else {
			model.addObject("msg", "게시글 등록을 실패하였습니다.");
			model.addObject("location", "/main");
		}
		
		model.setViewName("/main");
		
		return model;
	}
	
	
}
