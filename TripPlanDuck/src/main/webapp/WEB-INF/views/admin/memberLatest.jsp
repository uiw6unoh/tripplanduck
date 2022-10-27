<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="../common/header.jsp" />

<div class="container" style="margin-top: 70px; margin-bottom: 70px;">
    <div class="row contatiner">

    <!-- 왼쪽 그리드 -->
    <div class="col-sm-2">
        <!-- 사이드 메뉴바 -->
        <div class="mySideMenu" style="display: grid;">
            <a id="myListMain" href="${ path }/admin/member"> 회원 정보 관리 </a>
            <p></p>
            <a id="myListMain" href="${ path }/admin/review"> 리뷰 관리 </a>
            <p></p>
            <a id="myListMain" href="${ path }/admin/withDuck"> 위드덕 관리 </a>
        </div>
    </div>

    <!-- 오른쪽 그리드 -->
    <div class="col-sm-10" style="border: 3px solid rgb(221, 221, 221);">
        <!-- 컨테이너 -->
        <div class="container-chart">
        <h2 style="margin-top: 15px;">회원 정보 관리</h2>
        <hr class="mt-1" style="border: 1px solid rgb(221, 221, 221);">
        </div>

        <div class="row">
            <div class="col-md-6">
                        <p style="margin-top: 6%; margin-bottom: 10px; color: red;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
                            <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
                        </svg> 회원정지를 누를 시 비회원으로 전환 됩니다.</p>
            </div>
	         <div class="col-md-6">
                <form action="...">
                    <button type="button" class="btn  btn-outline-warning" style="margin-top: 20px; margin-left: 220px; outline: none !important; box-shadow: none !important; background-color: rgb(255,248,198); color: black;"
                     onclick="location.href='${ path }/admin/memberLatest'">회원</button>
                    <button type="button" class="btn  btn-outline-warning" style="margin-top: 20px; outline: none !important; box-shadow: none !important; background-color: rgb(255,248,198); color: black;"
                     onclick="location.href='${ path }/admin/memberOld'">비회원</button>
                     <button type="button" class="btn  btn-outline-warning" style="margin-top: 20px; outline: none !important; box-shadow: none !important; background-color: rgb(255,248,198); color: black;"
                     onclick="location.href='${ path }/admin/memberReport'">신고 수</button>
                </form>
            </div>
        </div>
        <div class="mt-3">
            <table class="table table-sm">
                <thead>
                    <tr style="height: 10px; color:gray">
                        <th style="width: 15%; text-align: center;">회원 번호</th>
                        <th style="width: 15%; text-align: center;">아이디</th>
                        
                        <th style="width: 15%; text-align: center;">닉네임</th>
                        <th style="width: 13%; text-align: center;">회원타입</th>
                        <th style="width: 12%; text-align: center;">회원 여부</th>
                        <th style="width: 8%; text-align: center;">계정 탈퇴</th>
                    </tr>
                </thead>

                <tbody>
                <c:if test="${ empty list }">
                	<tr>
                		<td colspan="6">
                			조회된 회원이 없습니다.
                		</td>
                	</tr>
                </c:if>
                <c:if test="${ not empty list }">
                	<c:forEach var="list" items="${list}">
                		<tr>
		                    <td style="text-align: center;">${list.memberNo}</td>
		                    <td style="text-align: center;">${list.memberId}</td>
		                    <td style="text-align: center;">${list.memberNickname}</td>
		                    <td style="text-align: center;">${list.memberType}</td>
		                    <td style="text-align: center;">${list.memberStatus}</td>
		                    <td>
	                        <button type="button" class="btn  btn-outline-warning" onclick="location.href='${ path }/admin/memberInfo?memberNo=${ list.memberNo }'" style="outline: none !important; box-shadow: none !important; background-color: rgb(255,248,198); color: red;">
	                            회원정보
	                        </button>
		                    </td>
		                </tr>
                	</c:forEach>
                </c:if>
                </tbody>
            </table>
        </div>

        <div class="row" style="margin-bottom: 25px;">
            <div class="col-4"></div>
            <div class="col-4">
                <ul class="pagination justify-content-center">
                    <!-- 맨 처음으로 -->
					<button class="btn" onclick="location.href='${ path }/admin/member?page=1'" style="outline: none !important; box-shadow: none !important;">
					&lt;&lt;</button>
		
					<!-- 이전 페이지로 -->
					<button class="btn" onclick="location.href='${ path }/admin/member?page=${ pageInfo.prevPage }'" style="outline: none !important; box-shadow: none !important;">
					 &lt;</button>
		
					<!--  10개 페이지 목록 -->
					<c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
						<c:if test="${ status.current == pageInfo.currentPage }">
							<button class="btn " disabled style="outline: none !important; box-shadow: none !important;">
							${ status.current }</button>
						</c:if>
						<c:if test="${ status.current != pageInfo.currentPage }">
							<button class="btn " onclick="location.href='${ path }/admin/member?page=${ status.current }'" style="outline: none !important; box-shadow: none !important;" >
							${ status.current }</button>
						</c:if>
					</c:forEach>
		
		
					<!-- 다음 페이지로 -->
					<button class="btn " onclick="location.href='${ path }/admin/member?page=${ pageInfo.nextPage }'" style="outline: none !important; box-shadow: none !important;">
					 &gt;</button>
		
					<!-- 맨 끝으로 -->
					<button class="btn " onclick="location.href='${ path }/admin/member?page=${ pageInfo.maxPage }'"
					 style="outline: none !important; box-shadow: none !important;">
					 &gt;&gt;</button>
                </ul>
            </div>
        </div>
        
        </div>
    </div>
    <!-- 컨테이너 끝 -->
    </div>
    
    <jsp:include page="../common/footer.jsp" />
    
<!-- Bootstrap JS -->
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
    crossorigin="anonymous"></script>
