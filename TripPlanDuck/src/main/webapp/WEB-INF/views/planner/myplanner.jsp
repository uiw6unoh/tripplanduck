<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<c:set var="path" value="${ pageContext.request.contextPath }" />
<jsp:include page="/views/common/Header.html" />
<script src="${ path }/resources/js/jquery-3.6.0.js"></script>

<!-- Bootstrap core CSS -->
<!--BootStrap CSS-->
<link rel="stylesheet" type="text/css"
	href="${ path }/resources/css/album.css">

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

<script type="text/javascript"
	src="${ path }/resources/js/daterangepicker.js"></script>

<style>
</style>
<section>
	<div class="container-fluid">

		<div class="row">
			<div class="col-2">
				<div class="list-group">
					<div class="list-group-item">여행지 이름</div>
					<div class="list-group-item list-group-item-primary">여행 기간</div>
					<div class="list-group-item list-group-item-secondary">
						<input type="text" id="demo" name="demo" value="" />

						<script>
								$(function() {
									$('input[name="daterange"]').daterangepicker(
													{
														opens : 'left'
													},
													function(start, end, label) {
														console
																.log("A new date selection was made: "
																		+ start
																				.format('YYYY-MM-DD')
																		+ ' to '
																		+ end
																				.format('YYYY-MM-DD'));
													});
								});
							</script>
					</div>
					<div class="list-group-item list-group-item-success">일정 도는데
						걸리는 시간</div>

					<!-- 
		  <div class="list-group-item list-group-item-warning">A simple warning list group item</div>
		  <div class="list-group-item list-group-item-info">A simple info list group item</div>
		  <div class="list-group-item list-group-item-light">A simple light list group item</div>
		  <div class="list-group-item list-group-item-dark">A simple dark list group item</div>
		   -->
				</div>
				<div class="col-12 my-3" style="text-align: center;">
					<button type="button" class="col-5 btn btn-success">완 성</button>
					<button type="button" class="col-5 btn btn-danger"
						onclick="rightclick">초기화</button>
				</div>
			</div>
			<!-- 일단 좌표까지 나오게해서 좌표 등록하고 사진 등록예정 -->
			<div class="col-8">
				<div id="map" style="width: 100%; height: 100vh;"></div>


				<p id="result"></p>


				<script type="text/javascript"
					src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=f7b032a05f94f4d597ccea28be03f94f&libraries=services"></script>
				<script>
						// 마커를 클릭하면 장소명을 표출할 인포윈도우 입니다
						var infowindow = new kakao.maps.InfoWindow({
							zIndex : 1
						});

						var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
						mapOption = {
							center : new kakao.maps.LatLng(37.5662, 126.9784), // 지도의 중심좌표
							level : 10
						// 지도의 확대 레벨

						};

						// 지도를 생성합니다    
						var map = new kakao.maps.Map(mapContainer, mapOption);
						
						// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
						var mapTypeControl = new kakao.maps.MapTypeControl();

						// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
						// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
						map.addControl(mapTypeControl,
								kakao.maps.ControlPosition.TOPRIGHT);

						// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
						var zoomControl = new kakao.maps.ZoomControl();
						map.addControl(zoomControl,
								kakao.maps.ControlPosition.RIGHT);

						// 주소-좌표 변환 객체를 생성합니다
						var geocoder = new kakao.maps.services.Geocoder();

						// 지도에 클릭 이벤트를 등록합니다
						// 지도를 클릭하면 마지막 파라미터로 넘어온 함수를 호출합니다
						kakao.maps.event.addListener(map, 'click', function(
								mouseEvent) {

							// 클릭한 위도, 경도 정보를 가져옵니다 
							var latlng = mouseEvent.latLng;

							var message = '경도,위도: '
									+ latlng.getLat() + ', ' + latlng.getLng();

							var resultDiv = document.getElementById('result');
							resultDiv.innerHTML = message;
6						});
						var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
						var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
						var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
						var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
						var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

						// 지도에 클릭 이벤트를 등록합니다
						// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
						var markers1 = [];
						function addMarker(position) {

							// 마커를 생성합니다
							var marker = new kakao.maps.Marker({
								position : position
							});

							// 마커가 지도 위에 표시되도록 설정합니다
							marker.setMap(map);

							// 생성된 마커를 배열에 추가합니다
							markers1.push(marker);
						}

						// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
						function setMarkers1(map) {
							for (var i = 0; i < markers1.length; i++) {
								markers1[i].setMap(map);
							}
						}

						kakao.maps.event.addListener(map, 'click', function(
								mouseEvent) {
							// 마우스로 클릭한 위치입니다 
							var clickPosition = mouseEvent.latLng;
							addMarker(mouseEvent.latLng);

							// 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
							if (!drawingFlag) {

								// 상태를 true로, 선이 그리고있는 상태로 변경합니다
								drawingFlag = true;

								// 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
								deleteClickLine();

								// 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
								deleteDistnce();

								// 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
								deleteCircleDot();

								// 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
								clickLine = new kakao.maps.Polyline({
									map : map, // 선을 표시할 지도입니다 
									path : [ clickPosition ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
									strokeWeight : 3, // 선의 두께입니다 
									strokeColor : '#db4040', // 선의 색깔입니다
									strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
									strokeStyle : 'solid' // 선의 스타일입니다
								});

								// 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
								moveLine = new kakao.maps.Polyline({
									strokeWeight : 3, // 선의 두께입니다 
									strokeColor : '#db4040', // 선의 색깔입니다
									strokeOpacity : 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
									strokeStyle : 'solid' // 선의 스타일입니다    
								});

								// 클릭한 지점에 대한 정보를 지도에 표시합니다
								displayCircleDot(clickPosition, 0);

							} else { // 선이 그려지고 있는 상태이면

								// 그려지고 있는 선의 좌표 배열을 얻어옵니다
								var path = clickLine.getPath();

								// 좌표 배열에 클릭한 위치를 추가합니다
								path.push(clickPosition);

								// 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
								clickLine.setPath(path);

								var distance = Math
										.round(clickLine.getLength());
								displayCircleDot(clickPosition, distance);
							}
						});

						// 지도에 마우스무브 이벤트를 등록합니다
						// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
						kakao.maps.event
								.addListener(
										map,
										'mousemove',
										function(mouseEvent) {

											// 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
											if (drawingFlag) {

												// 마우스 커서의 현재 위치를 얻어옵니다 
												var mousePosition = mouseEvent.latLng;

												// 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
												var path = clickLine.getPath();

												// 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
												var movepath = [
														path[path.length - 1],
														mousePosition ];
												moveLine.setPath(movepath);
												moveLine.setMap(map);

											}
										});

						// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
						// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
						
						kakao.maps.event
								.addListener(
										map,
										'rightclick',
										function(mouseEvent) {

											// 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
											if (drawingFlag) {

												// 마우스무브로 그려진 선은 지도에서 제거합니다
												moveLine.setMap(null);
												moveLine = null;

												// 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
												var path = clickLine.getPath();

												// 선을 구성하는 좌표의 개수가 2개 이상이면
												if (path.length > 1) {

													// 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
													if (dots[dots.length - 1].distance) {
														dots[dots.length - 1].distance
																.setMap(null);
														dots[dots.length - 1].distance = null;
													}

													var distance = Math
															.round(clickLine
																	.getLength()), // 선의 총 거리를 계산합니다
													content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다

													// 그려진 선의 거리정보를 지도에 표시합니다
													showDistance(
															content,
															path[path.length - 1]);

												} else {

													// 선을 구성하는 좌표의 개수가 1개 이하이면 
													// 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
													deleteClickLine();
													deleteCircleDot();
													deleteDistnce();

												}

												// 상태를 false로, 그리지 않고 있는 상태로 변경합니다
												drawingFlag = false;
											}
										});

						// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
						function deleteClickLine() {
							if (clickLine) {
								clickLine.setMap(null);
								clickLine = null;
								setMarkers1(null);
							}
						}

						// 그려지고 있는 선의 총거리 정보와 
						// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
						function deleteDistnce() {
							if (distanceOverlay) {
								distanceOverlay.setMap(null);
								distanceOverlay = null;
							}
						}

						// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
						// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
						function displayCircleDot(position, distance) {

							// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
							var circleOverlay = new kakao.maps.CustomOverlay({
								content : '<span class="dot"></span>',
								position : position,
								zIndex : 1
							});

							// 지도에 표시합니다
							circleOverlay.setMap(map);

							// 배열에 추가합니다
							dots.push({
								circle : circleOverlay,
								distance : distanceOverlay
							});
						}

						// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
						function deleteCircleDot() {
							var i;

							for (i = 0; i < dots.length; i++) {
								if (dots[i].circle) {
									dots[i].circle.setMap(null);
								}

								if (dots[i].distance) {
									dots[i].distance.setMap(null);
								}
							}

							dots = [];
						}
						// 장소 검색 객체를 생성합니다
						var ps = new kakao.maps.services.Places();

						// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
						var infowindow = new kakao.maps.InfoWindow({
							zIndex : 1
						});

						// 키워드로 장소를 검색합니다
						searchPlaces();

						// 키워드 검색을 요청하는 함수입니다
						function searchPlaces() {

							var keyword = document.getElementById('keyword').value;

							if (!keyword.replace(/^\s+|\s+$/g, '')) {
								alert('장소를 입력해주세요!');
								return false;
							}

							// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
							// 이 부분에 DB가 들어가야할거같음!!!!!!!!!! api 또는 DB로 값 불러오기
							ps.keywordSearch(keyword,placesSearchCB);
						}

						// 키워드 검색 완료 시 호출되는 콜백함수 입니다
						function placesSearchCB(data, status, pagination) {
							if (status === kakao.maps.services.Status.OK) {

								// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
								// LatLngBounds 객체에 좌표를 추가합니다
								var bounds = new kakao.maps.LatLngBounds();

								for (var i = 0; i < data.length; i++) {
									displayMarker(data[i]);
									bounds.extend(new kakao.maps.LatLng(
											data[i].y, data[i].x));
								}

								// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
								map.setBounds(bounds);
							}
						}

						// 지도에 마커를 표시하는 함수입니다
						function displayMarker(place) {

							// 마커를 생성하고 지도에 표시합니다
							var marker1 = new kakao.maps.Marker({
								map : map,
								position : new kakao.maps.LatLng(place.y,
										place.x)
							});

						}
						
					</script>

			</div>
			<div class="col-2">
				<div id="menu_wrap" class="bg_white">
					<div class="option">
						<div>
							<form onsubmit="searchPlaces(); return false;">
								<input type="text" value="" id="keyword" size="30">
								<button type="submit">검색하기</button>
							</form>
						</div>
					</div>
					<hr>
					<ul id="placesList"></ul>
					<div id="pagination"></div>
				</div>
			</div>
		</div>
	</div>
</section>
