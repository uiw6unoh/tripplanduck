<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

	<jsp:include page="../common/header.jsp"/>
	
	<!-- UpdateForm CSS -->
	<link rel="stylesheet" type="text/css" href="${ path }/css/mypage/UpdateForm.css">
<body>
	<!-- 회원 정보 수정 -->
	<!-- 전체 컨테이너 -->
	<div class="container" style="height:700px">
	<main class="form-signup m-auto">
		<div>
		<div class="updateFormInfo pt-3">
			<h1>회원 정보</h1>
			<img class="mb-4" src="${ path }/images/common/프사.png" alt="">
		</div>
		<form>
			<table class="signup">
				<tr>
					<td class="title">아이디</td>
				</tr>
				<tr>
					<td>
						<a class="form-control" type="text" placeholder="아이디" disabled="disabled">${ member.memberId }</a>
					</td>
              	</tr> 
              	<tr>
                	<td class="title">닉네임</td>
              	</tr>
              	<tr>
                	<td>
                  		<a type="text" class="form-control" id="nickname" placeholder="닉네임" disabled="disabled">${ member.memberNickname }</a>
                	</td>
              	</tr> 
              	<tr>
                	<td class="title">이메일</td>
              	</tr>
              	<tr>
                	<td>
                  		<a type="text" class="form-control" id="email" placeholder="abc@gmail.com" disabled="disabled">${ member.memberEmail }</a>
                	</td>
              	</tr>
            </table>
            <div class="updateBtn pt-2">
            	<button type="button" class="btn  btn-outline-warning" id="btnDelete" onclick="location.href=''">비회원 전환</button>
            	<button type="button" class="btn btn-secondary" onclick="location.href='${ path }/admin/member'">돌아가기</button>
            </div>
        </form>
        </div>
      </main>
      </div>
      
      <script>
		$(document).ready(() => {
			$("#btnDelete").on("click", () => {
				if(confirm("비회원으로 전환 하시겠습니까?")) {
					location.replace("${ path }/admin/memberChange?memberNo=${ member.memberNo }");
				}
			});
		});
	</script>
      
	<jsp:include page="../common/footer.jsp"/>
      