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
                <p class="withChat_title">8월 28일 ~ 8월 31일 제주도 갑니다</p>
            </div>
            <!-- 내용 부분 -->
            <div class="chatContent">
                <div class="chat_entry">
                    <span>박노경님이 입장하셨습니다.</span>
                </div>
                <div class="wrap">
                    <div></div>
                    <div class="chat ch1">
                        <div class="icon"><i class="fa-solid fa-user">
                            <img src="${path}/resources/images/Common/프사.png" alt="">
                        </i></div>
                        <div class="textbox">안녕하세요. 반갑습니다.</div>
                    </div>
                    <div class="chat ch2">
                        <div class="icon"><i class="fa-solid fa-user">
                            <img src="${path}/resources/images/Common/프사.png" alt="">
                        </i>
                        </div>
                        <div class="textbox">안녕하세요. 박노경입니다.</div>
                    </div>
                    <div class="chat ch1">
                        <div class="icon"><i class="fa-solid fa-user">
                            <img src="${path}/resources/images/Common/프사.png" alt="">
                        </i>
                        </div>
                        <div class="textbox">요즘 어떻게 지내세요?</div>
                    </div>
                </div>
            </div>
            <!-- 채팅 입력 부분-->
            <div class="inputChat">
                <div class="message-box">
                    <textarea type="text" class="message-input" placeholder="메시지를 입력하세요."></textarea>
                    <a href="">
                        <img src="${path}/resources/images/WithDuck/send.png" alt="">
                    </a>
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
</html>