<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

	<jsp:include page="../common/header.jsp"/>
	
	<!-- UpdateForm CSS -->
	<link rel="stylesheet" type="text/css" href="${ path }/css/mypage/UpdateForm.css">
<body>
	<!-- 회원 정보 수정 -->
	<!-- 전체 컨테이너 -->
	<div class="container">
	<main class="form-signup m-auto">
		<div>
		<div class="updateFormInfo pt-3">
			<h1>회원 정보 수정</h1>
			<img class="mb-4" src="${ path }/images/common/프사.png" alt="">
		</div>
		<form>
			<table class="signup">
				<tr>
					<td class="title">아이디</td>
				</tr>
				<tr>
					<td>
						<input class="form-control" type="text" placeholder="아이디" readonly>
					</td>
              	</tr> 
              	<tr>
                	<td class="title">닉네임</td>
              	</tr>
              	<tr>
                	<td>
                  		<input type="text" class="form-control" id="nickname" placeholder="닉네임" required>
                	</td>
                	<td><button class="form-control">중복확인</button></td>
              	</tr> 
              	<tr>
                	<td class="title">비밀번호변경</td>
              	</tr>
              	<tr>               
                	<td>
                  		<input type="text" class="form-control" id="password" placeholder="비밀번호" required>
                	</td>
              	</tr>
              	<tr>
                	<td class="title">비밀번호 재입력</td>
              	</tr>
              	<tr>
                	<td>
                  		<input type="text" class="form-control" id="confirm_password" placeholder="비밀번호확인" required>
                	</td>
              	</tr>
              	<tr>
                	<td class="title">이메일</td>
              	</tr>
              	<tr>
                	<td>
                  		<input type="text" class="form-control" id="email" placeholder="abc@gmail.com" required>
                	</td>
                	<td><button class="form-control">인증하기</button></td>
              	</tr>
              	<tr>
                	<td>
                		<input type="text" class="form-control" id="email" required>
                	</td>
                	<td><button class="form-control">인증번호확인</button></td>
              	</tr>
              	<tr>
                	<td>성별</td>
              	</tr>
              	<tr>
                	<td class="form-control">
                  		<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="female" style="width:18px; height:18px; margin-left: 3px;">
                  		<label class="form-check-label" for="inlineRadio1" style="margin-left: 25px;">여성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                  		<input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="male" style="width:18px; height:18px;">
                  		<label class="form-check-label" for="inlineRadio1">남성</label>
                	</td>
              	</tr>
              	<tr>
                	<td>연령대</td>
              	</tr>
              	<tr>
                	<td>
                  		<label class="test_obj">
                    		<input type="radio" name="age" value="banana">
                    		<span>~20대</span>
                  		</label>
                  		<label class="test_obj">
                      		<input type="radio" name="age" value="lemon">
                      		<span>30대</span>
                  		</label>
                  		<label class="test_obj">
                    		<input type="radio" name="age" value="lemon">
                    		<span>40대</span>
                  		</label>
                  		<label class="test_obj">
                    		<input type="radio" name="age" value="lemon">
                    		<span>50대~</span>
                  		</label>
                	</td>
              	</tr>
            </table>
            <div class="updateBtn pt-2">
            	<button type="button" class="btn  btn-outline-warning btn-warning" onclick="location.href=''">저장</button>
            	<button type="button" class="btn btn-secondary">취소</button>
            </div>
        </form>
        <div class="memberOutBtn">
         	<button type="button" class="btn btn-secondary" onclick="location.href='MemberOut.html'">회원탈퇴</button>
        </div>
        </div>
      </main>
      </div>
	<jsp:include page="../common/footer.jsp"/>
      