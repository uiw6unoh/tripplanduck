<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<c:set var="path" value="${ pageContext.request.contextPath }"/>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

    <!-- Custom styles for this template -->
    <link href="../../CSS/Login/findId.css" rel="stylesheet">
</head>
<body>
  <main class="container">
    <div>
      <div class="title">
        <h1>아이디 찾기</h1>
        <img class="mb-4" src="../../IMG/Login/profile.png" alt="" width="200px">
      </div>

      <form class="">
        <div class="findIdEmail">
          <label id="label-text" for="findIdEmail">이메일</label>
          <div>
            <input class="form-control" type="email" id="findIdEmail-input" placeholder="" />
          </div>
        </div>

        <p class="small-text">회원가입시 등록하셨던 이메일 주소를 입력해주시면 아이디를 전송해드립니다.</p>

        <div class="find-btn-box">
          <button class="form-control" type="submit" id="find-btn" style="background-color: #FFF8C6; color:black; border: 1px solid gold; margin-bottom: 10px;">전송하기</button>
        </div>

        <div class="text-box">
          <p class="small-text">*이메일이 도착하기까지 몇 분 정도 소요될 수 있습니다.</p>
          <p class="small-text">*스팸 메일함으로 발송될 수 있으니 체크 바랍니다.</p>
        </div>

        <div class="btns-box">
          <button class="form-control" type="submit" id="back-btn" style="background-color: #FFF8C6; color:black; border: 1px solid gold; margin-bottom: 10px;">뒤로가기</button>
          <button class="form-control" type="submit" id="findpassword" style="background-color: #FFF8C6; color:black; border: 1px solid gold; margin-bottom: 10px;">비밀번호 찾기</button>
        </div>
      </form>
    </div>
 	</main>  
</body>
</html>