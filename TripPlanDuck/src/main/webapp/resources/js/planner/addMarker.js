
			 var markers = [];
			//clusterer.addMarker( markers );
			var ovarlays = [];
			var lines = [];
			var names = [];
			var positions = [];
			
			var imageSrc = 'https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2Fbj1sID%2FbtrOmc6KtD6%2FKF00nKO1xpe9nbUlbySxn1%2Fimg.png', // 마커이미지의 주소입니다    
		     imageSize = new kakao.maps.Size(40, 60), // 마커이미지의 크기입니다
		     imageOption = {offset: new kakao.maps.Point(15, 32)}; // 마커이미지의 옵션입니다. 마커의 좌표와 일치시킬 이미지 안에서의 좌표를 설정합니다.
		     
		     
		     var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);
		     
			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
			    // 클릭한 위치에 마커를 표시합니다 
			    addMarker: addMarker
			});

				var data = new Array();
				
				$(document).ready(function(){
					
					$("[class^=addDesti]").on("click", function(event) {
				
						let destMapX = $(this).children('#destMapX').val().trim();
						let destMapY = $(this).children('#destMapY').val().trim();
						let destSubject = $(this).children('#destSubject').val().replaceAll(" ", "");
						let destNo = $(this).children('#destNo').val().trim();
						
						// 마커 찍기
						addMarker(new kakao.maps.LatLng(destMapX, destMapY));
				
							 data.push(destSubject);
							 $("#place").val(data);
				
					$('#divOriginal_'+destNo).appendTo('#divCopy_chil');
					
					$('#divCopy').find('.addDesti').replaceWith('<div onclick=deleteDiv('+destNo+',"'+destSubject+'","'+destMapX+'","'+destMapY+'")> <a class="material-icons")>delete</a></div>');
					//$('#divCopy').find('#divCopy_').replaceAll('#divOriginal_');
					
					//$('#divCopy_chil').find('#divOrginal_'+destNo).replaceWith();
					//$('#addDesti').find('a').replaceWith('a id="x" class="material-icons">delete</a>);
					
					//$('#divCopy_chil').children('#divOriginal_'+destNo).remove();
					
					});
				});
			// 마커를 생성하고 지도위에 표시하는 함수입니다
			function addMarker(position) {
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        position: position,
			        image: markerImage
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
			function deleteDiv(destNo,destSubject,destMapX,destMapY) {
				
				
				$('#divCopy_chil').children('#divOriginal_'+destNo).remove();
				
				for(var i = 0; i < data.length; i++){
					if(data[i] == destSubject){
						data.splice(i,1);
						 $("#place").val(data);
					}
				}
				
			
				//deleteMarkers(new kakao.maps.LatLng(destMapX, destMapY));
				
			};
			