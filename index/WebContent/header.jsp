<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>

<%
	String sessionId = (String) session.getAttribute("sessionId");

%>

<sql:setDataSource
		var="dataSource"
		driver="com.mysql.jdbc.Driver"
		url="jdbc:mysql://localhost/company"
		user="root"
		password="1234"
/>

<sql:query dataSource="${dataSource}" 
            var="result">
   select * from human where id = ?
   
   <sql:param value="${sessionId}"/>         

</sql:query> 
<!DOCTYPE html>
<html>

<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css">

<script src = "https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery/3.2.1/jquery.min.js"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script>
<script src = "https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script> -->



<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
	
</style>
</head>
<style>
	 *{
		margin:0;
		padding:0;
	} 
	
	.login1{
		height:50px;
		
		/* border-bottom:1px groove blue; */
	}

	.login2{
		padding:10px;
		margin-right:30px;
		float:right;
	}
	.login2 a{
		list-style:none;
		
	}
	.logo5 img{
		float:left;
		
		width:200px;
		height:50px;
	}
	
	
</style>
<body>


<div class="bike1">

	<div class="logo5"><img src = "${pageContext.request.contextPath}/resource/images/logo5.jpg"></div>

	<c:choose>
		<c:when test="${empty sessionId }">
		<div class="login1">
			<div class="login2"><a href="${pageContext.request.contextPath }/member/addMember.jsp">회원가입</a></div>
			<div class="login2"><a href="${pageContext.request.contextPath }/member/loginMember.jsp">Login</a></div>
		</div>
		</c:when>
		
		<c:when test="${sessionId == 'admin' }">
			<div class="login1">
				<div class="login2"><a href="${pageContext.request.contextPath }/member/updateMember.jsp">MyPage</a></div>
				<div class="login2"><a href="${pageContext.request.contextPath }/member/logoutMember.jsp">Logout</a></div>
				<div class="login2"><a href="${pageContext.request.contextPath }/product/addProduct.jsp">상품 등록</a></div>
				<div class="login2"><a href="${pageContext.request.contextPath }/product/editProduct.jsp?edit=update">상품 수정</a></div>
				<div class="login2"><a href="${pageContext.request.contextPath }/product/editProduct.jsp?edit=delete">상품 삭제</a></div>	
			</div>
		</c:when>
		
		<c:when test="${sessionId != 'admin' }">
			<div class="login1">
				<div class="login2"><a href="${pageContext.request.contextPath }/member/updateMember.jsp">MyPage</a></div>
				<div class="login2"><a href="${pageContext.request.contextPath }/member/logoutMember.jsp">Logout</a></div>
				<div class="login2"><a href="${pageContext.request.contextPath }/product/order.jsp">주문내역</a></div>
				<div class="login2"><a href="${pageContext.request.contextPath }/product/cart.jsp">장바구니</a></div>
					
			</div>
		</c:when>
	</c:choose>
</div>	
		
			 
	

</body>
</html>