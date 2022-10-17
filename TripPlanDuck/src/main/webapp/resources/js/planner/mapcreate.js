
	var markers = [];
	var ovarlays = [];
	var lines = [];
	var names = [];
	
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
	
/*
	kakao.maps.event.addListener(map, 'click', function(mouseEvent) {
		// 클릭한 위치에 마커를 표시합니다 
		addMarker: addMarker
	});
	
	// 마커를 생성하고 지도위에 표시하는 함수입니다
	function addMarker(position) {

		// 마커를 생성합니다
		var marker = new kakao.maps.Marker({
		   position: markerPosition
		 });

		// 마커가 지도 위에 표시되도록 설정합니다
		marker.setMap(map);

		// 생성된 마커를 배열에 추가합니다
		markers.push(marker);
	}
	// 배열에 추가된 마커들을 지도에 표시하거나 삭제하는 함수입니다
	function setMarkers(map) {
		for (var i = 0; i < markers.length; i++) {
			markers[i].setMap(map);
		}
	}
*/
	function asd(aaa) {
		map.setCenter(aaa);

		mapOption = {
			// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
			center : aaa,
			// 지도의 중심좌표
			level : 9
		// 지도의 확대 레벨
		};

	}