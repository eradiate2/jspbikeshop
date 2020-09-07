<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>

<!-- <link rel="stylesheet" href="./resources/css/bootstrap.min.css"> -->
<script type="text/javascript" src="../resource/js/validation.js"></script>
<meta charset="UTF-8">

<title>Insert title here</title>
<style>
	.container{
		text-ailgn:center;s
	}
	.header5{
		width:100%;
		height:450px;
		/* border:1px solid black; */
	}
	.header5 img{
		width:100%;
		height:450px;
	}
</style>
</head>
<body>

<!-- 제품추가하는 jsp -->

	<fmt:setLocale value='<%= request.getParameter("language") %>' />
	<fmt:bundle basename="resourceBundle.message" >
	<jsp:include page="../header.jsp" />
	<jsp:include page="../nav.jsp" />
	
<%-- <div class="jumbotron" >
		<div class="container">
			<h1 class="display-3"><fmt:message key="title" /></h1>
		</div>
	</div> --%>
	
	<div class="header5"><img src="../resource/images/bike1.jpg"></div>
	
	<div class="container">
			<h1 class="display-3" style="color:red"><fmt:message key="title"/></h1>
		</div>
	
	<div class="container" >
		<div class="text-right">
			<a href="?language=ko" >한국어</a>|<a href="?language=en" >English</a><br><br>
			 
			
		</div>
	<!-- horizontal 수직정렬 -->
		<form name="newProduct" action="./processAddProduct.jsp" class="form-horizontal" method="post" enctype="multipart/form-data">
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productId" /></label>
				<div class="col-sm-3">
					<input type="text" id="productId" name="productId" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="pname" /></label>
				<div class="col-sm-3">
					<input type="text" id="name" name="name" class="form-control">	
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="price" /></label>
				<div class="col-sm-3">
					<input type="text" id="price" name="price" class="form-control">	
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="description" /></label>
				<div class="col-sm-3">
					<textarea name="description" cols="50" rows="2" class="form-control"></textarea>
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="place" /></label>
				<div class="col-sm-3">
					 <input type="text" name="category" class="form-control">
						
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="place" /></label>
				<div class="col-sm-3">
					
					<select name="manufacturer">
						<option>KIMCO</option>
						<option>HONDA</option>
						<option>BMW</option>
						<option>Harley david</option>
				</select><br>	
				</div>
			</div>
			
			<%-- <div class="form-group row">
				<label class="col-sm-2"><fmt:message key="ice" /></label>
				<div class="col-sm-3">
					<!-- <input type="text" name="ice" class="form-control"> -->
					<input type="radio" name="ice" value="Spring "><fmt:message key="ice_a" />
					<input type="radio" name="ice" value="Summer" ><fmt:message key="ice_b" />	
				</div>
			</div> --%>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="unitsInStock" /></label>
				<div class="col-sm-3">
					<input type="text" id="unitsInStock" name="unitsInStock" class="form-control">	
				</div>
			</div>
			
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="condition" /></label>
				<div class="col-sm-5">
					<input type="radio" name="condition" value="New "><fmt:message key="condition_New" />
					<input type="radio" name="condition" value="Old" ><fmt:message key="condition_Old" />	
				</div>
			</div>
			<!-- 2020-06-10
			1.col-xs-숫자: 항상 가로로 배치
			2.col-sm-숫자: 가로768px이상일때만 가로표시
			3.col-md-숫자: 가로992px이상일떄만 가로표시
			4.col-lg-숫자: 가로1200px이상일떄만 가로표시
			 -->
			<div class="form-group row">
				<label class="col-sm-2"><fmt:message key="productImage" /></label>
				<div class="col-sm-5">
					<input type="file" name="productImage" class="form-control">
				</div>
			</div>
			
			<div class="form-group row">
				<div class="col-sm-offset-2 col-sm-10 ">
					<input type="button" class="btn btn-primary" value="<fmt:message key="button" />" onclick="CheckAddProduct()" >
				</div>
			</div>
		</form>

	</div>
</fmt:bundle>



</body>
</html>