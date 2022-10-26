package com.tripplan.duck.withduck.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
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
import com.tripplan.duck.withduck.model.service.WithDuckChatService;
import com.tripplan.duck.withduck.model.service.WithDuckService;
import com.tripplan.duck.withduck.model.vo.WithDuck;
import com.tripplan.duck.withduck.model.vo.WithDuckChat;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
@RequestMapping("/withduck")
public class WithDuckController {
	
	@Autowired
	private WithDuckService service;
	
	@Autowired
	private WithDuckChatService chatService;
	
	@Autowired
	private ResourceLoader resourceLoader;
	/////////////////////////////////////////////////위드덕 리스트////////////////////////////////////////////////////////////////////////
	@GetMapping("/list")
	public ModelAndView withDuckList(ModelAndView model,
							  HttpSession session,
							  @RequestParam(value = "sort_name", defaultValue = "최신순") String sort_name,
							  @RequestParam(value = "page", defaultValue = "1") int page) {
		
		List<WithDuck> list = null;
		PageInfo pageInfo = null;
		pageInfo = new PageInfo(page, 8, service.getWithDuckCount(), 8);
		list = service.getWithDuckList(pageInfo);
		for(int i = 0; i < list.size(); i++) {
			if(list.get(i).getWithContent() != null) {
				list.get(i).setWithContent(list.get(i).getWithContent().replaceAll("<p>", ""));
				list.get(i).setWithContent(list.get(i).getWithContent().replaceAll("</p>", ""));
				
				System.out.println(list.get(i).getWithContent());
			} 
			
			

			if(list.get(i).getWithOriginFileName() == null) continue;
			String[] arr = new String[3];
			
			arr = list.get(i).getWithRenameFileName().split(", ");
			list.get(i).setReList(Arrays.asList(arr));
			System.out.println(list.get(i) + "\n");
			
		}
		
		System.out.println(pageInfo +" " + list);
		
		//session.removeAttribute("joinStatus");
		model.addObject("sort_name", sort_name);
		model.addObject("list", list);
		model.addObject("pageInfo", pageInfo);
		model.setViewName("withduck/ListWithDuck");
		
		return model;
	}
	
	
	@GetMapping("/joinValFilter")
	public ModelAndView withDuckJoinValList(ModelAndView model,
									   @RequestParam(value = "location_val", required=false) String location_val, 
									   @RequestParam(value = "gender_val", required=false) String gender_val,
									   @RequestParam(value = "age_val", required=false) String age_val,
									   @RequestParam(value = "start_val", required=false) String start_val,
									   @RequestParam(value = "end_val", required=false) String end_val,
									   @RequestParam(value = "personnel_val", defaultValue = "0") int personnel_val,
									   @RequestParam(value = "joinStatus", required=false) String joinStatus,
									   @RequestParam(value = "sort_name", defaultValue = "최신순") String sort_name,
									   @RequestParam(value = "keywordSearch") String keywordSearch,
									   @RequestParam(value = "page", defaultValue = "1") int page ) {
		
		List<WithDuck> listFilter = null;
		List<Object> filter_val = new ArrayList<Object>();
		PageInfo pageInfo = null;
		
		System.out.println(location_val);
		System.out.println(gender_val);
		System.out.println(age_val);
		System.out.println(start_val);
		System.out.println(end_val);
		System.out.println(personnel_val);
		System.out.println(joinStatus);
		System.out.println(sort_name);
		System.out.println(keywordSearch);
		
		
		pageInfo = new PageInfo(page, 8, service.getWithDuckJoinValCount(location_val, gender_val, age_val, start_val, end_val, personnel_val, joinStatus, sort_name, keywordSearch), 8);		
		listFilter = service.getWithDuckJoinValList(pageInfo, location_val, gender_val, age_val, start_val, end_val, personnel_val, joinStatus, sort_name, keywordSearch);
		
		System.out.println("listFilter : " + listFilter);
		for(int i = 0; i < listFilter.size(); i++) {
			if(listFilter.get(i).getWithOriginFileName() == null) continue;
			String[] arr = new String[3];
			
			arr = listFilter.get(i).getWithRenameFileName().split(", ");
			listFilter.get(i).setReList(Arrays.asList(arr));
			System.out.println(listFilter.get(i) + "\n");
		}
		
		if(listFilter.size() != 0 && (keywordSearch != null || !keywordSearch.isEmpty())) {
			model.addObject("keywordSearch", keywordSearch);
		}
		
		System.out.println(listFilter);
		
		filter_val.add(location_val);
		filter_val.add(gender_val);
		filter_val.add(age_val);
		filter_val.add(start_val);
		filter_val.add(end_val);
		filter_val.add(personnel_val);
		filter_val.add(page);
		
		model.addObject("sort_name", sort_name);
		model.addObject("joinStatus", joinStatus);
		model.addObject("filter_val", filter_val);
		model.addObject("list", listFilter);
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
									   @RequestParam(value = "keyword0", required =false) String keyword0,
									   @RequestParam(value = "keyword1", required =false) String keyword1,
									   @RequestParam(value = "keyword2", required =false) String keyword2,
									   @SessionAttribute("loginMember") Member loginMember) {
		int result = 0;
		String keyword = "";
		System.out.println("asdfasdf : " + withDuck);
		if(withDuck.getWithLocation() == "" || withDuck.getWithGender() == "" || withDuck.getWithAge() == "" || withDuck.getWithPersonner() == 0) {
			model.addObject("msg", "필터를 모두 선택해주십시오.");
			model.addObject("location", "/withduck/create");
			
			model.setViewName("member/msg");
		} else {
			
			List<String> keyList = new ArrayList<String>();
			if (keyword0 != null) {
				keyword0 = keyword0.substring(0, keyword0.indexOf("X")-1);
				keyList.add(keyword0);
				keyword += keyList.get(0) + ", ";
			}
			if(keyword1 != null) {
				keyword1 = keyword1.substring(0, keyword1.indexOf("X")-1);
				keyList.add(keyword1);
				keyword += keyList.get(1) + ", ";
			}
			if(keyword2 != null) {
				keyword2 = keyword2.substring(0, keyword2.indexOf("X")-1);
				keyList.add(keyword2);
				keyword += keyList.get(2) + ", ";
			}
			if(keyList.size() != 0) {
			withDuck.setWithkeyword(keyword);
			}
			
			
			// 1. 파일을 업로드 했는지 확인 후 파일을 저장
			// 파일을 저장하는 로직 작성
			String location = null;
			String renamedFileName = "";
			List<MultipartFile> list = new ArrayList<MultipartFile>();
			System.out.println("생성 날짜확인 : " + withDuck.getWithStartDate());
			System.out.println(list);
			
			list.add(file1);
			list.add(file2);
			list.add(file3);
			
			System.out.println("시작전 list : " + list);
			
			
			for(int i = 0; i < list.size(); i++) {
				if(list.get(i).isEmpty()) {
					list.remove(list.get(i));
					i=-1;
					System.out.println(list + " " + i);
				}
			}
			
			System.out.println("list : " + list);
			if(list.size()!=0) {
				try {
					location = resourceLoader.getResource("resources/upload/withduck").getFile().getAbsolutePath();
					for(int i = 0; i < list.size(); i++) {
						renamedFileName += MultipartFileUtil.save(list.get(i), location) + ", ";
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				for(int i = 0; i < list.size(); i++) {
					withDuck.setWithOriginFileName(list.get(i).getOriginalFilename() + ", ");
					withDuck.setWithRenameFileName(renamedFileName);
				}
			}
			
			System.out.println(loginMember.getMemberNickname());
			
			// 2. 작성한 게시글 데이터를 데이터 베이스에 저장
			withDuck.setWithWriterNo(loginMember.getMemberNo());
			withDuck.setWithWriterNick(loginMember.getMemberNickname());
			withDuck.setWithWriterAge(loginMember.getMemberAge());
			withDuck.setWithWriterGender(loginMember.getMemberGender());
			
			int result2 = 0;
			
			result = service.createWithDuck(withDuck);
			System.out.println("withNo : " + withDuck);
			result2 = chatService.createChat(withDuck.getWithNo(), withDuck.getWithTitle(), withDuck.getWithWriterNick(), withDuck.getWithWriterNo());
			
			if(result > 0 && result2 > 0) {
				model.addObject("msg", "게시글이 정상적으로 등록되었습니다.");
				model.addObject("location", "/withduck/list");
			} else {
				model.addObject("msg", "게시글 등록을 실패하였습니다.");
				model.addObject("location", "/withduck/create");
			}
			
			model.setViewName("member/msg");
		}
		
		
		
		return model;
	}
	
	///////////////////////////////////////////////////위드덕 상세페이지////////////////////////////////////////////////////////////
	@GetMapping("/detail")
	public ModelAndView detailWithDuck(ModelAndView model,
									   @RequestParam(value = "withNo") int withNo,
									   HttpServletRequest request,
									   HttpServletResponse response,
									   HttpSession session) {
		WithDuck withDuck = null;
		String[] arr = null;
		
		Member member = (Member)session.getAttribute("loginMember");
		
		Cookie[] cookies = request.getCookies();
    	String boardHistory = ""; // 조회한 게시글 번호를 저장하는 변수
    	boolean hasRead = false; // 읽은 글이면 true, 안 읽었으면 false
    	
    	if(cookies != null) {
    		String name = null;
    		String value = null;
    		for (Cookie cookie : cookies) {
				name = cookie.getName();
				value = cookie.getValue();
				
				// boardHistroy인 쿠키 값을 찾기
				if(name.equals("boardHistory")) {
					boardHistory = value;
					
					if(value.contains("|" + withNo + "|")) {
						hasRead = true;
						
						break;
					}
				}
			}
    	}
    	// 2. 읽지 않은 게시글이면 cookie 에 기록
    	if(!hasRead) {
        	Cookie cookie = new Cookie("boardHistory", boardHistory + "|" + withNo + "|");
        	
        	cookie.setMaxAge(-1); // 브라우저 종료 시 삭제
        	response.addCookie(cookie);
    	}
    	withDuck = service.detailWithDuck(withNo);
		
		if(withDuck.getWithkeyword() != null) {
			List<String> keyList = new ArrayList<String>();
			String[] arr1 = withDuck.getWithkeyword().split(", ");
			keyList.addAll(Arrays.asList(arr1));
			System.out.println("keyList : " + keyList );
			model.addObject("keyList", keyList);
		}
		
		service.withDuckReadCount(withNo, hasRead);
		
		System.out.println("위드덕 위드 넘버로 조회 : " + withDuck);
		System.out.println("디테일 날짜확인 : " + withDuck.getWithStartDate());
		
		if(withDuck.getWithRenameFileName() != null) {
			arr = withDuck.getWithRenameFileName().split(", ");
			List<String> list = new ArrayList<String>();
			list = Arrays.asList(arr);

			for(int i = 0; i < list.size(); i++) {
					if(list.get(i).isEmpty()) {
						list.remove(list.get(i));
						i=-1;
						System.out.println(list + " " + i);
					}
				}
			
			withDuck.setReList(list);
		}
		int result = 0;
		boolean joinBool = false;
		if(member != null) {
			result = service.countChatMem(withNo, member.getMemberNo());
			List<WithDuckChat> totalperson = chatService.selectjoinChatList(withNo);
			System.out.println("totalperson : " + totalperson);
			if(result == 0) {
				joinBool = true;
			}
		}
		System.out.println("countChatMem : " + result );
		System.out.println(withNo);
		System.out.println("상세페이지 : " + withDuck);
		System.out.println(request.getAttribute("withDuck"));
		
		session.setAttribute("member", member);
		model.addObject("joinStatus", withDuck.getWithJoinStatus());
		model.addObject("joinBool", joinBool);
		model.addObject("withDuck", withDuck);
		model.setViewName("withduck/WithDuckDetail");
		return model;
	}
	
	/////////////////////////////////////////////////위드덕 수정 //////////////////////////////////////////////////////////////////
	
	@GetMapping("/update")
	public ModelAndView updateWithDuck(ModelAndView model,
									   @ModelAttribute WithDuck withDuck,
									   @RequestParam(value = "file1", required = false) String file1,
									   @RequestParam(value = "file2", required = false) String file2,
									   @RequestParam(value = "file3", required = false) String file3) {
		List<String> list = new ArrayList<String>();
		System.out.println(withDuck);
		String[] arr = new String[3];
		
		arr[0] = file1;
		arr[1] = file2;
		arr[2] = file3;
		
		System.out.println("시작전 list : " + Arrays.toString(arr));
		System.out.println("업데이트 날짜확인 : " + withDuck.getWithStartDate());
		System.out.println(withDuck);
		for(int i = 0; i < arr.length; i++) {
			if(arr[i] == null) {
				continue;
			} else if(arr[i] != null) {
				list.add(arr[i]);
			}
		}
		
		model.addObject("photoList", list);
		model.addObject("withDuck", withDuck);
		model.setViewName("withduck/UpdateWithDuck");
		
		return model;
	}
	
	@PostMapping("/update")
	public ModelAndView updateWithDuckGo(ModelAndView model,
										 @ModelAttribute WithDuck withDuck, 
										 @RequestParam(value = "file1", required = false) MultipartFile file1,
										 @RequestParam(value = "file2", required = false) MultipartFile file2,
										 @RequestParam(value = "file3", required = false) MultipartFile file3,
										 @RequestParam(value = "keyword0", required =false) String keyword0,
										 @RequestParam(value = "keyword1", required =false) String keyword1,
										 @RequestParam(value = "keyword2", required =false) String keyword2,
										 @SessionAttribute("loginMember") Member loginMember) {
		int result = 0;
		String keyword = "";
			System.out.println("keyword0 : " + keyword0);
			List<String> keyList = new ArrayList<String>();
			if (keyword0 != null) {
				keyword0 = keyword0.substring(0, keyword0.indexOf("X")-1);
				keyList.add(keyword0);
				keyword += keyList.get(0) + ", ";
			}
			if(keyword1 != null) {
				keyword1 = keyword1.substring(0, keyword1.indexOf("X")-1);
				keyList.add(keyword1);
				keyword += keyList.get(1) + ", ";
			}
			if(keyword2 != null) {
				keyword2 = keyword2.substring(0, keyword2.indexOf("X")-1);
				keyList.add(keyword2);
				keyword += keyList.get(2) + ", ";
			}
			if(keyList.size() != 0) {
				withDuck.setWithkeyword(keyword);
			}
			// 1. 파일을 업로드 했는지 확인 후 파일을 저장
			// 파일을 저장하는 로직 작성
			String location = null;
			String renamedFileName = "";
			List<MultipartFile> list = new ArrayList<MultipartFile>();
			System.out.println("생성 날짜확인 : " + withDuck.getWithStartDate());
			System.out.println(list);
			
			list.add(file1);
			list.add(file2);
			list.add(file3);
			
			for(int i = 0; i < list.size(); i++) {
				if(list.get(i).isEmpty()) {
					list.remove(list.get(i));
					i=-1;
					System.out.println(list + " " + i);
				}
			}
			
			if(list.size()!=0) {
				try {
					location = resourceLoader.getResource("resources/upload/withduck").getFile().getAbsolutePath();
					for(int i = 0; i < list.size(); i++) {
						renamedFileName += MultipartFileUtil.save(list.get(i), location) + ", ";
					}
				} catch (IOException e) {
					e.printStackTrace();
				}
				
				for(int i = 0; i < list.size(); i++) {
					withDuck.setWithOriginFileName(list.get(i).getOriginalFilename() + ", ");
					withDuck.setWithRenameFileName(renamedFileName);
				}
			}
			System.out.println("keyword :" + withDuck.getWithkeyword());
			// 2. 작성한 게시글 데이터를 데이터 베이스에 저장
			result = service.updateGoWithDuck(withDuck);
			
			if(result > 0) {
				model.addObject("msg", "게시글이 정상적으로 수정되었습니다.");
				model.addObject("location", "/withduck/list");
			} else {
				model.addObject("msg", "게시글 수정을 실패하였습니다.");
				model.addObject("location", "/withduck/update");
			}
			
			model.setViewName("member/msg");
		
		return model;
	}
	
	@GetMapping("/delete")
	public ModelAndView deleteWithDuck(ModelAndView model,
									   @RequestParam(value = "withNo") int withNo) {
		int result = 0;
		
		result = service.deleteWithDuck(withNo);
		
		if(result > 0) {
			model.addObject("msg", "게시글 삭제에 성공하였습니다.");
			model.addObject("location", "/withduck/list");
		} else {
			model.addObject("msg", "게시글 삭제에 실패였습니다.");
			model.addObject("location", "/withduck/detail");
		}
		model.setViewName("member/msg");
		return model;
		
	}
}
