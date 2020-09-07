<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page errorPage="exceptionNoProductId.jsp" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="../dbconn.jsp" %>    
    
<!DOCTYPE html>
<html>
<head>

<%
	String sessionId = (String) session.getAttribute("sessionId");
%>

<style>
	/* .col-md-3 img{
		width:100%;
		height:300px;
	} */
	
	.row{
		margin-top:50px;
	}
	.col-md-3{
		 margin-top:100px;
	}
	/* p{
		margin:0 0 50px;
	} */
	 
	/* a .btn btn-info{
	 	width:84.5px;	
	}
	a .btn btn-warning{
	 	width:84.5px;
	}
	a .btn btn-success{
		width:84.5px;
	} */
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
<!-- <link rel="stylesheet" href="./resources/css/bootstrap.min.css"> -->
<meta charset="UTF-8">
<title>상품 상세 정보</title>
<script>
	function addToCart(){
		if(confirm("상품을 장바구니에 추가하시겠습니까?")){
			document.addForm.submit();
		}else{
			document.addForm.reset();
		}
	}
	
	function addToCart2(){
		
		alert("품절이지롱 다팔렷지롱.");
		
	}
	function login(){
		alert("로그인을 해주세요!");
	}
</script>
</head>
<body>
	<jsp:include page="../header.jsp"/>
	<jsp:include page="../nav.jsp"/>
	
	<div class="header5"><img src="../resource/images/bike1.jpg"></div>
	<div class="container">
			<h1 class="display-3">상품 정보</h1>
		</div><hr>
	
	<!-- <div class="jumbotron">
		<div class="container">
			<h1 class="display-3"><a href="index.jsp"><img src="resource/images/index.jpg"></a>상품 정보</h1>
		</div>
	</div> --> 
	
	<%
		String id = request.getParameter("id");

		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from product where p_id = ?";
		
			pstmt = conn.prepareStatement(sql);
			pstmt.setString(1,id);
			rs = pstmt.executeQuery();
			
			
			while(rs.next()){
			
			
		%>
	
	<div class="container" style="height:660px;">
		<div class="row">
			<div class="col-md-9">
				<img src="${pageContext.request.contextPath}/resource/images/<%=rs.getString("p_fileName")%>" style="width:90%">
			</div>	
			<div class="col-md-3">
				<h3><%=rs.getString("p_name")%></h3>
				<p><%=rs.getString("p_description")%>
				<p><b>상품코드:</b><span class="badge badge-danger">
				<%=rs.getString("p_id")%></span>
				<p><b>제조사</b>:<%=rs.getString("p_category")%>
				<p><b>분류</b>:<%=rs.getString("p_manufacturer")%>
				<p><b>재고수</b>:<%=rs.getString("p_unitsInStock")%>
				<h4><fmt:formatNumber value='<%=rs.getString("p_unitPrice")%>'
				 pattern="#,###" />원</h4>
				 <%
				 	if(sessionId != null){
				 %>
				<p><form name="addForm" action="./addCart.jsp?id=<%=rs.getString("p_id")%><%-- &m_id=<%=sessionId %>&p_name=<%=rs.getString("p_name")%>&p_unitPrice=<%=rs.getString("p_unitPrice")%> --%>" method="post"> 
					
					<%if(rs.getString("p_unitsInStock").equals("0")){ %>
					<a href="#" class="btn btn-info" onclick="addToCart2()">상품주문</a>
					<%}else { %>
					<a href="#" class="btn btn-info" onclick="addToCart()">상품주문</a>
					<%} %>
					<a href="./cart.jsp" class="btn btn-warning">장바구니</a>
					<a href="./products.jsp" class="btn btn-success">상품목록</a>
				</form>
				<%
				 	}else{
				 		response.sendRedirect("../member/loginMember.jsp");
				 	}
				 
				%>
				
			</div>
		</div>
	</div>	
	<%
			
		}
		
	%>
	<hr>
	
	<jsp:include page="../footer.jsp"/>

</body>
</html>