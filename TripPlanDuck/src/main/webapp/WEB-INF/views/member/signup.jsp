<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
  <!-- Required meta tags -->
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <!-- Bootstrap CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

  <!-- Custom styles for this template -->
  <link href="${ path }/css/member/signup.css" rel="stylesheet">

  <title>회원가입</title>
</head>

<body class="text-center">
    <main class="form-signup m-auto">
      <div>
        <h1>SIGN UP</h1>
        <img class="mb-4" src="${ path }/images/member/profile.png" alt="" width="200px">
        <form>
            <table class="signup">
              <tr>
                <td class="title">아이디</td>
              </tr>
              <tr>
                <td>
                  <input type="text" class="form-control" id="memberId" name="memberId" placeholder="id" required>
                </td>
                <td><button class="form-control">중복확인</button></td>
              </tr> 
              <tr>
                <td class="title">닉네임</td>
              </tr>
              <tr>
                <td>
                  <input type="text" class="form-control" id="memberNickname" name="memberNickname" placeholder="닉네임" required>
                </td>
                <td><button class="form-control">중복확인</button></td>
              </tr> 
              <tr>
                <td class="title">비밀번호</td>
              </tr>
              <tr>               
                <td>
                  <input type="text" class="form-control" id="memberPassword" name="memberPassword" placeholder="비밀번호" required>
                </td>
              </tr>
              <tr>
                <td class="title">비밀번호확인</td>
              </tr>
              <tr>
                <td>
                  <input type="text" class="form-control" id="confirm_password" name="memberPassword" placeholder="비밀번호확인" required>
                </td>
              </tr>
              <tr>
                <td class="title">이메일</td>
              </tr>
              <tr>
                <td>
                  <input type="text" class="form-control" id="memberEmail" name="memberEmail" placeholder="abc@gmail.com" required>
                </td>
                <td><button class="form-control">인증하기</button></td>
              </tr>
              <tr>
                <td>
                <input type="text" class="form-control" id="memberEmailNumber" required>
                </td>
                <td><button class="form-control">인증번호확인</button></td>
              </tr>
              <tr>
                <td>성별</td>
              </tr>
              <tr>
                <td class="form-control">
                  <input class="form-check-input" type="radio" name="memberGender1" id="inlineRadio1" value="female" style="width:18px; height:18px; margin-left: 3px;">
                  <label class="form-check-label" for="inlineRadio1" style="margin-left: 25px;">여성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                  <input class="form-check-input" type="radio" name="memberGender2" id="inlineRadio1" value="male" style="width:18px; height:18px;">
                  <label class="form-check-label" for="inlineRadio1">남성</label>
                </td>
              </tr>
              <tr>
                <td>연령대</td>
              </tr>
              <tr>
                <td>
                  <label class="test_obj">
                    <input type="radio" name="age" value="20">
                    <span>~20대</span>
                  </label>
                  <label class="test_obj">
                      <input type="radio" name="age" value="30">
                      <span>30대</span>
                  </label>
                  <label class="test_obj">
                    <input type="radio" name="age" value="40">
                    <span>40대</span>
                   </label>
                   <label class="test_obj">
                    <input type="radio" name="age" value="50">
                    <span>50대~</span>
                   </label>

                </td>
              </tr>
            </table>
        </form>
        <div class="checkbox mb-2 mt-4">
          <label>
            <input type="checkbox" value="remember-id" required> 개인정보수집에 동의합니다. <a href="#" class="ml-4" id="privacy" style="color:grey;">보기</a>
            <br>
            <input class="auto-login" type="checkbox" value="auto-login" required> 이용약관에 동의합니다. <a href="#" id="termconditions" style="margin-left: 51px; color:grey;">보기</a>
          </label>
        </div>
        </div>
        <button class="w-50 btn-outline-warning btn-lg mt-2 mb-3" style="background-color: #FFF8C6; color:black; border: 1px solid gold;">회원가입</button>
        <button class="w-50 btn-outline-warning btn-lg mb-3" id="btnLogin" style="background-color: #FFF8C6; color:black; border: 1px solid gold;">뒤로가기</button>
      </main>


<!--jQuery-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<script>


	$(document).ready(function () {
		$('#btnLogin').click(function (e) {
			e.preventDefault();
			location.href = '${path}/member/login';
		});
		
		$('#privacy').click(function (e) {
			e.preventDefault();
			location.href = '${path}/member/privacy';
		});
		
		$('#termconditions').click(function (e) {
			e.preventDefault();
			location.href = '${path}/member/termconditions';
		});
		
	});
	

</script>
</body>
</html>