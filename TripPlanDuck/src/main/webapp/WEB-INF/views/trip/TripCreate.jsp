<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>
<jsp:useBean id="now" class="java.util.Date" />
<fmt:formatDate value="${now}" pattern="yyyy.MM.dd HH:mm" var="now" />

<jsp:include page="../common/header.jsp"/>

<!-- Map CSS-->
<link rel="stylesheet" type="text/css"	href="${ path }/resources/css/common/map/map.css">

<section>
<c:if test="${ loginMember.memberNo eq 1}">
	<div class="container">
		<h2 class="mt-2">여행지 등록</h2>
		<form id="sortBy" action="${ path }/trip/create" method="post" enctype="multipart/form-data">
		
			<div class="container">
			<br><br>
			
			<label for="location" class="form-label" style="font-size: 2em;">지역명</label> 
				<select id="locationId" name="locationId" onchange="locationValue()">
						<c:forEach items="${ location }" var="location" varStatus="status">
						
									<c:if test="${loca.location == location.location}">
										<option id="location" value="${ location.locationId }" selected="selected">${location.location}</option>
									</c:if>
									
									<c:if test="${loca.location != location.location}">
										<option id="location" value="${ location.locationId }">${ location.location }</option>
									</c:if>
								</c:forEach>
				</select>
				<label for="category" class="form-label" style="font-size: 2em;">여행지요약정보</label> 
				<select id="destSummary" name="destSummary">
					<option value="문화시설">문화시설</option>
					<option value="축제/공연/행사">축제/공연/행사</option>
					<option value="레포츠">레포츠</option>
					<option value="음식">음식</option>
					<option value="관광지">관광지</option>
					<option value="쇼핑">쇼핑</option>
					<option value="여행코스">여행코스</option>
					<option value="숙박">숙박</option>
				</select>
				
				
				
				
				<br> <br>
				
				<label for="projectName" class="form-label" style="font-size: 2em;">관광지명</label> 
				
				<input type="text" required class="form-control" name="destSubject" id="destSubject" placeholder="제목을 적어주세요"> 
				
				<label for="destAddress"  class="form-label mt-2">주소</label> 
				<input type="text" class="form-control" name="destAddress" id="destAddress"  required placeholder="주소를 적어주세요">
				
				<label for="projectName" class="form-label mt-2">여행지 상세내용</label>
		
				<div id="editor" class="ql-container ql-snow">
					<textarea name="destContent" id="destContent" class="form-control"
						data-gramm="false" contenteditable="true" maxlength='250' rows="8" placeholder="여행지의 주요 내용을 간략하게 적어주세요" > </textarea>
				</div>
					<label class="mt-3 mb-4 form-label"></label>
					<!-- file add -->
					
					<input type="file" name="upfile" id="upfile"> 
					<input type="hidden" id="mNo" name="mNo"> 
					<input type="hidden" id="destMapX" name="destMapX" value=""> 
					<input type="hidden" id="destMapY" name="destMapY" value="">
					<input type="hidden" id="destCategory" name="destCategory" value="${ loca.location }">
			</div>
		</form>
		
		<!-- map API  -->
		<br>
		<p style="font-weight: bold; font-size: 1.2em" >지도에서 마커를 클릭해주세요</p>
		<div class="map_wrap mt-3">
			<div id="map"
				style="width: 100%; height: 100%; position: relative; overflow: hidden;"></div>
		
			<div id="menu_wrap" class="bg_white">
				<div class="option">
					<div>
						<form onsubmit="searchPlaces(); return false;">
							키워드 : <input type="text" value="맛집" id="keyword" size="15">
							<button type="submit">검색하기</button>
						</form>
					</div>
				</div>
				<hr>
				<ul id="placesList"></ul>
				<div id="pagination"></div>
			</div>
		</div>
		<p style="font-weight: bold; font-size: 1.2em">위도, 경도가 표시되어야 완료입니다.</p>
		위도 : <div id="MapX"></div>
		경도 : <div id="MapY"></div>
		
		<div class="d-flex justify-content-end mt-4">
			<button type="button" onclick="history.back()" name="button"
				class="btn btn-light btn-outline-dark m-0">초기화</button>
			<button id="btnSave" type="submit" class="btn btn-success m-0 ms-2"  form="sortBy">확인</button>
		</div>
	</div>
</c:if>
</section>

<jsp:include page="../common/footer.jsp" />

<!-- sweetalert2 alert -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>

<script type="text/javascript" 	src="https://dapi.kakao.com/v2/maps/sdk.js?appkey=f7b032a05f94f4d597ccea28be03f94f&libraries=services"></script>
<script>

function locationValue() {
	var locationValue = $('#locationId').val();
	location.href = "${path}/trip/create?locationId="+locationValue;
}

	var markers = [];

	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
	mapOption = {
		center : new kakao.maps.LatLng(33.36209328052907, 126.53147109994914), // 지도의 중심좌표
		level : 9
	// 지도의 확대 레벨
	};

	// 지도를 생성합니다    
	var map = new kakao.maps.Map(mapContainer, mapOption);

	// 장소 검색 객체를 생성합니다
	var ps = new kakao.maps.services.Places();

	// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
	var infowindow = new kakao.maps.InfoWindow({
		zIndex : 1
	});

	// 키워드로 장소를 검색합니다
	searchPlaces();

	//일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	// 키워드 검색을 요청하는 함수입니다
	function searchPlaces() {

		var keyword = document.getElementById('keyword').value;

		if (!keyword.replace(/^\s+|\s+$/g, '')) {
			alert('키워드를 입력해주세요!');
			return false;
		}

		// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
		ps.keywordSearch(keyword, placesSearchCB);
	}

	// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
	function placesSearchCB(data, status, pagination) {
		if (status === kakao.maps.services.Status.OK) {

			// 정상적으로 검색이 완료됐으면
			// 검색 목록과 마커를 표출합니다
			displayPlaces(data);

			// 페이지 번호를 표출합니다
			displayPagination(pagination);

		} else if (status === kakao.maps.services.Status.ZERO_RESULT) {

			alert('검색 결과가 존재하지 않습니다.');
			return;

		} else if (status === kakao.maps.services.Status.ERROR) {

			alert('검색 결과 중 오류가 발생했습니다.');
			return;

		}
	}

	// 검색 결과 목록과 마커를 표출하는 함수입니다
	function displayPlaces(places) {

		var listEl = document.getElementById('placesList'), menuEl = document
				.getElementById('menu_wrap'), fragment = document
				.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';

		// 검색 결과 목록에 추가된 항목들을 제거합니다
		removeAllChildNods(listEl);

		// 지도에 표시되고 있는 마커를 제거합니다
		removeMarker();

		for (var i = 0; i < places.length; i++) {

			// 마커를 생성하고 지도에 표시합니다
			var placePosition = new kakao.maps.LatLng(places[i].y, places[i].x), marker = addMarker(
					placePosition, i), itemEl = getListItem(i, places[i]); // 검색 결과 항목 Element를 생성합니다

			// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
			// LatLngBounds 객체에 좌표를 추가합니다
			bounds.extend(placePosition);

			// 마커와 검색결과 항목에 mouseover 했을때
			// 해당 장소에 인포윈도우에 장소명을 표시합니다
			// mouseout 했을 때는 인포윈도우를 닫습니다  
			(function(marker, title) {
				kakao.maps.event.addListener(marker, 'mouseover', function() {
					displayInfowindow(marker, title);
				});

				kakao.maps.event.addListener(marker, 'mouseout', function() {
					infowindow.close();
				});

				itemEl.onmouseover = function() {
					displayInfowindow(marker, title);
				};

				itemEl.onmouseout = function() {
					infowindow.close();
				};

				/*  itemEl.onclick = function (index, places) {
				     var latlng = mouseEvent.latLng; 
				    
				    console.log("클릭:");
				    console.log(places.address_name);
				 } */

			})(marker, places[i].place_name);

			fragment.appendChild(itemEl);
		}

		// 검색결과 항목들을 검색결과 목록 Elemnet에 추가합니다
		listEl.appendChild(fragment);
		menuEl.scrollTop = 0;

		// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
		map.setBounds(bounds);
	}

	// 검색결과 항목을 Element로 반환하는 함수입니다
	function getListItem(index, places) {

		var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
				+ (index + 1)
				+ '"></span>'
				+ '<div class="info">'
				+ '   <h5>'
				+ places.place_name + '</h5>';

		if (places.road_address_name) {
			itemStr += '    <span>' + places.road_address_name + '</span>'
					+ '   <span class="jibun gray">' + places.address_name
					+ '</span>';
		} else {
			itemStr += '    <span>' + places.address_name + '</span>';
		}

		itemStr += '  <span class="tel">' + places.phone + '</span>' + '</div>';

		el.innerHTML = itemStr;
		el.className = 'item';
		return el;
	}

	// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
	function addMarker(position, idx, title) {
		var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
		imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
		imgOptions = {
			spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
			spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
			offset : new kakao.maps.Point(13, 37)
		// 마커 좌표에 일치시킬 이미지 내에서의 좌표
		}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
				imgOptions), marker = new kakao.maps.Marker({
			position : position, // 마커의 위치

			image : markerImage
		});

		const coord = document.getElementById('coord');

		kakao.maps.event.addListener(marker, 'click', function() {
			console.log(Object.values(position)[0]);
			/* var mapContainer = document.getElementById('map'), // 지도를 표시할 div
			mapOption = {
			        center: new kakao.maps.LatLng(Object.values(position)[1],Object.values(position)[0]), // 지도의 중심좌표
			        level: 5 // 지도의 확대 레벨
			}; */

			var moveLatLon = new kakao.maps.LatLng(Object.values(position)[1],
					Object.values(position)[0]);
			map.setLevel(5);
			// 지도 중심을 부드럽게 이동시킵니다
			// 만약 이동할 거리가 지도 화면보다 크면 부드러운 효과 없이 이동합니다
			map.panTo(moveLatLon);

			// 지도를 1레벨 올립니다 (지도가 축소됩니다)

			MapX.innerHTML = Object.values(position)[1];
			MapY.innerHTML = Object.values(position)[0];
			$('input[name=destMapX]').attr('value',Object.values(position)[1]);
			$('input[name=destMapY]').attr('value',Object.values(position)[0]);
		});

		marker.setMap(map); // 지도 위에 마커를 표출합니다
		markers.push(marker); // 배열에 생성된 마커를 추가합니다

		return marker;
	}

	// 지도 위에 표시되고 있는 마커를 모두 제거합니다
	function removeMarker() {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(null);
		}
		markers = [];
	}

	// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
	function displayPagination(pagination) {
		var paginationEl = document.getElementById('pagination'), fragment = document
				.createDocumentFragment(), i;

		// 기존에 추가된 페이지번호를 삭제합니다
		while (paginationEl.hasChildNodes()) {
			paginationEl.removeChild(paginationEl.lastChild);
		}

		for (i = 1; i <= pagination.last; i++) {
			var el = document.createElement('a');
			el.href = "#";
			el.innerHTML = i;

			if (i === pagination.current) {
				el.className = 'on';
			} else {
				el.onclick = (function(i) {
					return function() {
						pagination.gotoPage(i);
					}
				})(i);
			}

			fragment.appendChild(el);
		}
		paginationEl.appendChild(fragment);
	}

	// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
	// 인포윈도우에 장소명을 표시합니다
	function displayInfowindow(marker, title) {
		var content = '<div style="padding:5px;z-index:1;">' + title + '</div>';

		infowindow.setContent(content);
		infowindow.open(map, marker);
	}

	// 검색결과 목록의 자식 Element를 제거하는 함수입니다
	function removeAllChildNods(el) {
		while (el.hasChildNodes()) {
			el.removeChild(el.lastChild);
		}
	}
</script>