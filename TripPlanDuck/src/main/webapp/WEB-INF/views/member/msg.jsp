<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

  <!-- SweetAlert CSS -->
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.css">

</head>
<body>

<!--jQuery-->
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>

<!-- bootstrap js -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>

<!-- SweetAlert2 JS -->
<script src="https://cdn.jsdelivr.net/npm/sweetalert2@11.4.10/dist/sweetalert2.min.js"></script>

	<script>
		// 알림메세지를 띄움	
		alert("${ msg }")
	
		// 실행시켜야할 스크립트가 있으면 실행
		if(${ not empty script }) {
			${ script }
		}
		
		// 페이지 이동
		location.replace("${ pageContext.request.contextPath }${ location }");
	</script>
	
</body>