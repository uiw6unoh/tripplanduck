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
        <h2 style="margin-top: 15px;">회원 정보 관리</h2>
        <hr class="mt-1" style="border: 1px solid rgb(221, 221, 221);">
        </div>

        <div class="row">
            <div class="col-md-6">
                        <p style="margin-top: 6%; margin-bottom: 10px; color: red;"><svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-check2" viewBox="0 0 16 16">
                            <path d="M13.854 3.646a.5.5 0 0 1 0 .708l-7 7a.5.5 0 0 1-.708 0l-3.5-3.5a.5.5 0 1 1 .708-.708L6.5 10.293l6.646-6.647a.5.5 0 0 1 .708 0z"/>
                        </svg> 회원정지를 누를 시 비회원으로 전환 됩니다.</p>
            </div>
            <div class="col-md-6">
                <form action="...">
                    <button style="margin-top: 25px; margin-left: 280px; border: 1px; outline: none !important; box-shadow: none !important; border-radius: 12px; background-color: rgb(255,248,198);">회원</button>&nbsp;&nbsp;&nbsp;&nbsp;
                    <button style="border: 1px; border-radius: 12px; outline: none !important; box-shadow: none !important; background-color: rgb(255,248,198);">비회원</button>
                </form>
            </div>
        </div>
        <div class="mt-3">
            <table class="table table-sm">
                <thead>
                    <tr style="height: 10px; color:gray">
                        <th style="width: 8%;">회원 번호</th>
                        <th style="width: 8%;">아이디</th>
                        <th style="width: 8%;">이름</th>
                        <th style="width: 15%;">가입일</th>
                        <th style="width: 12%;">탈퇴일</th>
                        <th style="width: 6%;"></th>
                        <th style="width: 10%;">회원 여부</th>
                        <th style="width: 10%;">계정 전환</th>
                    </tr>
                </thead>

                <tbody>
                <tr>
                    <td>00</td>
                    <td>abcd</td>
                    <td>홍길동</td>
                    <td>2022-00-00</td>
                    <td>2022-00-00</td>
                    <td style="text-align: center;"></td>
                    <td>회원</td>
                    <td>
                        <button style="border: 1px; outline: none !important; box-shadow: none !important; border-radius: 12px; background-color: rgb(255,248,198); color: red;">
                            계정전환
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>00</td>
                    <td>abcd</td>
                    <td>홍길동</td>
                    <td>2022-00-00</td>
                    <td>2022-00-00</td>
                    <td style="text-align: center;"></td>
                    <td>회원</td>
                    <td>
                        <button style="border: 1px; outline: none !important; box-shadow: none !important; border-radius: 12px; background-color: rgb(255,248,198); color: red;">
                            계정전환
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>00</td>
                    <td>abcd</td>
                    <td>홍길동</td>
                    <td>2022-00-00</td>
                    <td>2022-00-00</td>
                    <td style="text-align: center;"></td>
                    <td>회원</td>
                    <td>
                        <button style="border: 1px; outline: none !important; box-shadow: none !important; border-radius: 12px; background-color: rgb(255,248,198); color: red;">
                            계정전환
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>00</td>
                    <td>abcd</td>
                    <td>홍길동</td>
                    <td>2022-00-00</td>
                    <td>2022-00-00</td>
                    <td style="text-align: center;"></td>
                    <td>회원</td>
                    <td>
                        <button style="border: 1px; outline: none !important; box-shadow: none !important; border-radius: 12px; background-color: rgb(255,248,198); color: red;">
                            계정전환
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>00</td>
                    <td>abcd</td>
                    <td>홍길동</td>
                    <td>2022-00-00</td>
                    <td>2022-00-00</td>
                    <td style="text-align: center;"></td>
                    <td>회원</td>
                    <td>
                        <button style="border: 1px; outline: none !important; box-shadow: none !important; border-radius: 12px; background-color: rgb(255,248,198); color: red;">
                            계정전환
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>00</td>
                    <td>abcd</td>
                    <td>홍길동</td>
                    <td>2022-00-00</td>
                    <td>2022-00-00</td>
                    <td style="text-align: center;"></td>
                    <td>회원</td>
                    <td>
                        <button style="border: 1px; outline: none !important; box-shadow: none !important; border-radius: 12px; background-color: rgb(255,248,198); color: red;">
                            계정전환
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>00</td>
                    <td>abcd</td>
                    <td>홍길동</td>
                    <td>2022-00-00</td>
                    <td>2022-00-00</td>
                    <td style="text-align: center;"></td>
                    <td>회원</td>
                    <td>
                        <button style="border: 1px; outline: none !important; box-shadow: none !important; border-radius: 12px; background-color: rgb(255,248,198); color: red;">
                            계정전환
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>00</td>
                    <td>abcd</td>
                    <td>홍길동</td>
                    <td>2022-00-00</td>
                    <td>2022-00-00</td>
                    <td style="text-align: center;"></td>
                    <td>비회원</td>
                    <td>
                        <button style="border: 1px; outline: none !important; box-shadow: none !important; border-radius: 12px; background-color: rgb(255,248,198); color: red;">
                            계정전환
                        </button>
                    </td>
                </tr>
                <tr>
                    <td>00</td>
                    <td>abcd</td>
                    <td>홍길동</td>
                    <td>2022-00-00</td>
                    <td>2022-00-00</td>
                    <td style="text-align: center;"></td>
                    <td>비회원</td>
                    <td>
                        <button style="border: 1px; outline: none !important; box-shadow: none !important; border-radius: 12px; background-color: rgb(255,248,198); color: red;">
                            계정전환
                        </button>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>

        <div class="row" style="margin-bottom: 25px;">
            <div class="col-4"></div>
            <div class="col-4">
                <ul class="pagination justify-content-center">
                    <li class="page-item"><a class="page-link" href="#">&lt;&lt;</a></li>
                    <li class="page-item"><a class="page-link" href="#">1</a></li>
                    <li class="page-item"><a class="page-link" href="#">2</a></li>
                    <li class="page-item"><a class="page-link" href="#">3</a></li>
                    <li class="page-item"><a class="page-link" href="#">4</a></li>
                    <li class="page-item"><a class="page-link" href="#">5</a></li>
                    <li class="page-item"><a class="page-link" href="#">&gt;&gt;</a></li>
                </ul>
            </div>
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
