// Drawing Manager로 도형을 그릴 지도 div
var drawingMapContainer = document.getElementById('map'),
    drawingMap = { 
        center: new kakao.maps.LatLng(37.54358784304751, 126.98080883930932), // 지도의 중심좌표
        level: 9 // 지도의 확대 레벨
    };

// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
var drawingMap = new kakao.maps.Map(drawingMapContainer, drawingMap); 

var options = { // Drawing Manager를 생성할 때 사용할 옵션입니다
    map: drawingMap, // Drawing Manager로 그리기 요소를 그릴 map 객체입니다
    drawingMode: [ // Drawing Manager로 제공할 그리기 요소 모드입니다
        kakao.maps.drawing.OverlayType.MARKER,
        kakao.maps.drawing.OverlayType.POLYLINE
    ],
    // 사용자에게 제공할 그리기 가이드 툴팁입니다
    // 사용자에게 도형을 그릴때, 드래그할때, 수정할때 가이드 툴팁을 표시하도록 설정합니다
    guideTooltip: ['draw', 'drag', 'edit'], 
    markerOptions: { // 마커 옵션입니다 
        draggable: true, // 마커를 그리고 나서 드래그 가능하게 합니다 
        removable: true // 마커를 삭제 할 수 있도록 x 버튼이 표시됩니다  
    },
    polylineOptions: { // 선 옵션입니다
        draggable: true, // 그린 후 드래그가 가능하도록 설정합니다
        removable: true, // 그린 후 삭제 할 수 있도록 x 버튼이 표시됩니다
        editable: true, // 그린 후 수정할 수 있도록 설정합니다 
        strokeColor: '#39f', // 선 색
        hintStrokeStyle: 'dash', // 그리중 마우스를 따라다니는 보조선의 선 스타일
        hintStrokeOpacity: 0.5  // 그리중 마우스를 따라다니는 보조선의 투명도
    }
};

// 위에 작성한 옵션으로 Drawing Manager를 생성합니다
var manager = new kakao.maps.drawing.DrawingManager(options);

// 버튼 클릭 시 호출되는 핸들러 입니다
function selectOverlay(type) {
    // 그리기 중이면 그리기를 취소합니다
    manager.cancel();

    // 클릭한 그리기 요소 타입을 선택합니다
    manager.select(kakao.maps.drawing.OverlayType[type]);
}

// Drawing Manager에서 데이터를 가져와 도형을 표시할 아래쪽 지도 div
var mapContainer = document.getElementById('map'),
    mapOptions = { 
        center: new kakao.maps.LatLng(37.54358784304751, 126.98080883930932), // 지도의 중심좌표
        level: 7 // 지도의 확대 레벨
    };

// 지도 div와 지도 옵션으로 지도를 생성합니다
var map = new kakao.maps.Map(mapContainer, mapOptions),
    overlays = []; // 지도에 그려진 도형을 담을 배열

// 가져오기 버튼을 클릭하면 호출되는 핸들러 함수입니다
// Drawing Manager로 그려진 객체 데이터를 가져와 아래 지도에 표시합니다
function getDataFromDrawingMap() {
    // Drawing Manager에서 그려진 데이터 정보를 가져옵니다 
    var data = manager.getData();

    // 아래 지도에 그려진 도형이 있다면 모두 지웁니다
    removeOverlays();

    // 지도에 가져온 데이터로 도형들을 그립니다
    drawMarker(data[kakao.maps.drawing.OverlayType.MARKER]);
    drawPolyline(data[kakao.maps.drawing.OverlayType.POLYLINE]);
}

// 아래 지도에 그려진 도형이 있다면 모두 지웁니다
function removeOverlays() {
    var len = overlays.length, i = 0;

    for (; i < len; i++) {
        overlays[i].setMap(null);
    }

    overlays = [];
}

// Drawing Manager에서 가져온 데이터 중 마커를 아래 지도에 표시하는 함수입니다
function drawMarker(markers) {
    var len = markers.length, i = 0;

    for (; i < len; i++) {
        var marker = new kakao.maps.Marker({
            map: map, 
            position: new kakao.maps.LatLng(markers[i].y, markers[i].x), 
            zIndex: markers[i].zIndex
        });

        overlays.push(marker);
    }
}

// Drawing Manager에서 가져온 데이터 중 선을 아래 지도에 표시하는 함수입니다
function drawPolyline(lines) {
    var len = lines.length, i = 0;

    for (; i < len; i++) {
        var path = pointsToPath(lines[i].points);
        var style = lines[i].options;
        var polyline = new kakao.maps.Polyline({
            map: map,
            path: path,
            strokeColor: style.strokeColor,
            strokeOpacity: style.strokeOpacity,
            strokeStyle: style.strokeStyle,
            strokeWeight: style.strokeWeight
        });

        overlays.push(polyline);
    }
}




// Drawing Manager에서 가져온 데이터 중 
// 선과 다각형의 꼭지점 정보를 kakao.maps.LatLng객체로 생성하고 배열로 반환하는 함수입니다 
function pointsToPath(points) {
    var len = points.length, 
        path = [], 
        i = 0;

    for (; i < len; i++) { 
        var latlng = new kakao.maps.LatLng(points[i].y, points[i].x);
        path.push(latlng); 
    }

    return path;
}
