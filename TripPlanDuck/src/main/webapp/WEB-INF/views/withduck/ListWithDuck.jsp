<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="../common/header.jsp"/>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>동행인 찾기</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
    <!-- mainstyle CSS -->
    <link rel="stylesheet" href="${path }/resources/css/common/style.css" type="text/css" />
    <link rel="stylesheet" href="${path }/resources/css/common/font-icons.css" type="text/css" />
    
    <!-- WithDuck CSS-->
    <link rel="stylesheet" type="text/css" href="${path }/resources/css/withduck/ListWithDuck.css">
</head>

<body class="stretched">
<section class="zone1">
<div class="img_textContainer">
    <p class="img_text">동행인 찾기</p>
</div>
</section>

<form action="${path}/withduck/joinValFilter" id="formobj" method="get">
<section class="zone2">
<div class="filter">
    <div class="filter_container">
        <div class="filter_location" style="display: flex !important; justify-content: center;
        align-items: center;  border-bottom: 1px solid #a7a2a28f; height: 101.6px;">지역</div>
        <div class="filter_gender" style="display: flex !important; justify-content: center;
        align-items: center;  border-bottom: 1px solid #a7a2a28f; height: 50.8px;">희망성별</div>
        <div class="filter_age" style="display: flex !important; justify-content: center;
        align-items: center;  border-bottom: 1px solid #a7a2a28f; height: 50.8px;">연령대</div>
        <div class="filter_personel" style="display: flex !important; justify-content: center;
        align-items: center;  border-bottom: 1px solid #a7a2a28f; height: 50.8px;">인원</div>
        <div class="filter_personel" style="display: flex !important; justify-content: center;
        align-items: center; height: 53.8px;">날짜</div>
    </div>

    <div class="filter_containerValue">
                <div class="location_value" style="border-bottom: 0;">
                    <div><button class="location_btn" value="부산광역시" type="button" name="location">부산광역시</button></div>
                    <input type="hidden" type="text" id="btnValueSaveLocation" name="location_val">
                    <div><button class="location_btn" value="서울특별시" type="button" name="location">서울특별시</button></div>
                    <div><button class="location_btn" value="인천광역시" type="button" name="location">인천광역시</button></div>
                    <div><button class="location_btn" value="광주광역시" type="button" name="location">광주광역시</button></div>
                    <div><button class="location_btn" value="대전광역시" type="button" name="location">대전광역시</button></div>
                    <div><button class="location_btn" value="대구광역시" type="button" name="location">대구광역시</button></div>
                </div>

                <div class="location_value">
                    <div><button class="location_btn" value="강원도" type="button" name="location">강원도</button></div>
                    <div><button class="location_btn" value="제주도" type="button" name="location">제주도</button></div>
                    <div><button class="location_btn" value="경기도" type="button" name="location">경기도</button></div>
                    <div><button class="location_btn" value="충청도" type="button" name="location">충청도</button></div>
                    <div><button class="location_btn" value="경상도" type="button" name="location">경상도</button></div>
                    <div><button class="location_btn" value="전라도" type="button" name="location">전라도</button></div>
                </div>

                <div class="gender_value">
                    <input type="hidden" type="text" id="btnValueSaveGender" name="gender_val">
                    <button class="gender_btn" value="남자" type="button" name="gender">남자</button>
                    <button class="gender_btn" value="여자" type="button" name="gender">여자</button>
                    <button class="gender_btn" value="성별무관" type="button" name="gender">성별무관</button>
                </div>

                <div class="age_value">
                	<input type="hidden" type="text" id="btnValueSaveAge" name="age_val">
                    <button class="age_btn" value="~20대" type="button" name="age">~20대</button>
                    <button class="age_btn" value="30대" type="button" name="age">30대</button>
                    <button class="age_btn" value="40대" type="button" name="age">40대</button>
                    <button class="age_btn" value="50대 이상" type="button" name="age">50대 이상</button>
                </div>

                <label for="customRange2" class="form-label"></label>
                <div style="display: flex; align-items: center; justify-content: center; position: relative; bottom: 20px; height: 50.8px; border-bottom: 1px solid #a7a2a28f ;">
                    <input type="range" name="personnel_val" class="form-range" min="0" step="1" max="50" id="customRange2" oninput="
                            sessionStorage.setItem('personnel', $('.form-range').val())
                            $('.form-range').attr('value', sessionStorage.getItem('personnel') );
                            $('#value2').text(sessionStorage.getItem('personnel')+'명');    
                            document.getElementById('value2').innerHTML=this.value+'명';
                            ">
                    <span id="value2" style="position:relative; left:5px; bottom:2px; display: inline-block; width: 40px;"> 0명</span>
                    
                </div>
                <div class="date_container">
                    <div class="start_container">
                        <label for="start">출발일:</label>
    
                        <input type="date" id="start" class="start" name="start_val"
                            value="2018-07-22"
                            min="2018-01-01" max="2030-12-31" style="margin-left:10px;" onchange="startValidity(event)";>
                    </div>
                    <div class="end_container">
                        <label for="start">도착일:</label>
            
                        <input type="date" id="end" class="end" name="end_val"
                            value="2018-07-22"
                            min="2018-01-01" max="2030-12-31" style="margin-left:10px;" onchange="endValidity(event)";>
                    </div>
                </div>
    </div>
</div>

        <div class="btn filter-btn">
            <button class="btn btn-outline-warning" id="filterSearch" type="submit">
            필터 검색
            </button>
    
            <button class="btn btn-outline-warning" type="submit" onclick="javascript: sessionStorage.clear(); form.action='${path}/withduck/list';">
            필터 초기화
            </button>
        </div>
        <div style="text-align: center; position: relative; left: 470px; top: 36px; display: inline-block; padding: 0px;">
            <a href="${path }/withduck/create">
                <img src="${path}/resources/images/WithDuck/airplane.gif" width="90px" alt="">
                <p style="font-weight: bold;">CREATE WITHDUCK</p> 
            </a>
        </div>
    </section>


    <section class="zone3">
        <div class="container">
            <div class="sort" style="text-align: right;">
            
            <input name="keywordSearch" id="keyword" style="display: inline-block; position: relative; right: 65%; top: 60px;" placeholder="키워드를 입력하세요.">
            <button id="keywordSearch" class="btn btn-outline-warning" style="display: inline-block; position: relative; right: 65%; top: 60px;">검색</button>
                <div class="dropdown d-flex justify-content-end" style="width: 100px; position:relative; top: 35px; left: 850px">
                 	<c:if test="${empty sort_name }">
	                    <button class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
	                    최신순<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
	                     	<path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
	                    </svg>
	                    </button>
                	</c:if>

                	<c:if test="${not empty sort_name }">
	                    <button class="btn btn-outline-light dropdown-toggle" type="button" id="dropdownMenuButton1" data-bs-toggle="dropdown" aria-expanded="false">
	                    ${sort_name}<svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-caret-down-fill" viewBox="0 0 16 16">
	                        <path d="M7.247 11.14 2.451 5.658C1.885 5.013 2.345 4 3.204 4h9.592a1 1 0 0 1 .753 1.659l-4.796 5.48a1 1 0 0 1-1.506 0z"/>
	                    </svg>
	                    </button>
                	</c:if>
                   

                    <ul class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuButton1" >
                    <fmt:formatNumber value="${personnel_val}" type="number" var="personnel_val"/>
                    <fmt:formatNumber value="${page}" type="number" var="page"/>
                    <c:if test="${joinStatus == '모집중'}">
                    	<c:if test="${empty keywordSearch}">
	                    	<li><a class="dropdown-item" href="${path}/withduck/joinValFilter?sort_name=최신순&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&page=${filter_val[6]}&joinStatus=모집중&keywordSearch=">최신순</a></li>
		                    <li><a class="dropdown-item" href="${path}/withduck/joinValFilter?sort_name=조회순&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&page=${filter_val[6]}&joinStatus=모집중&keywordSearch=">조회순</a></li>
                    	</c:if>
                    	<c:if test="${not empty keywordSearch}">
	                    	<li><a class="dropdown-item" href="${path}/withduck/joinValFilter?sort_name=최신순&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&page=${filter_val[6]}&joinStatus=모집중&keywordSearch=${keywordSearch}">최신순</a></li>
		                    <li><a class="dropdown-item" href="${path}/withduck/joinValFilter?sort_name=조회순&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&page=${filter_val[6]}&joinStatus=모집중&keywordSearch=${keywordSearch}">조회순</a></li>
                    	</c:if>
                    </c:if>
                    <c:if test="${joinStatus != '모집중'}">
	                   	<c:if test="${not empty keywordSearch}">
		                    <li><a class="dropdown-item" href="${path}/withduck/joinValFilter?sort_name=최신순&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&page=${filter_val[6]}&joinStatus=&keywordSearch=${keywordSearch}">최신순</a></li>
		                    <li><a class="dropdown-item" href="${path}/withduck/joinValFilter?sort_name=조회순&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&page=${filter_val[6]}&joinStatus=&keywordSearch=${keywordSearch}">조회순</a></li>
                    	</c:if>
	                   	<c:if test="${empty keywordSearch}">
		                    <li><a class="dropdown-item" href="${path}/withduck/joinValFilter?sort_name=최신순&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&page=${filter_val[6]}&joinStatus=&keywordSearch=">최신순</a></li>
		                    <li><a class="dropdown-item" href="${path}/withduck/joinValFilter?sort_name=조회순&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&page=${filter_val[6]}&joinStatus=&keywordSearch=">조회순</a></li>
                    	</c:if>
                    </c:if>
                    </ul>
                </div>
                	<button class="btn btn-outline-warning" id="joinButton" style="width: 150px; background-color: #a7a2a23b; border: 0; font-weight: bold; border-radius: 30px;">모집중인 글만 보기</button>
            </div>
            <div class="row row-cols-2 row-cols-lg-4 g-2 g-lg-3">
            
            
				<c:forEach var="withDuck" items="${ list }">
                <div class="col">
                    <div class="p-3 border bg-light">
                       <a href="${path }/withduck/detail?withNo=${withDuck.withNo}">
	                   	<c:if test="${not empty withDuck.reList[0]}">
		                   	<c:if test="${withDuck.withJoinStatus == '모집중'}">
			                   <div id="total_container" style="position: relative;">
		                            <img class="intro-img" src="${path}/resources/upload/withduck/${withDuck.reList[0]}" alt="">
		                        	<div id="joincontainer" style="color: white; position: absolute; border-radius: 5px; 
				                        									top: 5px;	left: 5px; background-color: green; width: 80px; display: flex; align-items: center; justify-content: center; ">
		                        	${withDuck.withJoinStatus }
		                        	</div>
			                   </div>
			                </c:if>
		                   	<c:if test="${withDuck.withJoinStatus == '모집완료'}">
		                            <img class="intro-img" src="${path}/resources/upload/withduck/${withDuck.reList[0]}" alt="">
		                            <div id="joincontainer" style="	color: white; position: absolute; border-radius: 5px; 
			                        								margin: 5px; top: 25px;	left: 40px; background-color: red; width: 80px; display: flex; align-items: center; justify-content: center; ">
			                        	${withDuck.withJoinStatus }
			                        </div>
			                </c:if>
	                    </c:if>
	                    
                       <c:if test="${ empty withDuck.reList[0] }">
                       	<c:if test="${withDuck.withJoinStatus == '모집중'}">
                       		<div id="total_container" style="position: relative;">
	                            <img class="intro-img" src="${path}/resources/images/trip/noImage.jpeg" alt="">
	                        	<div id="joincontainer" style="color: white; position: absolute; border-radius: 5px; 
				                        								margin: 5px;	top: 5px;	left: 5px; background-color: green; width: 80px; display: flex; align-items: center; justify-content: center; ">
	                        	${withDuck.withJoinStatus }
	                        	</div>
		                   </div>
		                </c:if>
                       	<c:if test="${withDuck.withJoinStatus == '모집완료'}">
	                            <img class="intro-img" src="${path}/resources/images/trip/noImage.jpeg" alt="">
	                            <div id="joincontainer" style="	color: white; position: absolute; border-radius: 5px; 
			                        								top: 25px;	left: 40px; background-color: red; width: 80px; display: flex; align-items: center; justify-content: center; ">
			                        	${withDuck.withJoinStatus }
			                    </div>
		                </c:if>
                       </c:if>
                        </a>
                        <p class="title" style="font-size: 22px; font-weight: bold;">${withDuck.withTitle }</p>
                        <p class="content">${withDuck.withContent }</p>
                        <p class="nickName" ><img src="${path}/resources/images/common/프사.png">${withDuck.withWriterNick }</p> 
                        <p class="good">${withDuck.withReadCount }</p>
                        <p class="readCount" ><img style="width:20px" src="${path }/resources/images/WithDuck/view.png"> </p>
                    </div>
                </div>
				</c:forEach>
			</div>
        </div>
        <nav aria-label="..." style="margin-top: 50px;">
            <c:if test="${joinStatus != '모집중' }">
              <c:if test="${empty keywordSearch }">
	            <ul class="pagination justify-content-center">
	            <li class="page-item disabled">
						<a class="page-link" href="${ path }/withduck/joinValFilter?page=${ pageInfo.prevPage }&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&joinStatus=&sort_name=${sort_name}&keywordSearch=" aria-label="Previous">
		                            <span aria-hidden="true">이전</span>
		                </a>
			    </li>
			    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
			    <li class="page-item"><a class="page-link" href="${ path }/withduck/joinValFilter?page=${ status.current }&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&joinStatus=&sort_name=${sort_name}&keywordSearch=">${ status.current }</a></li>
			    </c:forEach>
			    <li class="page-item">
			       <a class="page-link" href="${path}/withduck/joinValFilter?page=${pageInfo.nextPage}&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&joinStatus=&sort_name=${sort_name}&keywordSearch=" aria-label="Next">다음</a>
			    </li>
	            </ul>
              </c:if>
              
              <c:if test="${not empty keywordSearch }">
	            <ul class="pagination justify-content-center">
	            <li class="page-item disabled">
						<a class="page-link" href="${ path }/withduck/joinValFilter?page=${ pageInfo.prevPage }&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&joinStatus=&sort_name=${sort_name}&keywordSearch=${keywordSearch}" aria-label="Previous">
		                            <span aria-hidden="true">이전</span>
		                </a>
			    </li>
			    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
			    <li class="page-item"><a class="page-link" href="${ path }/withduck/joinValFilter?page=${ status.current }&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&joinStatus=&sort_name=${sort_name}&keywordSearch=${keywordSearch}">${ status.current }</a></li>
			    </c:forEach>
			    <li class="page-item">
			       <a class="page-link" href="${path}/withduck/joinValFilter?page=${pageInfo.nextPage}&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&joinStatus=&sort_name=${sort_name}&keywordSearch=${keywordSearch}" aria-label="Next">다음</a>
			    </li>
	            </ul>
              </c:if>
            </c:if>
            
            <c:if test="${joinStatus == '모집중' }">
	          <c:if test="${empty keywordSearch }">
	            <ul class="pagination justify-content-center">
	            <li class="page-item disabled">
						<a class="page-link" href="${ path }/withduck/joinValFilter?page=${ pageInfo.prevPage }&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&joinStatus=${joinStatus}&sort_name=${sort_name}&keywordSearch=" aria-label="Previous">
		                            <span aria-hidden="true">이전</span>
		                </a>
			    </li>
			    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
			    <li class="page-item"><a class="page-link" href="${ path }/withduck/joinValFilter?page=${ status.current }&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&joinStatus=${joinStatus}&sort_name=${sort_name}&keywordSearch=">${ status.current }</a></li>
			    </c:forEach>
			    <li class="page-item">
			       <a class="page-link" href="${path}/withduck/joinValFilter?page=${pageInfo.nextPage}&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&joinStatus=${joinStatus}&sort_name=${sort_name}&keywordSearch=" aria-label="Next">다음</a>
			    </li>
	            </ul>
              </c:if>
              
	          <c:if test="${not empty keywordSearch }">
	            <ul class="pagination justify-content-center">
	            <li class="page-item disabled">
						<a class="page-link" href="${ path }/withduck/joinValFilter?page=${ pageInfo.prevPage }&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&joinStatus=${joinStatus}&sort_name=${sort_name}&keywordSearch=${keywordSearch}" aria-label="Previous">
		                            <span aria-hidden="true">이전</span>
		                </a>
			    </li>
			    <c:forEach begin="${ pageInfo.startPage }" end="${ pageInfo.endPage }" varStatus="status">
			    <li class="page-item"><a class="page-link" href="${ path }/withduck/joinValFilter?page=${ status.current }&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&joinStatus=${joinStatus}&sort_name=${sort_name}&keywordSearch=${keywordSearch}">${ status.current }</a></li>
			    </c:forEach>
			    <li class="page-item">
			       <a class="page-link" href="${path}/withduck/joinValFilter?page=${pageInfo.nextPage}&location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&joinStatus=${joinStatus}&sort_name=${sort_name}&keywordSearch=${keywordSearch}" aria-label="Next">다음</a>
			    </li>
	            </ul>
              </c:if>
            </c:if>
        </nav>
        <input type="hidden" id="joinStatus" name="joinStatus" >
    </section>
    </form>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <!--jQuery-->
    <script src="${path }/resources/js/common/jquery-3.6.0.min.js"></script>

    <!-- JavaScripts -->
    <script src="${path }/resources/js/common/plugins.min.js"></script>
    <script src="${path }/resources/js/common/functions.js"></script>
</body>
<jsp:include page="../common/footer.jsp"/>
</html>

<script>
$(function() {
	var joinButton = $('#joinButton');
	
	joinButton.click(function() {
		const formElement = $('#formobj');
		$('#joinStatus').val('모집중');
		$('#keyword').val('${keywordSearch}');
		var keywordSearch = $('#keyword').val()
		formElement.attr("action", "${path}/withduck/joinValFilter?location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&joinStatus=모집중&keywordSearch=" + keywordSearch);
		formElement.attr("method", "get");
		formElement.submit();
	})
});
$(function() {
	var keywordSearch = $('#keywordSearch');

	keywordSearch.click(function() {
		var keywordSearch = $('#keyword').val();
		const formElement = $('#formobj');
		formElement.attr("action", "${path}/withduck/joinValFilter?location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}&joinStatus=모집중&keywordSearch=" +  keywordSearch);
		formElement.attr("method", "get");
		formElement.submit();
	})
});
$(function() {
	var filterSearch = $('#filterSearch');
	
	filterSearch.click(function() {
		const formElement = $('#formobj');
		$('#joinStatus').val('');
		formElement.attr("action", "${path}/withduck/joinValFilter?location_val=${filter_val[0]}&gender_val=${filter_val[1]}&age_val=${filter_val[2]}&start_val=${filter_val[3]}&end_val=${filter_val[4]}&personnel_val=${filter_val[5]}");
		formElement.attr("method", "get");
		formElement.submit();
	})
});
$(document).on('click', '.location_btn', function(){
    $('.location_btn').removeClass('selected');
    sessionStorage.removeItem("location");
    $(this).addClass('selected');
    sessionStorage.setItem("location", $('.location_btn.selected').val());
    $('#btnValueSaveLocation').attr('value', sessionStorage.getItem("location"));
    
});
$(document).on('click', '.gender_btn', function(){
    $('.gender_btn').removeClass('selected');
    sessionStorage.removeItem("gender");
    $(this).addClass('selected');
    sessionStorage.setItem("gender", $('.gender_btn.selected').val());
    $('#btnValueSaveGender').attr('value', sessionStorage.getItem("gender"));
});
$(document).on('click', '.age_btn', function(){
    $('.age_btn').removeClass('selected');
    sessionStorage.removeItem("age");
    $(this).addClass('selected');
    sessionStorage.setItem("age", $('.age_btn.selected').val());
    $('#btnValueSaveAge').attr('value', sessionStorage.getItem("age"));
});

$(document).ready(function() {
	$('#keywordSearch').attr("value", '${keywordSearch}');

	var date = new Date();

    var day = date.getDate();
    var month = date.getMonth() + 1;
    var year = date.getFullYear();

    if (month < 10) month = "0" + month;
    if (day < 10) day = "0" + day;

    var today = year + "-" + month + "-" + day;       
    $("#start").attr("value", "");
    $("#end").attr("value", "");
	   
	if(sessionStorage.getItem("location") !== undefined) {
		for(var i = 0; i < $('button[class="location_btn"]').length; i ++){			
			if($('button[class="location_btn"]').eq(i).attr("value") === sessionStorage.getItem("location")) {
				$('button[class="location_btn"]').eq(i).addClass('selected');
				$('#btnValueSaveLocation').attr('value', sessionStorage.getItem("location"));
			}
		}
	}
	if(sessionStorage.getItem("gender") !== undefined) {
		for(var i = 0; i < $('button[class="gender_btn"]').length; i ++){			
			if($('button[class="gender_btn"]').eq(i).attr("value") === sessionStorage.getItem("gender")) {
				$('button[class="gender_btn"]').eq(i).addClass('selected');
				$('#btnValueSaveGender').attr('value', sessionStorage.getItem("gender"));
			}
		}
	}
	if(sessionStorage.getItem("age") !== undefined) {
		for(var i = 0; i < $('button[class="age_btn"]').length; i ++){			
			if($('button[class="age_btn"]').eq(i).attr("value") === sessionStorage.getItem("age")) {
				$('button[class="age_btn"]').eq(i).addClass('selected');
				$('#btnValueSaveAge').attr('value', sessionStorage.getItem("age"));
			}
		}
	}
	
	if((sessionStorage.getItem('start') != undefined)){
		$('#start').attr('value', sessionStorage.getItem("start"));
	}

	if((sessionStorage.getItem('end') != undefined)) {
	$('#end').attr('value', sessionStorage.getItem("end"));
	}

		
<!--
	if(sessionStorage.getItem('personnel') == null){
	    var gradient_value = 100 / $('.form-range').attr("max");
		$('.form-range').val(0);
	    $('.form-range').css('background', 'linear-gradient(to right, #FFE283 0%, #FFE283 0%'+gradient_value * $('.form-range').val() +'%, rgb(236, 236, 236) ' +gradient_value *  $('.form-range').val() + '%, rgb(236, 236, 236) 100%)');
	} else {
		$('.form-range').on('change', function(){
			sessionStorage.setItem('personnel', $('.form-range').val());
			$('.form-range').attr('value', sessionStorage.getItem('personnel'))
		    var gradient_value = 100 / $('.form-range').attr("max");
		    $('.form-range').css('background', 'linear-gradient(to right, #FFE283 0%, #FFE283 '+gradient_value * $('.form-range').val() +'%, rgb(236, 236, 236) ' +gradient_value *  $('.form-range').val() + '%, rgb(236, 236, 236) 100%)');
		    $('.form-range').attr('value', sessionStorage.getItem('personnel'))
		    console.log(gradient_value * $('.form-range').val());
		});
	}
-->

if(sessionStorage.getItem('personnel')== null) {
	sessionStorage.setItem('personnel', 0);
	
	$('.form-range').attr('value', sessionStorage.getItem('personnel'));
	$('#value2').text(sessionStorage.getItem('personnel')+"명");		
}else {
	$('.form-range').attr('value', sessionStorage.getItem('personnel'));
	$('#value2').text(sessionStorage.getItem('personnel')+"명");		
}

var gradient_value = 100 / document.querySelector('.form-range').attributes.max.value;
$('.form-range').css('background', 'linear-gradient(to right, #FFE283 0%, #FFE283 '+gradient_value * $('.form-range').val() +'%, rgb(236, 236, 236) ' +gradient_value *  $('.form-range').val() + '%, rgb(236, 236, 236) 100%)');

});

function startValidity(e){
   var start = $('#start').val();
	sessionStorage.setItem('start', start);
}

function endValidity(e){
   var end = $('#end').val();
	sessionStorage.setItem('end', end);
}



document.querySelector('.form-range').addEventListener('input',function(event){
    var gradient_value = 100 / event.target.attributes.max.value;
  event.target.style.background = 'linear-gradient(to right, #FFE283 0%, #FFE283 '+gradient_value * event.target.value +'%, rgb(236, 236, 236) ' +gradient_value *  event.target.value + '%, rgb(236, 236, 236) 100%)';
});






</script>