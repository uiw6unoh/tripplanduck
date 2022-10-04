
var markers = [];
//clusterer.addMarker( markers );
var ovarlays = [];
var lines = [];
var names = [];
var positions = [];

function addCard(cardTitle, value){
   
     var check = 'false';

     for(var i = 0; i < names.length; ++i){
        if(names[i] == cardTitle){
           check = 'true';
        }  
     }
   if(check == 'true'){
      alert('이미 추가된 항목입니다!'); 
      
   }else{
      names.push(cardTitle);
        
         var checker = value.split('/');
         
 var markerPosition = new kakao.maps.LatLng(checker[0],checker[1]);



var marker = new kakao.maps.Marker({
   position: markerPosition,
 });

 

 var content = '<div class="customoverlay">' +
     '  <a>' +
     '   <span id="numbers"></span> <span class="title">'+location+'</span>'
     '  </a>' +
     '</div>';

var position = new kakao.maps.LatLng(checker[0],checker[1]);
       // 커스텀 오버레이를 생성합니다
       positions.push(position);
       addText(position, content);      
       
     // 마커가 지도 위에 표시되도록 설정합니다
     marker.setMap(map);  
     markers.push(marker);
     
     const xhttp = new XMLHttpRequest();

         xhttp.addEventListener('readystatechange', (e) => {
              const readyState = e.target.readyState;
              const httpStatus = e.target.status;
              
              if(readyState == 4 && httpStatus == 200) {
                addToListLeft(JSON.parse(e.target.responseText));          
                
              }
            });

            xhttp.open('GET', './select/' + location, true);
            xhttp.setRequestHeader('content-type', 'application/json;charset=UTF-8');
            xhttp.send();
     
   }
};
