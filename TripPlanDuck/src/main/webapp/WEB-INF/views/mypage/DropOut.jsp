<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!-- DropOut CSS -->
<link rel="stylesheet" type="text/css" href="${ path }/css/mypage/DropOut.css">

<jsp:include page="../common/header.jsp"/>

<body>
	<!-- 회원 탈퇴 -->
    <!-- 전체 컨테이너 -->
    <div class="p-5 container">
      <div class="dropoutInfo">
        <div class="h-dropout pt-5 pb-1">
          <h3 style="color: #808080;">탈퇴 안내</h3>
        </div>
      <div class="top-container mt-1 mb-5">
        <div class="dropout">
          <p><b>회원 탈퇴일로부터 계정과 닉네임을 포함한 계정 정보(아이디/이메일/닉네임)는 '개인 정보 보호 정책'에 따라 60일간 보관(잠김) 되며, 60일이 경과된 후에는 모든 개인 정보는
            완전히
            삭제되며 더 이상 복구할 수 없게 됩니다.</b></p>
        <b>탈퇴 후에도 게시판형 서비스에 등록한 게시물은 그대로 남아 있습니다.</b>
        <p>플래너, 위드덕, 여행지 등에 올린 게시글 및 댓글은 탈퇴 시 자동 삭제되지 않고 그대로 남아 있습니다.
          삭제를 원하는 게시글이 있다면 반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.
          탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.</p>
            </div>
          </div>
      </div>
      <div class="dropReason">
          <div class="h-dropout">
            <h3 style="color: #808080;">탈퇴 사유</h3>
          </div>
          <div class="p-2 top-container">
            <form action="${path}/mypage/dropout" method="post" class="reason-dropout top-container" style="padding-bottom: 34px">
              <div class="dropout reason-dropout">
                <div class="form-check form-check-inline" id="dropoutOption">
                  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1"
                    value="option1">
                  <label class="form-check-label" for="inlineRadio1">사이트 이용 불편</label>
                </div>
                <div class="form-check form-check-inline" id="dropoutOption">
                  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2"
                    value="option2">
                  <label class="form-check-label" for="inlineRadio2">이용빈도 낮음</label>
                </div>
                <div class="form-check form-check-inline" id="dropoutOption">
                  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3"
                    value="option3">
                  <label class="form-check-label" for="inlineRadio2">개인정보 유출 우려</label>
                </div>
                <div class="form-check form-check-inline" id="dropoutOption">
                  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio4"
                    value="option4">
                  <label class="form-check-label" for="inlineRadio2">아이디 변경 / 재가입 목적</label>
                </div>
                <div class="form-check form-check-inline" id="dropoutOption">
                  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio5"
                    value="option5">
                  <label class="form-check-label" for="inlineRadio2">컨텐츠 등 이용할 만한 서비스 부족</label>
                </div>
                <div class="form-check form-check-inline" id="dropoutOption">
                  <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio6"
                    value="option6">
                  <label class="form-check-label" for="inlineRadio2">이용빈도 낮음</label>
                </div>
              </div>
            </div>
          <div class="memberOutBtn pt-3">
            <button type="submit" id="dropout" class="btn btn-secondary">탈퇴</button>
            <button type="button" class="btn btn-warning" onclick="location.href='${path}/mypage/updateform'">취소</button>
          </div>
        </form>
      </div>
    </div>
	
	<jsp:include page="../common/footer.jsp"/>  