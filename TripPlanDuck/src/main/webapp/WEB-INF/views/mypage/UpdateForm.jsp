	<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${ pageContext.request.contextPath }" />

<jsp:include page="../common/header.jsp" />
<head>
	<!-- Bootstrap CSS -->
	<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
	<!-- UpdateForm CSS -->
	<link rel="stylesheet" type="text/css" href="${ path }/css/mypage/UpdateForm.css">
	<!-- sweetalert2 alert -->
	<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
</head>

<body>
	<!-- 회원 정보 수정 -->
	<!-- 전체 컨테이너 -->
	<div class="container">
		<main class="form-signup m-auto">
			<div>
				<div class="updateFormInfo pt-3">
					<h1>회원 정보 수정</h1> <img class="mb-4" src="${ path }/images/common/프사.png" alt=""> </div>
				<form action="${ path }/mypage/profile" method="POST" id="updateForm" accept-charset="utf-8">
					<table class="signup">
						<tr>
							<td class="title">아이디</td>
						</tr>
						<tr>
							<td style="font-size: 1.3rem;">${ loginMember.memberId }</td>
						</tr>
						<tr>
							<td class="title">닉네임</td>
						</tr>
						<tr>
							<td>
								<input type="text" class="form-control" id="nickname" name="memberNickname" required value="${ loginMember.memberNickname}">
							</td>
							<td>
								<button type="button" class="form-control" onclick="nicknameCheck()">중복확인</button>
							</td>
						</tr>
						<tr>
							<td class="title">비밀번호 변경</td>
						</tr>
						<tr>
							<td>
								<input type="password" class="form-control" id="password" name="memberPassword" placeholder="변경할 비밀번호 입력(8글자이상)" required>
							</td>
						</tr>
						<tr>
							<td class="title">비밀번호 재입력</td>
						</tr>
						<tr>
							<td>
								<input type="password" onkeyUp="onKuPwConfirm(this)" class="form-control" id="password2" placeholder="변경할 비밀번호 재입력" required>
								<div class="eqErrorMsgWrap"></div>
							</td>
						</tr>
						<tr>
							<td class="title">이메일</td>
						</tr>
						<tr>
							<td>
								<input type="text" class="form-control" id="email" name="memberEmail" value="${ loginMember.memberEmail }" required>
							</td>
							<td>
								<input type="button" class="form-control" onclick="emailCheck()" value="인증하기">
							</td>
						</tr>
						<tr>
							<td>
								<input type="text" class="form-control" id="emailNumber" placeholder="인증번호 6자리 입력" required>
							</td>
							<td>
								<input type="hidden" class="form-control" id="emailCheck2" value="인증번호확인" disabled="disabled" maxlength="6">
							</td>
						</tr>
						<tr>
							<td>성별</td>
						</tr>
						<tr>
							<td class="form-control">
								<c:if test="${ loginMember.memberGender == 'F' }">
								<input class="form-check-input" type="radio" name="memberGender" id="genderFemale" value="F" style="margin-left: 3px;" checked> </c:if>
								<c:if test="${ loginMember.memberGender != 'F' }">
								<input class="form-check-input radioF" type="radio" name="memberGender" id="genderFemale" value="F" style="margin-left: 3px;" > </c:if>
								<label class="form-check-label radioF" for="memberGender" style="margin-left: 25px; margin-right: 40px;">여성</label>
								
								<c:if test="${ loginMember.memberGender == 'M' }">
								<input class="form-check-input" type="radio" name="memberGender" id="genderMale" value="M" style="margin-left: 3px;" checked> </c:if>
								<c:if test="${ loginMember.memberGender != 'M' }">
								<input class="form-check-input" type="radio" name="memberGender" id="genderMale" value="M" > </c:if>
								<label class="form-check-label" for="genderMale" style="margin-left: 25px; margin-right: 40px;">남성</label>
							</td>
						</tr>
						<tr>
							<td>연령대</td>
						</tr>
						<tr>
							<td>
								<c:if test="${ loginMember.memberAge == 20 }">
									<label class="test_obj">
										<input type="radio" name="memberAge" value="20" checked> 
										<span>~20대</span>
									</label>
								</c:if>
								<c:if test="${ loginMember.memberAge != 20 }">
									<label class="test_obj">
										<input type="radio" name="memberAge" value="20">
										<span>~20대</span> 
									</label>
								</c:if>
								<c:if test="${ loginMember.memberAge == 30 }">
									<label class="test_obj">
										<input type="radio" name="memberAge" value="30" checked>
										<span>30대</span>
									</label>
								</c:if>
								<c:if test="${ loginMember.memberAge != 30 }">
									<label class="test_obj">
										<input type="radio" name="memberAge" value="30">
										<span>30대</span> 
									</label>
								</c:if>
								<c:if test="${ loginMember.memberAge == 40 }">
									<label class="test_obj">
										<input type="radio" name="memberAge" value="40" checked>
										<span>40대</span>
									</label>
								</c:if>
								<c:if test="${ loginMember.memberAge != 40 }">
									<label class="test_obj">
										<input type="radio" name="memberAge" value="40">
										<span>40대</span>
									</label>
								</c:if>
								<c:if test="${ loginMember.memberAge == 50 }">
									<label class="test_obj">
										<input type="radio" name="memberAge" value="50" checked>
										<span>50대</span>
									</label>
								</c:if>
								<c:if test="${ loginMember.memberAge != 50 }">
									<label class="test_obj">
										<input type="radio" name="memberAge" value="50">
										<span>50대</span>
									</label>
								</c:if>
							</td>
						</tr>
					</table>
					<div class="updateBtn pt-2">
						<button type="submit" class="btn  btn-outline-warning btn-warning" onclick="updateFormSubmit()">수정</button>
						<button type="button" class="btn btn-secondary" onclick="location.href='${path}/mypage?select=planner'">취소</button>
					</div>
				</form>
				<div class="memberOutBtn">
					<button type="button" class="btn btn-secondary" onclick="location.href='${path}/mypage/dropout'">회원탈퇴</button>
				</div>
			</div>
		</main>
	</div>	
	<jsp:include page="../common/footer.jsp" />

	<script type="text/javascript">
	function nicknameCheck() {
		let memberNickname = $("#nickname").val().trim();
		if(memberNickname == "") {
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
	};
	// 이메일 인증
	function emailCheck() {
		const email = $('#email').val() // 이메일 주소값 얻어오기
		console.log('이메일 : ' + email); // 이메일 오는지 확인
		const checkInput = $('#emailNumber') // 인증번호 입력하는곳 
		$.ajax({
			type: 'get',
			url: '<c:url value ="/member/emailCheck?email="/>' + email, // GET방식이라 Url 뒤에 email을 붙힐수있다.
			success: function(data) {
				console.log("data : " + data);
				checkInput.attr('disabled', false);
				code = data;
				Swal.fire('인증번호가 전송되었습니다.')
			}
		}); // end ajax
	}; // end send eamil
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('#emailNumber').blur(function() {
		const inputCode = $(this).val();
		if(inputCode === code) {
			$('#emailCheck2').attr('disabled', true);
			$('#email').attr('readonly', true);
			Swal.fire({
				icon: 'success',
				title: '일치!',
				text: '인증번호가 일치합니다!',
			})
		} else {
			Swal.fire({
				icon: 'error',
				title: '불일치!',
				text: '인증번호가 불일치 합니다. 다시 확인해주세요!',
			})
		}
	});

	function onKuPwConfirm(e) {
		var password = $('#password').val()
		var password2 = $('#password2').val()
		
		if(password !== password2){
			var addHtml = '<span class="eqErrorMsg" '+
						  'style="color: red;font-size: 0.9rem;"> 입력하신 비밀번호와 일치하지 않습니다.</span>';
			
			$('.eqErrorMsgWrap').html(addHtml)
		}else {
			$('.eqErrorMsgWrap').html('')
		}
		console.log(password2)
	}
	// 유효성 검사
	function updateFormSubmit() {
		// 변수에 넣기
		var password = document.getElementById("password");
		var password2 = document.getElementById("password2");
		var nickname = document.getElementById("memberNickname");
		var email = document.getElementById("email");
		var female = document.getElementById("female");
		var male = document.getElementById("male");
		var age20 = document.getElementById("age20");
		var age30 = document.getElementById("age30");
		var age40 = document.getElementById("age40");
		var age50 = document.getElementById("age50");
		var privacy_check = document.getElementById("privacy_check");
		var termconditions_check = document.getElementById("termconditions_check");
		
		
		if(password == "") {
			Swal.fire('비밀번호를 입력하세요.')
			memberPassword.focus();
			return false;
		}
		// 비밀번호 형식
		var passwordCheck = /^(?=.*[a-zA-Z])(?=.*[!@#$%^&*+=-])(?=.*[0-9]).{8,25}$/;
		if(!passwordCheck.test(memberPassword.value)) {
			Swal.fire('비밀번호는 영문자+숫자+특수문자 조합으로 8자리 이상 입력해주세요.')
			memberPassword.focus();
			return false;
		}
		if(memberPassword2.value !== memberPassword.value) {
			Swal.fire('비밀번호가 일치하지 않습니다.')
			memberPassword2.focus();
			return false;
		}
		if(memberNickname.value == "") {
			Swal.fire('닉네임을 입력하세요.')
			memberNickname.focus();
			return false;
		}
		// 이메일 형식
		var emailCheck = /^[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_\.]?[0-9a-zA-Z])*\.[a-zA-Z]{2,3}$/i;
		if(memberEmail.value == "") {
			Swal.fire('이메일주소를 입력하세요.')
			memberEmail.focus();
			return false;
		}
		if(!emailCheck.test(memberEmail.value)) {
			Swal.fire('이메일 형식에 맞게 입력해주세요.')
			memberEmail.focus();
			return false;
		}
		if(memberEmailNumber.value !== code) {
			Swal.fire({
				icon: 'error',
				title: '불일치!',
				text: '인증번호가 불일치 합니다. 다시 확인해주세요!',
			})
			memberEmailNumber.focus();
			return false;
		}
		if($("input[name=memberGender]:radio:checked").length < 1) {
			Swal.fire('성별을 선택해 주세요.')
			female.focus();
			return false;
		}
		if($("input[name=memberAge]:radio:checked").length < 1) {
			Swal.fire('연령대를 선택해 주세요.')
			age20.focus();
			return false;
		}
		if(!privacy_check.checked) {
			Swal.fire('개인정보수집에 동의해주세요.')
			privacy_check.focus();
			return false;
		}
		if(!termconditions_check.checked) {
			Swal.fire('이용약관에 동의해주세요.')
			termconditions_check.focus();
			return false;
		}
		//입력 값 전송
		$('#updateForm').submit();
	}
	</script>