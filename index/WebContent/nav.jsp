<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">


<style>

</style>

</head>
<!-- <script src="http://code.jquery.com/jquery-1.9.1.js"></script> -->

<script src="//code.jquery.com/jquery.min.js"></script>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script> -->
<!-- <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script> -->

<!-- =================== -->
<body>

	<!-- 	 <div class="navi2">
	<ul class="nav nav-tabs">
	  <li role="presentation" class="active"><a href="#">고객지원</a></li>
	  <li role="presentation"><a href="#">갤러리</a></li>
	  <li role="presentation"><a href="#">인재채용</a></li>
	  <li role="presentation"><a href="#">제품소개</a></li>
	  <li role="presentation"><a href="#">회사소개</a></li>
	</ul>
</div> -->

<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="${pageContext.request.contextPath }/index.jsp">BikePage</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li class="active"><a href="#">회사소개 <span class="sr-only">(current)</span></a></li>
        <li><a href="#">오시는길</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">회사제품 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
          	<!-- ? 뒤에 값은 매개변수(company),매개변수의 값(kimco) -->
            <li><a href="${pageContext.request.contextPath }/product/products.jsp?w_company=KIMCO">KIMCO</a></li>
            <li><a href="${pageContext.request.contextPath }/product/products.jsp?w_company=HONDA">HONDA</a></li>
            <li><a href="${pageContext.request.contextPath }/product/products.jsp?w_company=BMW">BMW</a></li>
            <!-- <li class="divider"></li> -->
            <li><a href="${pageContext.request.contextPath }/product/products.jsp?w_company=Harley david">할리 데이비드</a></li>
            <li class="divider"></li>
            <li><a href="${pageContext.request.contextPath }/product/products.jsp">전체상품</a></li>
          </ul>
        </li>
      </ul>
     
      <ul class="nav navbar-nav navbar-right">
        <li><a href="#">인재채용</a></li>
        <li class="dropdown">
          <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">고객센터 <span class="caret"></span></a>
          <ul class="dropdown-menu" role="menu">
            <li><a href="<c:url value="/BoardListAction.do?pageNum=1"/>">공지사항</a></li>
            <li><a href="#">News</a></li>
            <li><a href="#">Something else here</a></li>
            <li class="divider"></li>
            <li><a href="#">Separated link</a></li>
          </ul>
        </li>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>


	<%-- <div class="navi">
		  <div class="navi3">
			<div class="navi1">
				<a href="index.jsp"><img src="./resource/images/logoB.jpg"></a>
			</div>
		
			<div class="navi2">
				<ul>
					<li><a href="<c:url value="/BoardListAction.do?pageNum=1"/>">고객지원</a></li>
					<li class="a">갤러리</li>
					<li class="a">인재채용</li>
					<li class="a"><a href ="product/products.jsp">제품소개</a></li>
					<li class="a">회사소개</li>
				</ul>
			</div>
		  </div>		
		</div> --%>

</body>
</html>