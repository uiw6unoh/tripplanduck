<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="common/header.jsp"/>

<!-- 내용 시작 -->
<section id="slider" class="slider-element dark">
	<div class="slider-inner">
		<div class="slider-caption d-flex h-100 slider-caption-center m-auto" style="z-index: 3">
			<h2 data-animate="fadeInUp" class="fadeInUp animated">Welcome to TripPlanDuck</h2>
		</div>
		<div class="video-wrap m-auto" style="position: relative">
			<video id="mainVideo" style="z-index: 1" preload="auto" loop autoplay muted playsinline></video>
			<div class="video-overlay w-100" style="z-index: 2; background-color: rgba(0, 0, 0, 0.45)"></div>
		</div>
  	</div>
  </section>

  <style>
      /* 비디오 */
      video {
        width: 100%;
        height: 100vh;
        object-fit: cover;
        transition: opacity 0.3s 1s ease;
      }

      /* 비디오 텍스트 애니메이션 추가 */
      @keyframes fadeInUp {
        0% {
          opacity: 0;
          transform: translate3d(0, 30%, 0);
        }
        to {
          opacity: 1;
          transform: translateZ(0);
        }
      }

      .slider-inner {
        margin-bottom: -0.35em;
      }

      .fadeInUp {
        position: relative;
        animation: fadeInUp 1s;
      }

      .video-overlay {
        position: absolute;
        height: 99.5%;
        top: 0;
        background: transparent url("images/common/grid.png") repeat;
        transform: translateZ(0);
      }

      /* 비디오 텍스트 */
      .slider-caption.slider-caption-center {
        position: absolute;
        text-align: center;
        left: 0;
        right: 0;
      }

      .slider-caption {
        flex-flow: column;
        justify-content: center;
        font-size: 1.375rem;
        font-weight: 300;
      }

      .slider-caption h2 {
        font-size: 4rem;
        letter-spacing: 2px;
        text-transform: uppercase;
        font-weight: 700;
        line-height: 1;
        color: #f7f7f7;
        text-decoration: none;
      }
    </style>
    
<jsp:include page="common/footer.jsp"/>

<script>
	$(document).ready(function () {
		videoNum = Math.floor(18 * Math.random()) + 1;
		$("#mainVideo").append('<source src="${ path }/resources/images/common/movie/main'.concat(videoNum, '.mp4" type="video/mp4" />'));
	});
</script>