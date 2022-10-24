package com.tripplan.duck.member.model.mapper;

import java.sql.Date;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import com.tripplan.duck.member.model.vo.Member;

@Mapper
public interface MemberMapper {

	Member selectMemberById(@Param("memberId") String memberId);

	Member selectMemberByNickname(@Param("memberNickname") String memberNickname);
	
	int insertMember(Member member);
	
	String findMemberId(@Param("memberEmail") String memberEmail);

	int updateMemberPassword(Member member);


	 // 카카오 회원가입 관련
    void kakaoInsert(Member member);
    
//    Member read(String memberId);

    //snsId로 회원정보얻기
    Member kakaoSelect(String memberSnsId);

    //snsId로 회원 아이디찾기
    String findUserIdBy2(String memberSnsId);
    
    // 자동로그인
    void keepLogin(String MemberId, String sessionId, Date sessionLimit) throws Exception;
    
    // 세션키 검증
    Member checkUserWithSessionKey(String value) throws Exception;
    

    
}