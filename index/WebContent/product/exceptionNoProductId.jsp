<!-- 상품보기 오류페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="./resources/css/bootstrap.min.css" />
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<jsp:include page="../header.jsp" />
	<jsp:include page="../nav.jsp" />
	<div class="jumbotron">
		<div class="container">
			<h2 class="alert alert-danger">해상 상품이 존재하지 않습니다.</h2>
		</div>
	</div>
	<div class="container">
		<p><%=request.getRequestURL() %>?<%=request.getQueryString() %>
		<p><a href="products.jsp" class="btn btn-secondary">상품 목록&raquo;</a>
	</div>

</body>
</html>