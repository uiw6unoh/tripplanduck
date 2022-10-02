var Seoul = new kakao.maps.LatLng(
		37.54358784304751,
		126.98080883930932);
var Gyeonggi = new kakao.maps.LatLng(
		37.53242386741321,
		127.24075867231213);
var Gangwon = new kakao.maps.LatLng(
		37.86127024714858,
		128.3062791982436);
var Chungcheong = new kakao.maps.LatLng(
		36.804023254362534, 127.64437378489698);
var Jeonla = new kakao.maps.LatLng(
		34.92131886632381,
		126.9064957042627);
var Gyeongsang = new kakao.maps.LatLng(
		36.41367451355485,
		128.77419586407058);
var Daegu = new kakao.maps.LatLng(
		35.871403407566355,
		128.60182699308476);
var Daejon = new kakao.maps.LatLng(
		36.35058445950679,
		127.38467910564007);
var Gwangju = new kakao.maps.LatLng(
		37.45586506841309,
		126.98080883930932);
var Ulsan = new kakao.maps.LatLng(
		35.5390202078351,
		129.311344398614);
var Incheon = new kakao.maps.LatLng(
		37.45586506841309,
		126.98080883930932);
var Jeju = new kakao.maps.LatLng(
		33.4995159328815,
		126.531098007969);
		
		
// 지역별로 중심좌표 설정
var locationValue = (target) => {
	  // 선택한 option의 value 값
	  console.log(target.value);
	  
	  if (target.value == 1) {

			var mapContainer = document
					.getElementById('map'), // 지도를 표시할 div 

			mapOption = {
				// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
				center : Seoul,

				// 지도의 중심좌표
				level : 10
			// 지도의 확대 레벨
			};
	
			// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
			var map = new kakao.maps.Map(
					mapContainer, mapOption);

			var mapTypeControl = new kakao.maps.MapTypeControl();

			// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
			// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
			map
					.addControl(
							mapTypeControl,
							kakao.maps.ControlPosition.TOPRIGHT);

			// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
			var zoomControl = new kakao.maps.ZoomControl();
			map
					.addControl(
							zoomControl,
							kakao.maps.ControlPosition.RIGHT);

		}else if(target.value == 2){

				var mapContainer = document
						.getElementById('map'), // 지도를 표시할 div 

				mapOption = {
					// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
					center : Gyeonggi,

					// 지도의 중심좌표
					level : 10
				// 지도의 확대 레벨
				};
				// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
				var map = new kakao.maps.Map(
						mapContainer, mapOption);

				var mapTypeControl = new kakao.maps.MapTypeControl();

				// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
				// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
				map
						.addControl(
								mapTypeControl,
								kakao.maps.ControlPosition.TOPRIGHT);

				// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
				var zoomControl = new kakao.maps.ZoomControl();
				map
						.addControl(
								zoomControl,
								kakao.maps.ControlPosition.RIGHT);

		}else if(target.value == 3){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : Gangwon,

		// 지도의 중심좌표
		level : 10
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(
			mapContainer, mapOption);

	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map
			.addControl(
					mapTypeControl,
					kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map
			.addControl(
					zoomControl,
					kakao.maps.ControlPosition.RIGHT);

		}else if(target.value == 4){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : Chungcheong,

		// 지도의 중심좌표
		level : 10
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(
			mapContainer, mapOption);

	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map
			.addControl(
					mapTypeControl,
					kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map
			.addControl(
					zoomControl,
					kakao.maps.ControlPosition.RIGHT);

		}else if(target.value == 5){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : Jeonla,

		// 지도의 중심좌표
		level : 10
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(
			mapContainer, mapOption);

	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map
			.addControl(
					mapTypeControl,
					kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map
			.addControl(
					zoomControl,
					kakao.maps.ControlPosition.RIGHT);

		}else if(target.value == 6){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : Gyeongsang,

		// 지도의 중심좌표
		level : 10
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(
			mapContainer, mapOption);

	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map
			.addControl(
					mapTypeControl,
					kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map
			.addControl(
					zoomControl,
					kakao.maps.ControlPosition.RIGHT);

		}else if(target.value == 7){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : Daegu,

		// 지도의 중심좌표
		level : 10
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(
			mapContainer, mapOption);

	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map
			.addControl(
					mapTypeControl,
					kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map
			.addControl(
					zoomControl,
					kakao.maps.ControlPosition.RIGHT);

		}else if(target.value == 8){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : Daejon,

		// 지도의 중심좌표
		level : 10
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(
			mapContainer, mapOption);

	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map
			.addControl(
					mapTypeControl,
					kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map
			.addControl(
					zoomControl,
					kakao.maps.ControlPosition.RIGHT);

		}else if(target.value == 9){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : Gwangju,

		// 지도의 중심좌표
		level : 10
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(
			mapContainer, mapOption);

	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map
			.addControl(
					mapTypeControl,
					kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map
			.addControl(
					zoomControl,
					kakao.maps.ControlPosition.RIGHT);

		}else if(target.value == 10){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : Ulsan,

		// 지도의 중심좌표
		level : 10
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(
			mapContainer, mapOption);

	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map
			.addControl(
					mapTypeControl,
					kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map
			.addControl(
					zoomControl,
					kakao.maps.ControlPosition.RIGHT);

		}else if(target.value == 11){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : Incheon,

		// 지도의 중심좌표
		level : 10
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(
			mapContainer, mapOption);

	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map
			.addControl(
					mapTypeControl,
					kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map
			.addControl(
					zoomControl,
					kakao.maps.ControlPosition.RIGHT);

		}else if(target.value == 12){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : Jeju,

		// 지도의 중심좌표
		level : 10
	// 지도의 확대 레벨
	};

	// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
	var map = new kakao.maps.Map(
			mapContainer, mapOption);

	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map
			.addControl(
					mapTypeControl,
					kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map
			.addControl(
					zoomControl,
					kakao.maps.ControlPosition.RIGHT);

		}
	  
	}