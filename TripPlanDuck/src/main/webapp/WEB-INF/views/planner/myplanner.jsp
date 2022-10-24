<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
//@page import = "java.util.*"
%>
<%
//@page import = "com.tripplan.duck.planner.model.vo.*"
%>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<script src="https://code.jquery.com/jquery-3.6.1.slim.js"
	integrity="sha256-tXm+sa1uzsbFnbXt8GJqsgi2Tw+m4BLGDof6eUPjbtk="
	crossorigin="anonymous"></script>
<jsp:include page="../common/header.jsp" />

<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<!--BootStrap CSS-->
<link rel="stylesheet" type="text/css"
	href="${ path }/resources/css/common/myplanner/myplanner.css">
<link rel="stylesheet" type="text/css"
	href="${ path }/resources/css/common/myplanner/arrow.css">

<link rel="stylesheet" type="text/css"
	href="${ path }/resources/css/daterangepicker.css">
<!--BootStrap JS-->
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
	integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
	crossorigin="anonymous"></script>

<!--  데이트 피커 스크립트 -->
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
<script type="text/javascript"
	src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
<!-- 카카오 api -->
<script type="text/javascript"
	src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=f7b032a05f94f4d597ccea28be03f94f&libraries=services"></script>

<style>
.list-group-item {
	position: relative;
	display: block;
	padding: 0.75rem 1.25rem;
	background-color: #fff;
}

.destImage {
	max-width: 100px;
	max-height: 100px;
}

.customoverlay {
	background-color: #fff8c6;
}

.customoverlay .title {
	background: #fff8c6;
	font-size: 14px;
	font-weight: bold;
}

#numbers {
	font-weight: bold;
	font-size: 17px;
}

#ModalCopy {
	overflow-x: auto;
	white-space: nowrap;
}

#placeCopy {
	width: 8000px;
}

#ModalCopy>#placeCopy>.modalCss {
	float: left;
	margin-right: 70;
}
.hide_daily{
	overflow: auto;
}
.lb-left-weather iframe{
  display: block;
  border: 0;
  width: 100%;
  height: 128px;
  margin-top: -50px;
}


</style>
<section>
<c:if test="${ not empty loginMember }">
	<form id="formId" name="frm" action="${path}/planner/myplannerAction"
		method="post">
		<div class="container-fluid">
			<div class="row">
				<div class="left-box" style="border: none;">
					<div class="list-group" style="border: none;">
						<div class="list-group-item" style="border: none;">
							<select id="locationSelect" name="locationSelect" class="beom"
								onchange="locationValue()" style="size: 30%;">
								<c:forEach items="${ loca }" var="loca" varStatus="status">
									<c:if test="${loca.location == location.location}">
										<option id="location" value="${ loca.locationId }"
											selected="selected">${loca.location}</option>
									</c:if>
									<c:if test="${loca.location != location.location}">
										<option id="location" value="${ loca.locationId }">
											${loca.location}</option>
									</c:if>
								</c:forEach>
							</select>
	
						<div class="list-group-item" style="border: none; font-size: 40;">
							${location.location}
						</div>
							<div class="lb-widget-011">
								<div id="lbl-1" class="lb-left-weather">
									<iframe
										src="https://forecast.io/embed/#lat=${ location.lcenterx }&lon=${ location.lcentery }&name=${ location.locationId }&color=&font=&units=si"></iframe>
								</div>
							</div>
							<!-- 기간 선택시 날짜 출력 -->
							<div class="list-group-item list-group-item-primary"
								style="background-color: white; border: none;" id="datepicker"></div>
							<div class="list-group-item list-group-item-secondary"
								style="background-color: white; border: none;">
								<input type="text" id="demo" name="demo" value="" />
							</div>
						</div>
						<div class="col-12 my-3" style="text-align: center;">
							<!-- 정리되면 마이페이지로 이동하는 식으로 바꿔야함 -->
								<input type="submit" name="location" class="col-5 btn btn-success" value="완 성"> 
							
							<input type="reset" class="col-5 btn btn-success" id="clear" onclick="history.go(0)" value="초기화">
						</div>
						<button type="button" class="btn btn-primary" data-toggle="modal"
							data-target="#staticBackdrop" id="modalTest">경로 보기</button>

					</div>
					<div class="left-box2">
						<div id="divCopy" style="height: 60vh; overflow: auto;">
							<div class="row no-gutters"></div>
							<div id="divCopy_chil" class="col-md-4"></div>
						</div>
					</div>
				</div>
				<div class="col-8">
					<div id="map" style="width: 100%; height: 100%;"></div>
				</div>

				<div class="right-box" style="height: 100%;">
					<div class="courseZero_margin90"></div>
					<!-- 검색창 -->
					<input id="searchBox" type="text" placeholder="검색어를 입력해주세요">
					<div class="divOriginal" style="height: 90vh; overflow: auto;">
						<c:forEach items="${ destination }" var="destination"
							varStatus="status">
							<div id="divOriginal_${ destination.destNo }"
								class="card mb-3 modalCss" style="width: 27vh;">
								<div class="row no-gutters">
									<div class="col-md-4">
										<img class="destImage"
											src="${destination.destImage eq null ? '/duck/images/trip/no.jpeg' : destination.destImage}">
									</div>
									<div class="col-md-8">
										<div style="position: absolute; top: 0; right: 0;">찜:${destination.destLikeSum}</div>
										<div class="card-body">
											<h5 class="card-title" id="subject">${ destination.destSubject }</h5>
											<p class="card-text">${ destination.destContent }</p>
										</div>
									</div>
								</div>
								<div class="addDesti">
									<a id="checkButton" class="material-icons">check</a> <input
										type="hidden" id="destMapX" name="destMapX"
										value="${ destination.destMapX }" /> <input type="hidden"
										id="destMapY" name="destMapY"
										value="${ destination.destMapY }" /> <input type="hidden"
										id="destImage" name="destImage"
										value="${ destination.destImage }"> <input
										type="hidden" id="destSubject" name="destSubject"
										value="${ destination.destSubject }" /> <input type="hidden"
										id="destNo" name="destNo" value="${ destination.destNo }" />
									<input type="hidden" id="destContent" name="destContent"
										value="${ destination.destContent }" />
								</div>
							</div>
						</c:forEach>
					</div>
					<input type="hidden" name="place" id="place"> 
					<input type="hidden" name="imagea" id="imagea"> 
					<input type="text" name="destNos" id="destNos"> 
				</div>
			</div>
		</div>
		<!-- Modal -->
		<div class="modal fade" id="staticBackdrop" data-backdrop="static"
			data-keyboard="false" tabindex="-1"
			aria-labelledby="staticBackdropLabel" aria-hidden="true">
			<div class="modal-dialog modal-xl" id="dhdld">
				<div class="modal-content" >
					<div class="modal-header">
						<h5 class="modal-title" id="staticBackdropLabel">${ location.location } 
						여행지</h5>
						
						
						<div class="arrows">
						  <div class="chevron">12313></div>
						  <div class="chevron">12</div>
						  <div class="chevron">123123</div>
						</div>					
					</div>
					
					<div class="modalUp">
							<div id="ModalCopy">
								<div id="placeCopy"></div>
							</div>
					</div>

					<div class="modal-footer">
						<button type="button" class="btn btn-secondary"
							data-dismiss="modal" onclick="divDelteBtn()">확인</button>
					</div>
				</div>
			</div>
		</div>

	</form>
</c:if>

</section>

<script>
	let locationX = "${location.lcenterx}";
	let locationY = "${location.lcentery}";
	let locationI = "${location.locationId}";

	//모달창에서 클론한 div 삭제
	function divDelteBtn() {
		$('#placeCopy').children('[id^=divOriginal_]').remove();
	};

	//원래의 인풋 박스 값을 받는다.
	var oldVal = $("#searchBox");

	/* 검색 내용 변경 감지 */
	$("#searchBox").on("propertychange change keyup paste input", function() {
		// 변화에 바로바로 반응하면 부하가 걸릴 수 있어서 1초 딜레이를 준다.
		setTimeout(function() {
			// 변경된 현재 박스 값을 받아온다.
			var currentVal = $("#searchBox").val();
			if (currentVal == oldVal) {
				return;
			}
			// forEach의 첫번째 인자값 = 배열 내 현재 값
			// 두번째 값 = index
			// 세번째 값 = 현재 배열
			var listArray = $(".modalCss").toArray();

			listArray.forEach(function(c, i) {
				var currentList = c;
				// 현재 배열값에서 내용 추출
				var currentListText = c.innerText;
				// 검색 내용을 포함하지 않을 경우
				if (currentListText.includes(currentVal) == false) {
					currentList.style.display = "none";
				}
				// 검색 내용을 포함할 경우
				if (currentListText.includes(currentVal)) {
					currentList.style.display = "block";
				}
				// 검색 내용이 없을 경우
				if (currentVal.trim() == "") {
					currentList.style.display = "block";
				}
			});
		}, 1000);
	});

	/*
	 * submit 검색창 변형
	 $(function() {
	 var search = $('#shrud');
	 search.click(function() {

	 const formElement = $('#formId');
	 formElement.attr("action", "${path}/planner/searchDesti");
	 formElement.attr("method", "get");
	 formElement.submit();
	 })
	 });
	 */

	function locationValue() {
		var locationValue = $('#locationSelect').val();
		location.href = "${path}/planner/myplanner?locationSelect="
				+ locationValue;

	}

	//지도api변수들 선언
	var count = 0;
	var markers = [];
	var ovarlays = [];
	var lines = [];
	var names = [];
	var positions = [];
	var data = new Array();
	var imagehttp = new Array();
	var imageSrc = 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbj1sID%2FbtrOmc6KtD6%2FKF00nKO1xpe9nbUlbySxn1%2Fimg.png', // 마커이미지의 주소입니다    
	imageSize = new kakao.maps.Size(40, 60), // 마커이미지의 크기입니다
	imageOption = {
		offset : new kakao.maps.Point(15, 32)
	}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
			imageOption);

	$(document).ready(function() {
		var $set_val = $('#forecast_embed').contents().find('#styleID').attr('href');
		
		$("[class^=addDesti]").on("click",function(event) {

											count = countF(1);

											let destMapX = $(this).children(
													'#destMapX').val().trim();
											let destMapY = $(this).children(
													'#destMapY').val().trim();
											let destSubject = $(this).children('#destSubject').val().replaceAll(" ", "");
											let destNo = $(this).children(
													'#destNo').val().trim();
											let destImage = $(this).children(
													'#destImage').val().trim();
											// 마커 찍기

											names = destSubject.split(',');

											addMarker(new kakao.maps.LatLng(
													destMapX, destMapY),
													destNo, count);

											data.push(destSubject);
											imagehttp.push(destImage);

											$("#place").val(data);
											$("#destNos").val(destNo);
											$("#imagea").val(imagehttp);

											$('#divOriginal_' + destNo)
													.appendTo('#divCopy_chil');

											$('#divCopy')
													.find('.addDesti')
													.replaceWith(
															'<div class="deleteCopyBtn'
																	+ destNo
																	+ '" onclick=deleteDiv('
																	+ destNo
																	+ ',"'
																	+ destSubject
																	+ '","'
																	+ destMapX
																	+ '","'
																	+ destMapY
																	+ '")> <a class="material-icons")>delete</a></div>');

											$('#modalTest')
													.on(
															"click",
															function() {
																// 모달창 복사
																$(
																		'#divOriginal_'
																				+ destNo)
																		.clone()
																		.appendTo(
																				'#placeCopy');

															});

										});

					});

	// 이름 옆에 숫자 증가
	function countF(a) {

		if (a == 1) {
			count++;
		} else {
			count = 0;
		}
		return count;

	}

	// 마커를 생성하고 지도위에 표시하는 함수입니다
	function addMarker(position, destNo, count) {

		//  alert(destNo);

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
			position : position,
			image : markerImage

		});

		var content = '<div class="customoverlay" id="selectArea'+destNo+'">'
				+ '<a>' + '     <span id="numbers">' + count
				+ '<span> <span class="title">' + names + '</span> ' + '</a>'
				+ '</div>';

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		var customOverlay = new kakao.maps.CustomOverlay({
			map : map,
			position : position,
			content : content,
			yAnchor : 2.2
		});

		// 생성된 마커를 배열에 추가합니다
		markers.push(marker);
	}

	/*
	 * 
	 //지도상의 선 긋기
	 const lookCourseBtn = document.getElementById('lookCourseBtn');
	 lookCourseBtn.addEventListener('click', event =>{
	
	 for (var i = 0; i < ovarlays.length; i++){
	 ovarlays[i].setMap(null);
	 }  
	 ovarlays = [];
	 addLine(markers);

	 });
	
	 function addLine(markers){
	 var linePath=[];      
	 for (i=0; i < markers.length; ++i){
	 linePath.push(markers[i].getPosition()); 
	 }   

	 // 지도에 표시할 선을 생성합니다
	 var polyline = new kakao.maps.Polyline({
	
	 path: linePath, // 선을 구성하는 좌표배열 입니다
	 strokeWeight: 2, // 선의 두께 입니다
	 strokeColor: 'red', // 선의 색깔입니다
	 strokeOpacity: 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
	 strokeStyle: 'solid' // 선의 스타일입니다
	 });
	
	 lines.push(polyline);
	 // 지도에 선을 표시합니다 
	 polyline.setMap(map); 
	 }
	 */

	//일반 딜리트
	function deleteDiv(destNo, destSubject, destMapX, destMapY) {

		//names = destSubject.split(',');
		$("#selectArea" + destNo).text("");

		$('#divCopy_chil').children('#divOriginal_' + destNo).remove();

		$('#placeCopy').children('#divOriginal_' + destNo).remove();

		for (var i = 0; i < data.length; i++) {

			if (data[i] == destSubject) {
				markers[i].setMap(null);
				data.splice(i, 1);
				imagehttp.splice(i, 1);
				markers.splice(i, 1);
				positions.splice(i, 1);
				ovarlays.splice(i, 1);
				$("#place").val(data);
				$("#imagea").val(imagehttp);
			}
		}

		if (data == null || data == "") {
			countF(2);
		}
	};
</script>


<script type="text/javascript"
	src="${ path }/resources/js/planner/mapcreate.js"></script>
<jsp:include page="../common/footer.jsp" />


<script type="text/javascript"
	src="${ path }/resources/js/daterangepicker.js"></script>
<script type="text/javascript" src="${ path }/resources/js/date/date.js"></script>

<script type="text/javascript"
	src="${ path }/resources/js/planner/mapex.js"></script>
<script type="text/javascript"
	src="${ path }/resources/js/planner/weather.js"></script>
