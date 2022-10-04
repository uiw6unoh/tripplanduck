<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="../common/header.jsp" />

<div class="container" style="margin-top: 70px; margin-bottom: 70px;">
    <div class="row contatiner">

    <!-- 왼쪽 그리드 -->
    <div class="col-sm-2">
        <!-- 사이드 메뉴바 -->
        <div class="mySideMenu" style="display: grid;">
            <a id="myListMain" href="${ path }/admin/visitor"> 방문자 관리 </a>
            <p></p>
            <a id="myListMain" href="${ path }/admin/member"> 회원 정보 관리 </a>
            <p></p>
            <a id="myListMain" href="${ path }/admin/review"> 리뷰 관리 </a>
            <p></p>
            <a id="myListMain" href="${ path }/admin/chat"> 채팅 관리 </a>
            <p></p>
            <a id="myListMain" href="${ path }/admin/withDuck"> 위드덕 관리 </a>
        </div>
    </div>

    <!-- 오른쪽 그리드 -->
    <div class="col-sm-10" style="border: 3px solid rgb(221, 221, 221);">
        <!-- 컨테이너 -->
        <div class="container-chart">
        <h2 style="margin-top: 15px;">방문자 관리</h2>
        <hr class="mt-1" style="border: 1px solid rgb(221, 221, 221);">
        <h5>총 방문자 수</h5>
        <div class="w-100 p-3" id="flag" style="text-align: center;">
            <img src="${ path }/images/admin/dukduk_plag.png" width="100%">
            <div class="text" id="count_all" style="position: absolute; top: 28%; left: 45%; color: rgb(255, 0, 0);">
                <h1>총 1,000,000 명</h1>
            </div>
        </div>
        </div>

        <div class="row">
            <div class="col-md-6">
                <h5 style="margin-top: 5%;">일자별 요약</h5>
            </div>
            <div class="col-md-6">
                <input style="width:100px; margin-top: 4%; margin-left: 30%;" autocomplete="off" id="startDt" placeholder="검색 시작일" name="startDt" type="text" class="datepick hasDatepicker" value="">
                &nbsp;&nbsp;~&nbsp;&nbsp; 
                <input style="width:100px;" autocomplete="off" id="endDt" placeholder="검색 종료일" name="endDt" type="text" class="datepick hasDatepicker" value="">
            </div>
        </div>
        <div class="mt-3">
            <table class="table table-sm">
                <thead>
                    <tr style="height: 10px; color:gray">
                        <th style="width: 50%;">일자</th>
                        <th style="width: 20%;">방문자</th>
                        <th style="width: 20%;">가입</th>
                        <th style="width: 10%;">게시글</th>
                    </tr>
                </thead>

                <tbody>
                <tr>
                    <td>2022-00-00</td>
                    <td>0명</td>
                    <td>0명</td>
                    <td>0개</td>
                </tr>
                <tr>
                    <td>2022-00-00</td>
                    <td>0명</td>
                    <td>0명</td>
                    <td>0개</td>
                </tr>
                <tr>
                    <td>2022-00-00</td>
                    <td>0명</td>
                    <td>0명</td>
                    <td>0개</td>
                </tr>
                <tr>
                    <td>2022-00-00</td>
                    <td>0명</td>
                    <td>0명</td>
                    <td>0개</td>
                </tr>
                <tr>
                    <td>2022-00-00</td>
                    <td>0명</td>
                    <td>0명</td>
                    <td>0개</td>
                </tr>
                <tr>
                    <td>2022-00-00</td>
                    <td>0명</td>
                    <td>0명</td>
                    <td>0개</td>
                </tr>
                <tr>
                    <td>2022-00-00</td>
                    <td>0명</td>
                    <td>0명</td>
                    <td>0개</td>
                </tr>
                <tr>
                    <td>2022-00-00</td>
                    <td>0명</td>
                    <td>0명</td>
                    <td>0개</td>
                </tr>
                <tr>
                    <td>2022-00-00</td>
                    <td>0명</td>
                    <td>0명</td>
                    <td>0개</td>
                </tr>

                </tbody>

            </table>
        </div>
        </div>
    </div>
    <!-- 컨테이너 끝 -->
    </div>
    
    <jsp:include page="../common/footer.jsp" />
    
<!-- Bootstrap JS -->
<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
    integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
    crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"
    integrity="sha384-fQybjgWLrvvRgtW6bFlB7jaZrFsaBXjsOMm/tB9LTS58ONXgqbR9W8oWht/amnpF"
    crossorigin="anonymous"></script>
