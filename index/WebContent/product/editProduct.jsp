<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<%@ include file="../dbconn.jsp"%>
    
<!DOCTYPE html>
<html>
<head>
<style>
	.col-md-4 img{
		width:365px;
		height:355px;
		float:left;
		margin:5px 5px 5px 5px;
		
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
<!-- <link rel="stylesheet" href="./resources/css/bootstrap.min.css"/> -->
<meta charset="UTF-8">
<title>상품 편집</title>
<script type="text/javascript">
	function deleteConfirm(id){
		if (confirm("해당 상품을 삭제합니다!!")==true)
			location.href = "./deleteProduct.jsp?id="+id;
		else
			return;
		
	}
</script>
</head>
<body>
	<%
		//현재 모드가 상품수정 이면
		//상품수정을 수행하고 
		//삭제모드이면 삭제처리
		String edit = request.getParameter("edit");
	%>

	<jsp:include page="../header.jsp"/>
	<jsp:include page="../nav.jsp"/>
	
	<!-- <div class="jumbotron">
		<div class="container">
			<h1 class="display-4">상품 편집</h1>
		</div>
	</div> -->
	
	<div class="header5"><img src="../resource/images/bike1.jpg"></div>
	<div class="container">
			<h1 class="display-3" style="color:red">상품편집</h1>
		</div>
	
	<div class="container">
		<div class="row" align="center">
			<%
				PreparedStatement pstmt = null;
				ResultSet rs = null;
				
				String sql = "select * from product";
				pstmt = conn.prepareStatement(sql);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
				%>
				
				<div class="col-md-4">
					<img src="${pageContext.request.contextPath}/resource/images/<%=rs.getString("p_fileName")%>" style="width:100%">
					<h3><%=rs.getString("p_name")%></h3>
					<p><%=rs.getString("p_description")%></p>
					<p><%=rs.getString("p_unitPrice")%>원</p>
					<p>
					<%
						if(edit.equals("update")){
					%>
					
					<a href="./updateProduct.jsp?id=<%=rs.getString("p_id")%>" class="btn btn-success" role="button">수정&raquo;</a>
					
					<%
						}else if (edit.equals("delete")){
					%>
					<a href="#" onclick="deleteConfirm('<%=rs.getString("p_id")%>')" class="btn btn-danger" role="button">삭제&raquo;</a>
					<%
						}
					%>
				</div>	
				<%	
					}
					
		        if(rs != null) rs.close();
		        if(pstmt != null) pstmt.close();
		        if(conn != null) conn.close();
				%>
		</div>
		<hr>
	</div>
	
	<%-- <jsp:include page="footer.jsp"/> --%>
</body>
</html>