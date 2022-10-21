<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<c:set var="path" value="${ pageContext.request.contextPath }"/>

<jsp:include page="../common/header.jsp"/>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    
    <!-- mainstyle CSS -->
    <link rel="stylesheet" href="${path }/resources/css/common/style.css" type="text/css" />
    <link rel="stylesheet" href="${path }/resources/css/common/font-icons.css" type="text/css" />
    
    <!-- WithDuck CSS-->
    <link rel="stylesheet" href="${path }/resources/css/withduck/WithDuckChat.css">
</head>

<body class="stretched">
    <div class="allDiv">
        <!--채팅 목록, 참여인원-->
        <div class="leftDiv">
            <!-- 채팅 목록-->
            <div class="chatListContainer">
                <div class="chatListTitle">
                        <span class="title">
                            채팅 목록
                        </span>
                </div>
                
                <div class="withTitle">
                    <div class="chatList">
                        <div class="imgdiv"><img src="${path}/resources/images/Common/프사.png" alt=""></div>
                            <div class="imgdiv-right">
                                <div class="textdiv1">
                                    <a href="">8월 28일 ~ 8월 31일 제주도 갑니다123123</a>
                                </div>
                                <div class="textdiv2">34
                                    <a href="">
                                        <img src="${path}/resources/images/WithDuck/logout.png" alt="">
                                    </a>
                                </div>
                            </div>
                    </div>
                    <div class="chatList">
                        <div class="imgdiv"><img src="${path}/resources/images/Common/프사.png" alt=""></div>
                            <div class="imgdiv-right">
                                <div class="textdiv1">8월 28일 ~ 8월 31일 제주도 갑니다123123</div>
                                <div class="textdiv2">34
                                    <a href="">
                                        <img src="${path}/resources/images/WithDuck/logout.png" alt="">
                                    </a>
                                </div>
                            </div>
                    </div>
                    <div class="chatList">
                        <div class="imgdiv"><img src="${path}/resources/images/Common/프사.png" alt=""></div>
                            <div class="imgdiv-right">
                                <div class="textdiv1">8월 28일 ~ 8월 31일 제주도 갑니다123123</div>
                                <div class="textdiv2">34
                                    <a href="">
                                        <img src="${path}/resources/images/WithDuck/logout.png" alt="">
                                    </a>
                                </div>
                            </div>
                    </div>
                    <div class="chatList">
                        <div class="imgdiv"><img src="${path}/resources/images/Common/프사.png" alt=""></div>
                            <div class="imgdiv-right">
                                <div class="textdiv1">8월 28일 ~ 8월 31일 제주도 갑니다123123</div>
                                <div class="textdiv2">34
                                    <a href="">
                                        <img src="${path}/resources/images/WithDuck/logout.png" alt="">
                                    </a>
                                </div>
                            </div>
                    </div>
                    <div class="chatList">
                        <div class="imgdiv"><img src="${path}/resources/images/Common/프사.png" alt=""></div>
                            <div class="imgdiv-right">
                                <div class="textdiv1">8월 28일 ~ 8월 31일 제주도 갑니다123123</div>
                                <div class="textdiv2">34
                                    <a href="">
                                        <img src="${path}/resources/images/WithDuck/logout.png" alt="">
                                    </a>
                                </div>
                            </div>
                    </div>
                </div>
                
            </div>
            <!--참여 인원-->
            <div class="chatPerContainer">
                <div class="chatPer">
                    <span class="title">
                        참여 인원
                    </span>
                </div>
                <div class="chatPerList">
                    <div class="profile_name">
                        <div class="chat_profile">
                            <img src="${path}/resources/images/Common/프사.png" alt="">
                        </div>
                        <div class="chat_name">
                            <span>박노경</span>
                        </div>
                    </div>
                    <div class="profile_name">
                        <div class="chat_profile">
                            <img src="${path}/resources/images/Common/프사.png" alt="">
                        </div>
                        <div class="chat_name">
                            <span>박노순</span>
                        </div>
                    </div>
                    <div class="profile_name">
                        <div class="chat_profile">
                            <img src="${path}/resources/images/Common/프사.png" alt="">
                        </div>
                        <div class="chat_name">
                            <span>박노</span>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        <!-- 제목, 채팅창, 채팅 입력 -->
        <div class="rightDiv">
            <!-- 제목 부분 -->
            <div class="chatTitle">
                <!-- 나가기 버튼 -->
                <a href="">
                    <img class="exit" src="${path}/resources/images/WithDuck/left-arrow.png">
                </a>
                <p class="withChat_title">${withDuck.withTitle }</p>
            </div>
            <!-- 내용 부분 -->

            <div class="chatContent" id="msgArea">
                <div class="wrap" style="padding: 10px 0">
	            </div>
            </div>

            <!-- 채팅 입력 부분-->
            <div class="inputChat">
                <div class="message-box">
                    <textarea type="text" id="msg" class="message-input" placeholder="메시지를 입력하세요."></textarea>
                    <button id="button-send" >
                        <img src="${path}/resources/images/WithDuck/send.png" style="width: 50px; position:relative; right:20px; top:15px;">
                    </button>
                </div>
            </div>
        </div>
    </div>
    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

    <!--jQuery-->
    <script src="${path }/resources/js/common/jquery-3.6.0.min.js"></script>
	
    <!-- JavaScripts -->
    <script src="${path }/resources/js/common/plugins.min.js"></script>
    <script src="${path }/resources/js/common/functions.js"></script>
</body>
<jsp:include page="../common/footer.jsp"/>
<script type="text/javascript">
	
//전송 버튼 누르는 이벤트
$(document).ready(function() {
	
$("#button-send").on("click", function(e) {
	e.preventDefault();
	if (socket.readyState !== 1) return;
      
	  let msg = $('#msg').val();
	  var str = '<div class="chat ch2">';
		str += '<div class="icon"><i class="fa-solid fa-user">';
		str += '<img src="${path}/resources/images/common/프사.png" alt="">';
		str += "</i></div>";
		str += '<span>' + '${loginMember.memberNickname}' + '</span>';
		str += '<div class="textbox">' + msg + '</div>'
		str += '</div>';
		nickname = '${loginMember.memberNickname}';
	  $(".wrap").append(str);
	  
	  // onmessage에 전달되어 받은사람에게 보내지는 것
	  var str = '<div class="chat ch1">';
		str += '<div class="icon"><i class="fa-solid fa-user">';
		str += '<img src="${path}/resources/images/common/프사.png" alt="">';
		str += "</i></div>";
		str += '<span>' + '${loginMember.memberNickname}' + '</span>';
		str += '<div class="textbox">' + msg + '</div>'
		str += '</div>';
		nickname = '${loginMember.memberNickname}';
	  socket.send(str + ':' + '${loginMember.memberNickname}' +':' + '${loginMember.memberNo}' + ':' + '${withDuck.withNo}');
	  $("#msg").val('');
});
	$('#msg').on('keydown', function(e) {
		
		if(e.keyCode === 13) {
			 let msg = $('#msg').val();
			 // 보내는사람에게 보여지는 채팅 
			 var str = '<div class="chat ch2">';
				str += '<div class="icon"><i class="fa-solid fa-user">';
				str += '<img src="${path}/resources/images/common/프사.png" alt="">';
				str += "</i></div>";
				str += '<span>' + '${loginMember.memberNickname}' + '</span>';
				str += '<div class="textbox">' + msg + '</div>'
				str += '</div>';
				nickname = '${loginMember.memberNickname}';
			  $(".wrap").append(str);
			  
			  // onmessage에 전달되어 받은사람에게 보내지는 것
			  var str = '<div class="chat ch1">';
				str += '<div class="icon"><i class="fa-solid fa-user">';
				str += '<img src="${path}/resources/images/common/프사.png" alt="">';
				str += "</i></div>";
				str += '<span>' + '${loginMember.memberNickname}' + '</span>';
				str += '<div class="textbox">' + msg + '</div>'
				str += '</div>';
				nickname = '${loginMember.memberNickname}';
			  socket.send(str + ':' + '${loginMember.memberNickname}' +':' + '${loginMember.memberNo}' + ':' + '${withDuck.withNo}');
			  $("#msg").val('');
			  e.preventDefault();
		} 
	});

connect();
});

var socket = null;
function connect() {
	var ws = new WebSocket("ws://211.209.232.21:80/${path}/chatting");
	socket = ws;

	ws.onopen = function (event) {
	    console.log('Info: connection opened.');
	    var str = '<div class="chat_entry" id="msgArea">';
		var user = '${loginMember.memberNickname}';
		str += user + "님이 입장하셨습니다.";
		str += '</div>';
		
		console.log(event);
		socket.send(str + ':' + '${loginMember.memberNickname}' +':' + '${loginMember.memberNo}' + ':' + '${withDuck.withNo}');
		$(".wrap").append(str);
	};

	ws.onmessage = function (event) {
		var data = event.data;
		var sessionId = null; //데이터를 보낸 사람
		var message = null;
		var nickName = null; //파싱한 닉네임 값 저장
		var length = "memberNickname=".length;
		
		var arr = data.split(":");

		nickName = arr[2];
		console.log(data);
		console.log('nickName : ' + nickName);
		for(var i=0; i<arr.length; i++){
			console.log('arr[' + i + ']: ' + arr[i]);
		}
		
		var cur_session = '${loginMember.memberId}'; //현재 세션에 로그인 한 사람
		console.log("cur_session : " + cur_session);
		
		sessionId = arr[0];
		message = arr[1];
			console.log(sessionId + " " + cur_session);
			// 입장메시지가 아닌 받은 메시지
			if(message.indexOf('님이 입장하셨습니다.') == -1){ 
				$(".wrap").append(arr[1]);
			// 입장메시지
			} else {
			    console.log('Info: connection opened.');
			    var str = arr[1];
			$(".wrap").append(str);
			}

		
		console.log("ReceiveMessage:", event.data+'\n');
	};
	
	ws.onclose = function (event) {
		console.log('Info: connection closed.'); 
		var user = '${loginMember.memberNickname}';
		var str = user + " 님이 퇴장하셨습니다.";
		
		$("#msgArea").append(str);
		
		setTimeout( function(){ connect(); }, 1000); // retry connection!!
	};
	
	$()
	ws.onerror = function (err) { console.log('Error:', err); };
}
</script>
</html>