
	var markers = [];
	var ovarlays = [];
	var lines = [];
	var names = [];
	
     
	var mapContainer = document.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : new kakao.maps.LatLng(37.54358784304751, 126.98080883930932),

		// 지도의 중심좌표
		level : 9
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
	

	function asd(aaa) {
		map.setCenter(aaa);

		mapOption = {
			// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
			center : aaa,
			// 지도의 중심좌표
			level :9
		// 지도의 확대 레벨
		};

	}