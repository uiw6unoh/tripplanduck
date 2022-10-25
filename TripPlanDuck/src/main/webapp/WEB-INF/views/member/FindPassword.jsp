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
<title>비밀번호 찾기</title>

    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">

 	<!-- SweetAlert CSS -->
  	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
    
    <!-- Custom styles for this template -->
    <link href="${ path }/css/member/findPassword.css" rel="stylesheet">
</head>
<body>
  <main class="container">
    <div>
      <div class="title">
        <h1>비밀번호 찾기</h1>
        <img class="mb-4" src="${ path }/images/member/profile.png" alt="" width="200px">
      </div>

      <form action="${ path }/member/findMemberPassword" method="post">
        <div class="findIdEmail">
          <label id="label-text" for="findmemberId">아이디</label>
          <div>
            <input class="form-control" type="text" id="memberId" name="memberId" placeholder="" />
          </div>
          <label id="label-text" for="findmemberEmail">이메일</label>
          <div>
            <input class="form-control" type="email" id="memberEmail" name="memberEmail" placeholder="" />
          </div>
        </div>

        <p class="small-text">회원가입시 등록하셨던 이메일 주소를 입력해주시면 이메일로 비밀번호를 전송합니다.</p>

        <div class="find-btn-box">
          <button class="form-control" type="button" id="findBtn" style="background-color: #FFF8C6; color:black; border: 1px solid gold; margin-bottom: 10px;">전송하기</button>
        </div>

        <div class="text-box">
          <p class="small-text">*이메일이 도착하기까지 몇 분 정도 소요될 수 있습니다.</p>
          <p class="small-text">*스팸 메일함으로 발송될 수 있으니 체크 바랍니다.</p>
        </div>

        <div class="btns-box">
          <button class="form-control" type="button" id="back-btn" onclick="history.go(-1);" style="background-color: #FFF8C6; color:black; border: 1px solid gold; margin-bottom: 10px;">뒤로가기</button>
        </div>
      </form>
    </div>
 	</main>  
 	
 	<!--jQuery-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>
  
<script>
	$(document).ready(() => {
		$("#findBtn").click(function(){
			const email = $('#memberEmail').val() // 이메일 주소값 얻어오기
			console.log('이메일 : ' + email); 
			
			$.ajax({
				url : "${ path }/member/tmpMemberPassword",
				type : "POST",
				data : {
					memberId : $("#memberId").val(),
					memberEmail : $("#memberEmail").val()
				},
				success: (obj) => {
		               console.log(obj);
		               
		               if(obj.result === 1) {
		            	   Swal.fire({
			                	  icon: 'success',
			                	  title: '전송 성공!'
			                	})
		               } else {
		            	   Swal.fire({
			                	  icon: 'error',
			                	  title: '전송 실패!'
			                	})
		               }
		            }, 
		            error: (error) => {
		               console.log(error);
		            }
		         });
		      });
		   });
</script>

</body>
</html>