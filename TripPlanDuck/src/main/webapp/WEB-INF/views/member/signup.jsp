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

  <!-- SweetAlert CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">
  
  <!-- Custom styles for this template -->
  <link href="${ path }/css/member/signup.css" rel="stylesheet">

  <title>회원가입</title>
</head>

<body class="text-center">
    <main class="form-signup m-auto">
      <div>
        <h1>SIGN UP</h1>
        <img class="mb-4" src="${ path }/images/member/profile.png" alt="" width="200px">
        <form action="${ path }/member/signup" method="POST" name="signup">
            <table class="signup">
              <tr>
                <td class="title">아이디</td>
              </tr>
              <tr>
                <td>
                  <input type="text" class="form-control" id="memberId" name="memberId" placeholder="id(4글자이상)" required>
                  <input type="hidden" name="idTest" value="0" />
                </td>
                <td><input type="button" class="form-control" id="idCheck" value="중복확인"></td>
              </tr> 
              <tr>
                <td class="title">닉네임</td>
              </tr>
              <tr>
                <td>
                  <input type="text" class="form-control" id="memberNickname" name="memberNickname" placeholder="닉네임" required>
                  <input type="hidden" name="nicknameTest" value="0" />
                </td>
                <td>
                	<input type="button" class="form-control" id="nicknameCheck" value="중복확인">
                	<span id="nickname_chk"></span>
                </td>
              </tr> 
              <tr>
                <td class="title">비밀번호</td>
              </tr>
              <tr>               
                <td>
                  <input type="password" class="form-control" id="memberPassword" name="memberPassword" placeholder="비밀번호(8글자이상)" required>
                  <span id="pwd_chk1"></span>
                </td>
              </tr>
              <tr>
                <td class="title">비밀번호확인</td>
              </tr>
              <tr>
                <td>
                  <input type="password" class="form-control" id="memberPassword2" name="memberPassword2" placeholder="비밀번호확인" required>
                  <span id="pwd_chk2"></span>
                </td>
              </tr>
              <tr>
                <td class="title">이메일</td>
              </tr>
              <tr>
                <td>
                  <input type="text" class="form-control" id="memberEmail" name="memberEmail" placeholder="abc@gmail.com" required>
                </td>
                <td><input type="button" class="form-control" id="emailCheck" value="인증하기"></td>
              </tr>
              <tr>
              <td><span id="email_chk"></span></td>
              </tr>
              <tr>
                <td>
                <input type="text" class="form-control" id="memberEmailNumber" placeholder="인증번호 6자리 입력" required>
                <input type="hidden" name="emailTest" value="0" />
                </td>
                <td><input type="button" class="form-control" id="emailCheck2" value="인증번호확인" maxlength="6"></td>
              </tr>
              <tr>
                <td>성별</td>
              </tr>
              <tr>
                <td class="form-control">
                  <input class="form-check-input" type="radio" name="memberGender" id="genderFemale" value="F" style="width:18px; height:18px; margin-left: 3px;">
                  <label class="form-check-label" for="female" style="margin-left: 25px;">여성&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</label>
                  <input class="form-check-input" type="radio" name="memberGender" id="genderMale" value="M" style="width:18px; height:18px;">
                  <label class="form-check-label" for="genderMale">남성</label>
                  <span id="gender_chk" class="check"></span>
                </td>
              </tr>   
              <tr>
                <td>연령대</td>
              </tr>
              <tr>
                <td>
                  <label class="test_obj">
                    <input type="radio" name="memberAge" value="20">
                    <span>~20대</span>
                  </label>
                  <label class="test_obj">
                      <input type="radio" name="memberAge" value="30">
                      <span>30대</span>
                  </label>
                  <label class="test_obj">
                    <input type="radio" name="memberAge" value="40">
                    <span>40대</span>
                   </label>
                   <label class="test_obj">
                    <input type="radio" name="memberAge" value="50">
                    <span>50대~</span>
                   </label>
                   <label for="" id="age_chk" class="check"></label>
                </td>
              </tr>
            </table>
           <div class="checkbox mb-2 mt-4">
             <label>
               <input type="checkbox" name="privacy_check" id="privacy_check" value="remember-id" required> <b>(필수)</b>개인정보수집에 동의합니다. <a href="#" class="ml-4" id="privacy" style="color:grey;">보기</a>
               <br>
               <input class="auto-login" type="checkbox" name="termconditions_check" id="termconditions_check" value="auto-login" required> <b>(필수)</b>이용약관에 동의합니다. <a href="#" id="termconditions" style="margin-left: 51px; color:grey;">보기</a>
             </label>
           </div>
           <button class="w-50 btn-outline-warning btn-lg mt-2 mb-3" type="button" onclick="signup_check();" style="background-color: #FFF8C6; color:black; border: 1px solid gold;">회원가입</button>
           <button class="w-50 btn-outline-warning btn-lg mb-3" id="btnLogin" style="background-color: #FFF8C6; color:black; border: 1px solid gold;">뒤로가기</button>
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
   $(document).ready(function () {
      $('#btnLogin').click(function (e) {
         e.preventDefault();
         location.href = '${path}/member/login';
      });
      
      $('#privacy').click(function (e) {
         e.preventDefault();
         location.href = '${path}/common/privacy';
      });
      
      $('#termconditions').click(function (e) {
         e.preventDefault();
         location.href = '${path}/common/termconditions';
      });
      	  
   });
   
   
   
   // 아이디 중복 확인
   $(document).ready(() => {
      $("#idCheck").on("click", () => {
         let memberId = $("#memberId").val().trim();         

        	 if (memberId == "") { // if(!memberId.value) 로도 사용 가능 
	 			Swal.fire('아이디를 입력하세요.')
	 			memberId.focus();
	 			return false;	
	 		}	
         
	        var idCheck2 = /^[a-z]+[a-z0-9]{3,13}$/;
	  		
	  		if (!idCheck2.test(memberId)) {
	  			Swal.fire('아이디는 4~12자 사이 영문자로 입력해주세요.')
	  			memberId.focus();
	  			return;
	  		}
         
         $.ajax({
            type: "POST",
            url: "${ path }/member/idCheck",
            dataType: "json",
            data: {
               memberId 
            },
            success: (obj) => {
               console.log(obj);
               
               if(obj.duplicate === true) {
                  Swal.fire({
                	  icon: 'error',
                	  title: '실패!',
                	  text: '이미 사용중인 아이디 입니다.',
                	})
               } else {
            	   $("[name=idTest]").val("1");
                  Swal.fire({
                	  icon: 'success',
                	  title: '성공!',
                	  text: '사용 가능한 아이디 입니다.',
                	})
               }
            }, 
            error: (error) => {
               console.log(error);
            }
         });
      });
   });
   
	 //아이디 중복검사 이후 id값 변경시 다시 중복검사 실행
		$("#memberId").change(function(){
			$("[name=idTest]").val("0");
		});
	   
   // 닉네임 중복 확인
   $(document).ready(() => {
      $("#nicknameCheck").on("click", () => {
         let memberNickname = $("#memberNickname").val().trim();         
         
 		if (memberNickname == "") {
			Swal.fire('닉네임을 입력하세요.')
			memberNickname.focus();
			return false;
		}
         
         $.ajax({
            type: "POST",
            url: "${ path }/member/nicknameCheck",
            dataType: "json",
            data: {
               memberNickname 
            },
            success: (obj) => {
               console.log(obj);
               
               if(obj.duplicate === true) {
                  Swal.fire({
                	  icon: 'error',
                	  title: '실패!',
                	  text: '이미 사용중인 닉네임 입니다.',
                	})
               } else {
            	   $("[name=nicknameTest]").val("1");
                  Swal.fire({
                	  icon: 'success',
                	  title: '성공!',
                	  text: '사용 가능한 닉네임 입니다.',
                	})
               }
            }, 
            error: (error) => {
               console.log(error);
            }
         });
      });
   });
   
	 //닉네임 중복검사 이후 id값 변경시 다시 중복검사 실행
	$("#memberNickname").change(function(){
		$("[name=nicknameTest]").val("0");
	});
   
   
   // 이메일 인증
   $('#emailCheck').click(function() {
		const email = $('#memberEmail').val() // 이메일 주소값 얻어오기
		console.log('이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('#memberEmailNumber') // 인증번호 입력하는곳 
		var emailCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if (email == "") {
			Swal.fire('이메일을 입력하세요.')
			email.focus();
			return false;
		} else if(!emailCheck.test(email)){
				Swal.fire('이메일 형식에 맞게 입력해주세요.')
				email.focus();
				return false;
		} else{
			Swal.fire({
				  icon: 'success',
				  title: '전송완료!',
				  html: '인증번호가 전송되었습니다!<br/>*이메일이 도착하기까지 몇 분 정도 소요될 수 있습니다.<br/>*스팸 메일함으로 발송될 수 있으니 체크 바랍니다.',
				})
		}
		
		$.ajax({
			type : 'get',
			url : '<c:url value ="/member/emailCheck?email="/>'+email, // GET방식이라 Url 뒤에 email을 붙힐수있다.
			success : function (data) {
				console.log("data : " +  data);
				checkInput.attr('disabled',false);
				code =data;
			}			
		}); // end ajax
	}); // end send eamil
	
	// 인증번호 비교 
	$('#emailCheck2').click(function () {
		const inputCode = $('#memberEmailNumber').val();
		
		if(inputCode === code){
			Swal.fire({
	          	  icon: 'success',
	          	  title: '일치!',
	          	  text: '인증번호가 일치합니다!',
				})
			$('#emailCheck2').attr('disabled',true);
			$('#memberEmail').attr('readonly',true);
			$("[name=emailTest]").val("1");
		}else{
			Swal.fire({
	          	  icon: 'error',
	          	  title: '불일치!',
	          	  text: '인증번호가 불일치 합니다. 다시 확인해주세요!',
				})
		}
		
	});
	
	
	// 유효성 검사(span)
	$(document).ready(function () {		
		
		$("#memberEmail").change(function(){
			var email = $("#memberEmail");
		
			if (/^[A-Za-z0-9_\.\-]+@[A-Za-z0-9\-]+\.[A-Za-z0-9\-]+/.test(email.val()) == false) {
				$("#email_chk").html("<b>유효한 이메일을 입력해주세요.</b>");
				$("#email_chk").attr('style', 'visibility:visible; font-size:12px; color:#c4302b;');
			}else{
				$("#email_chk").html("");
				$("#email_chk").attr('style', 'visibility:hidden;');
			}
		});
		
			$("#memberPassword").change(function(){
				var p1 = $("#memberPassword");
				
				if(/^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{8,25}$/.test(p1.val())==false){
					$("#pwd_chk1").html("<b>영문자+숫자+특수문자 조합으로 8자리 이상 입력해주세요.</b>");
					$("#pwd_chk1").attr('style', 'visibility:visible; font-size:12px; color:#c4302b;');
				}else if(/^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{8,25}$/.test(p1.val())==true){
					$("#pwd_chk1").html("");
					$("#pwd_chk1").attr('style', 'visibility:hidden;');
				}
			});
		
			$("#memberPassword2").change(function(){
				var p1 = $("#memberPassword");
				var p2 = $("#memberPassword2");
				
				if(p1.val() != p2.val()){
					$("#pwd_chk2").html("<b>비밀번호가 일치하지 않습니다.</b>");
					$("#pwd_chk2").attr('style', 'visibility:visible; font-size:12px; color:#c4302b;');
				}else{
					$("#pwd_chk2").html("");
					$("#pwd_chk2").attr('style', 'visibility:hidden;');
				}
			});
						
	});
	
	
	// 유효성 검사
	function signup_check() {
		// 변수에 넣기
		var memberId = document.getElementById("memberId");
		var memberPassword = document.getElementById("memberPassword");
		var memberPassword2 = document.getElementById("memberPassword2");
		var membernickName = document.getElementById("memberNickname");
		var memberEmail = document.getElementById("memberEmail");
		var female = document.getElementById("female");
		var male = document.getElementById("male");
		var age20 = document.getElementById("age20");
		var age30 = document.getElementById("age30");
		var age40 = document.getElementById("age40");
		var age50 = document.getElementById("age50");
		var privacy_check = document.getElementById("privacy_check");
		var termconditions_check = document.getElementById("termconditions_check");
		
		//중복검사 실시 유무
		if($("[name=idTest]").val() != "1"){
			Swal.fire("아이디 중복검사를 해주세요.");
			$("#memberId").focus();
			return false;
		}
		
		if (memberId.value == "") { // if(!memberId.value) 로도 사용 가능 
			Swal.fire('아이디를 입력하세요.')
			memberId.focus();
			return false;	
		}
		
		//아이디 형식
		var idCheck2 = /^[a-z]+[a-z0-9]{3,13}$/;
		
		if (!idCheck2.test(memberId.value)) {
			Swal.fire('아이디는 4~12자 사이 영문자로 입력해주세요.')
			memberId.focus();
			return false;	
		}
		
		
		if(memberPassword == "") {
			Swal.fire('비밀번호를 입력하세요.')
			memberPassword.focus();
			return false;
		}
		
		// 비밀번호 형식
		var passwordCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{8,25}$/;
		
		if (!passwordCheck.test(memberPassword.value)) {
			Swal.fire('비밀번호는 영문자+숫자+특수문자 조합으로 8자리 이상 입력해주세요.')
			memberPassword.focus();
			return false;
		}
		
		if (memberPassword2.value !== memberPassword.value) {
			Swal.fire('비밀번호가 일치하지 않습니다.')
			memberPassword2.focus();
			return false;
		}
		
		if (memberNickname.value == "") {
			Swal.fire('닉네임을 입력하세요.')
			memberNickname.focus();
			return false;
		}
		
		//중복검사 실시 유무
		if($("[name=nicknameTest]").val() != "1"){
			Swal.fire("닉네임 중복검사를 해주세요.");
			$("#memberNickname").focus();
			return false;
		}
		
		// 이메일 형식
		var emailCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		
		if (memberEmail.value == "") {
			Swal.fire('이메일주소를 입력하세요.')
			memberEmail.focus();
			return false;
		} 
		
		
		if (!emailCheck.test(memberEmail.value)) {
			Swal.fire('이메일 형식에 맞게 입력해주세요.')
			memberEmail.focus();
			return false;
		}
		
		if(memberEmailNumber.value !== code){
			Swal.fire({
	          	  icon: 'error',
	          	  title: '불일치!',
	          	  text: '인증번호가 불일치 합니다. 다시 확인해주세요!',
				})
			memberEmailNumber.focus();
			return false;
		} 
		
		//이메일 인증 실시 유무
		if($("[name=emailTest]").val() != "1"){
			Swal.fire("이메일 인증을 해주세요");
			return false;
		}
		
		if ($("input[name=memberGender]:radio:checked").length < 1) {
			Swal.fire('성별을 선택해 주세요.')
			female.focus();
			return false;
		}
		
		if ($("input[name=memberAge]:radio:checked").length < 1) {
			Swal.fire('연령대를 선택해 주세요.')
			age20.focus();
			return false;
		}
		 
		if (!privacy_check.checked) {
			Swal.fire('개인정보수집에 동의해주세요.')
			privacy_check.focus();
			return false;
		} 
		
		if (!termconditions_check.checked) {
			Swal.fire('이용약관에 동의해주세요.')
			termconditions_check.focus();
			return false;
		} 
		

		//입력 값 전송
		document.signup.submit(); 
		
}
		

</script>
</body>
</html>