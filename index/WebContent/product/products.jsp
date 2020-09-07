<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ page import="java.util.ArrayList" %>
 <%-- <%@ page import="dto.Product" %> --%>
 <%-- <%@ page import="dao.ProductRepository" %> --%>
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 <%@ page import="java.sql.*" %>
 <%-- <jsp:useBean id="productDAO" class="dao.ProductRepository" scope="session"/> --%>
<!DOCTYPE html>
<html>

<style>

	/* .jumbotron {
		background-color: black;
		/* background-image: url('../resource/images/bike1.jpg');
        background-size: cover; */
        text-shadow: black 0.2em 0.2em 0.2em;
        color:white;
	} */

	article .img{
		width:1500px;
		height:355px;
		/* border:1px solid black; */
		margin:0 auto ;
		display:inline-block;
	}
	 .col-md-4 img{
		width:365px;
		height:355px;
		float:left;
		margin:5px 5px 5px 5px;
		
	}
	.col-md-4 a{
		font-size:30px;
		color:green;
	}
	
	.display-3 img{
		width:100px;
		height:100px;
		
	}
	.col-md-4 img:hover{
		background:black;
		opacity: 0.7;
	}
	.header5{
		width:100%;
		height:350px;
		/* border:1px solid black; */
	}
	.header5 img{
		width:100%;
		height:350px;
	}

</style>
<head>
 <!-- <link rel="stylesheet" href="./resources/css/bootstrap.min.css" />  -->
<meta charset="UTF-8">
<title>상품 목록</title>
</head>
<body>

  <!-- 메인화면 -->
	<jsp:include page="../header.jsp" />
	<jsp:include page="../nav.jsp" />

	<div class="header5"><img src="../resource/images/bike1.jpg"></div>

	<%
		String j_company = request.getParameter("w_company");

		System.out.println(j_company);
		//equals 문자열로 비교한다
		 if(j_company == null){ 
	%>
	
	
		<div class="container">
			<h1 class="display-3">전체 상품</h1>
		</div><hr>
		
	
	<%
		 } else if(j_company.equals("HONDA")){

	%>
	
	<!-- <div class="jumbotron" style="background-color:black">
		<div class="container"> 부트스트랩 반응형클래스
			<h1 class="display-3" style="color:white">HONDA</h1>
		</div>
	</div>  -->
	<div class="container">
			<h1 class="display-3">HONDA</h1>
		</div><hr>
	
	<%} else if(j_company.equals("BMW")){ %>
	
	
		<div class="container"> <!-- 부트스트랩 반응형클래스 -->
			<h1 class="display-3">BMW</h1>
		</div><hr>
	
	<%}else if(j_company.equals("Harley david")) { %>
	
	
		<div class="container"> <!-- 부트스트랩 반응형클래스 -->
			<h1 class="display-3">Harley david</h1>
		</div><hr>
	<
	<%}else if(j_company.equals("KIMCO")) { %>
	
	
		<div class="container"> <!-- 부트스트랩 반응형클래스 -->
			<h1 class="display-3">KIMCO</h1>
		</div><hr>
	
	
	<%} %>
	
	<div class="container">
		<div class="row" align="center">
		
	 	<%@include file="../dbconn.jsp" %>
		<%
		/* request.setCharacterEncoding("UTF-8");
	    String filename="";
	    String realFolder="E:\\jspStudy\\project\\WebContent\\resources\\images";
	    int maxSize=5*1024*1024;
	    String encType="utf-8";
	    
	    MultipartRequest multi=
	    		new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy()); */
		
			
			
			/* String productId= multi.getParameter("productId"); */
		
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql;
			
			if(j_company!=null){
				sql= "select * from product where p_manufacturer=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, j_company);
				
			}
			else{
				sql= "select * from product";
				pstmt=conn.prepareStatement(sql);
			}
			
			rs=pstmt.executeQuery();
			while (rs.next()){
		%> 
			
			<div class="col-md-4">
				<a href="buyProduct.jsp?id=<%=rs.getString("p_id") %>" ><img src="${pageContext.request.contextPath}/resource/images/<%=rs.getString("p_fileName") %>"style="width:100%"></a>
				<h3><%=rs.getString("p_name")%></h3>
				<p>배기량:<%=rs.getString("p_description") %>
				<h5>가격:<fmt:formatNumber value='<%=rs.getString("p_unitPrice")%>' pattern="#,###"/>원</h5>
				
				<!-- <p>구매하기  -->
			</div>
			<%
			}
				if (rs != null)
					rs.close();
				if(pstmt !=null)
					pstmt.close();
				if(conn != null)
					conn.close();
					%>
		</div>
		<hr>
	</div>
	
	<jsp:include page="../footer.jsp"/>
</body>
</html>
