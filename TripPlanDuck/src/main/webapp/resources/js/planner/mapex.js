
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
		 35.1595454,
		126.8526012);
// 6번	
var Busan = new kakao.maps.LatLng(
		35.17977523319586,
		129.0749925863485);
// 7번
var Ulsan = new kakao.maps.LatLng(
		35.53962603316087,
		129.31151418501798);
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
var GyeongsangNam = new kakao.maps.LatLng(
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
	  var location = document.getElementById('location1');
      
	  $('.loca_1').hide();
	  $('.loca_2').hide();
	  $('.loca_3').hide();
	  $('.loca_4').hide();
	  $('.loca_5').hide();
	  $('.loca_6').hide();
	  $('.loca_7').hide();
	  $('.loca_8').hide();
	  $('.loca_31').hide();
	  $('.loca_32').hide();
	  $('.loca_33').hide();
	  $('.loca_34').hide();
	  $('.loca_35').hide();
	  $('.loca_36').hide();
	  $('.loca_37').hide();
	  $('.loca_38').hide();
	  $('.loca_39').hide();

	  if (target.value == 1) {
			asd(Seoul,map);
			$('.loca_1').show();
			
		}else if(target.value == 2){
			asd(Incheon);
			$('.loca_2').show();
		}else if(target.value == 3){
			asd(Daejon);
			$('.loca_3').show();
		}else if(target.value == 4){
			asd(Daegu);
			$('.loca_4').show();
		}else if(target.value == 5){
			asd(Gwangju);
			$('.loca_5').show();
		}else if(target.value == 6){
			asd(Busan);
			$('.loca_6').show();
		}else if(target.value == 7){
			asd(Ulsan);
			$('.loca_7').show();
		}else if(target.value == 8){
			asd(Sejong);
			$('.loca_8').show();
		}else if(target.value == 31){
			asd(Gyeonggi);
			$('.loca_31').show();
		}else if(target.value == 32){
			asd(Gangwon);
			$('.loca_32').show();
		}else if(target.value == 33){
			asd(ChungcheongBuk);
			$('.loca_33').show();
		}else if(target.value == 34){
			asd(ChungcheongNam);
			$('.loca_34').show();
		}else if(target.value == 35){
			asd(GyeongsangBuk);
			$('.loca_35').show();
		}else if(target.value == 36){
			asd(GyeongsangNam);
			$('.loca_36').show();
		}else if(target.value == 37){
			asd(JeonlaBuk);
			$('.loca_37').show();
		}else if(target.value == 38){
			asd(JeonlaNam);
			$('.loca_38').show();
		}else if(target.value == 39){
			asd(Jeju);
			$('.loca_39').show();
		}
		
	}
	
	