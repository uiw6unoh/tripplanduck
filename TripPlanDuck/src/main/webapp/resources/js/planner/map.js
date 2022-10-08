
// 1번
var Seoul = new kakao.maps.LatLng(
		37.56632099109217,
		126.97794558984958);
// 2번
var Incheon = new kakao.maps.LatLng(
		37.45590872680688,
		126.70552692050053);
// 3번
var Daejon = new kakao.maps.LatLng(
		36.35046856919224,
		127.38482123708665);
// 4번
var Daegu = new kakao.maps.LatLng(
		35.87140219365024,
		128.60174803297681);
// 5번
var Gwangju = new kakao.maps.LatLng(
		37.45586506841309,
		126.98080883930932);
// 6번	
var Busan = new kakao.maps.LatLng(
		37.45586506841309,
		126.98080883930932);
// 7번
var Ulsan = new kakao.maps.LatLng(
		35.5390202078351,
		129.311344398614);
// 8번
var Sejong = new kakao.maps.LatLng(
		36.48013273645778,
		127.28875674178784);
// 31번
var Gyeonggi = new kakao.maps.LatLng(
		37.53242386741321,
		127.24075867231213);
// 32번
var Gangwon = new kakao.maps.LatLng(
		37.86127024714858,
		128.3062791982436);
// 33번
var ChungcheongBuk = new kakao.maps.LatLng(
		36.63567674729703, 127.49138343414079);
// 34번
var ChungcheongNam = new kakao.maps.LatLng(
		36.65883394285422, 126.67284926797313);
// 35번
var GyeongsangBuk = new kakao.maps.LatLng(
		36.57601417809463,
		128.50559446919635);
// 36번
var GyeongsangNam = new kakao.maps.LatLng(
		35.23828668905039,
		128.69239588910835);
// 37번
var JeonlaBuk = new kakao.maps.LatLng(
		35.82036067006113,
		127.10872713817363);
// 38번
var JeonlaNam = new kakao.maps.LatLng(
		34.81621546364296,
		126.46291182755675);
// 39번
var Jeju = new kakao.maps.LatLng(
		33.4889273516415,
		126.50042271000662);	





		



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

		}else if(target.value == 3){
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

		}else if(target.value == 4){
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

		}else if(target.value == 5){
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

		}else if(target.value == 6){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : Busan,

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

		}else if(target.value == 8){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : Sejong,

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

		}else if(target.value == 32){
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

		}else if(target.value == 33){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : ChungcheongBuk,

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
		}else if(target.value == 34){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : ChungcheongNam,

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
		}else if(target.value == 35){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : GyeongsangBuk,

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
					
		}else if(target.value == 36){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : GyeongsangNam,

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
		}else if(target.value == 37){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : JeonlaBuk,

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
		}else if(target.value == 38){
			var mapContainer = document
			.getElementById('map'), // 지도를 표시할 div 

	mapOption = {
		// 지역마다 지역 좌표를 받아오는 쪽으로 해야함
		center : JeonlaNam,

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
		}else if(target.value == 39){
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
	