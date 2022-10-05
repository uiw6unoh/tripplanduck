<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

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
	/* border: 1px solid rgba(0,0,0,.125); */
}
</style>

<section>
	<div class="container-fluid">
		<div class="row">
			<div class="left-box">
				<div class="list-group">
					<div class="list-group-item">
						<select id="locationSelect" onchange="locationValue(this)">
							<c:forEach items="${ location }" var="location"
								varStatus="status">
								<option id="location" name="location" value="${ location }">${ location.location }
								</option>
								<br>

							</c:forEach>
						</select>
						<div>
							<input type="hidden" id="location1" name="location"
								value="${ location }" style="display: none;" />
						</div>
					</div>
					<div class="list-group-item list-group-item-primary"
						style="background-color: white;">여행 기간</div>
					<div class="list-group-item list-group-item-secondary"
						style="background-color: white;">
						<input type="text" id="demo" name="demo" value="" />
					</div>
				</div>
				<div class="col-12 my-3" style="text-align: center;">
					<!-- 정리되면 마이페이지로 이동하는 식으로 바꿔야함 -->
					<button type="submit" class="col-5 btn btn-success">완 성</button>
					<button type="reset" class="col-5 btn btn-danger">초기화</button>
				</div>
			</div>

			<div class="col-8">
				<div id="map" style="width: 100%; height: 100vh;"></div>
				<p id="result"></p>
			</div>



			<div class="right-box">
				<div class="courseZero_margin90"></div>

				<div id="right-box1">

					<input id="searchBox" type="text" placeholder="검색어를 입력해주세요">
					<button id="magBtn">
						<i class="fas fa-search">검색</i>
					</button>
					<div>
						<c:forEach items="${ destination }" var="destination"
							varStatus="status">
							<div class="card mb-3" style="max-width: 540px;">
								<div class="row no-gutters">
									<div class="col-md-4">
										<img
											src="data:image/jpeg;base64,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"
											alt="...">
									</div>
									<div class="col-md-8">
										<div class="card-body">
											<h5 class="card-title" id="subject">>${ destination.destSubject }</h5>
											<p class="card-text">${ destination.destContent }</p>
											<input type="hidden" id="destMapX" name="destMapX"
												value="${ destination.destMapX }" /> <input type="hidden"
												id="destMapY" name="destMapY"
												value="${ destination.destMapY }" />
										</div>
									</div>
									<input type="hidden" id="destination1" name="destination1"
										value="${ destination }" /> 
								</div>
								<div class="addDesti" onclick="addMarkerBtn(${destination.destNo})">
									<a class="material-icons" >check</a>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>
				<input type="hidden" id="card-plus-btn">
			</div>
		</div>
	</div>
</section>

<script>
/*
 * 
$(document).ready(() => {
	$("[class^=addMarkerBtn]").on("click", () => {
		console.log(this);
		let destMapX = $("#destMapX").val().trim();			
		
		let destMapY = $("#destMapY").val().trim();			
		
		let destSubject = $("#subject").val().trim();
		$.ajax({
			type: "GET",
			url: "${ path }/planner/addDesti",
			dataType: "json",
			data: {
				"destSubject": destSubject,
				"destMapX": destMapX,
				"destMapY": destMapY
				
			},
			success: (obj) => {
				console.log(obj.destMapX);
				console.log(obj.destMapY);
				
			}, 
			error: (error) => {
				console.log(error);
			}
		});
	});
});
 */



	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : new kakao.maps.LatLng(37.54358784304751, 126.98080883930932),

		// 지도의 중심좌표
		level : 10
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(mapContainer, mapOption);

	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	$('#locationSelect').change(function() {
		var locationSelect = $(this).find(':selected').data('locationSelect');

		$("#locationInput").val(location);
		console.log(locationSelect);
	});
	
	
</script>

<jsp:include page="../common/footer.jsp" />


<script type="text/javascript"
	src="${ path }/resources/js/daterangepicker.js"></script>
<script type="text/javascript" src="${ path }/resources/js/date/date.js"></script>

<script type="text/javascript"
	src="${ path }/resources/js/planner/mapex.js"></script>
<script type="text/javascript"
	src="${ path }/resources/js/planner/addMarker.js"></script>
