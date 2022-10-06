<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<script src="https://code.jquery.com/jquery-3.6.1.slim.js"
	integrity="sha256-tXm+sa1uzsbFnbXt8GJqsgi2Tw+m4BLGDof6eUPjbtk="
	crossorigin="anonymous"></script>

<jsp:include page="../common/header.jsp" />

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
	<form action="${ path }/planner/myplanner" method="post">
		<div class="container-fluid">
			<div class="row">
				<div class="left-box">
					<div class="list-group">
						<div class="list-group-item">
						
							<select id="locationSelect" onchange="locationValue(this)">
								<c:forEach items="${ location }" var="location" varStatus="i">
									<option id="location" name="location"
										value="${ location.locationId }">${ location.location }
									</option>
									<br>
								</c:forEach>
							</select>
							<input type="hidden" id="locationInput" name="locationInput" value="" />
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
					</div>
					<input type="hidden" id="card-plus-btn">
				</div>
			</div>
		</div>
	</form>
</section>

<script>
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
	
	
	
	$('#locationSelect').change(function(){
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
	src="${ path }/resources/js/planner/map.js"></script>
