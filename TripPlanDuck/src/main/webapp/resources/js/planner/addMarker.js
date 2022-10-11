
			 var markers = [];
			//clusterer.addMarker( markers );
			var ovarlays = [];
			var lines = [];
			var names = [];
			var positions = [];

			kakao.maps.event.addListener(map, 'click', function(mouseEvent) {        
			    // 클릭한 위치에 마커를 표시합니다 
			    addMarker: addMarker
			});


			// 마커를 생성하고 지도위에 표시하는 함수입니다
			function addMarker(position) {
			    
			    // 마커를 생성합니다
			    var marker = new kakao.maps.Marker({
			        position: position
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
