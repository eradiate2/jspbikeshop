<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
    <%@ page import="java.sql.*" %>
    <%@include file="../dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품내역 가져오기</title>
</head>
<style>
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
<body>



<jsp:include page="../header.jsp" />
	<jsp:include page="../nav.jsp" />
	
	<div class="header5"><img src="../resource/images/bike1.jpg"></div>
	<div class="container">
			<h1 class="display-3">주문확인</h1>
		</div><hr>

	<%-- <%
		String cartId = request.getParameter("cartid");
		/* String password =  
			request.getParameter("password"); */
	%>
	
	<sql:setDataSource
		var = "dataSource"
		driver = "com.mysql.jdbc.Driver"
		url = "jdbc:mysql://localhost:3306/company"
		user = "root"
		password = "1234"/>
		
	 <sql:query
	      dataSource="${dataSource}"
	      var="resultSet">
	      
	      select * 
	        from cart
	       where cartId = ?
	          

		  <sql:param value="<%=cartId%>" />
		  
	 </sql:query>
 
	 <c:if test="${resultSet.rowCount > 0}">
	  <%
	 	session.setAttribute("sessionId",cartId);
	  
	  	System.out.println(cartId);
	   %>
	   
	   
	   
	   <c:redirect url="../index.jsp?gubun=login"/>
	  
	 </c:if>
	 
	 <c:if test="${resultSet.rowCount == 0}">
	 	<c:redirect url="resultMember.jsp?gubun=loginError"/>
	 
	 </c:if> --%>	
	<% 	
	 String s_number = request.getParameter("s_number");
		System.out.println(s_number);
	
			/* String productId= multi.getParameter("productId"); */
		
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			
			String sql;
			
			if(s_number!=null){
				sql= "select * from orderdetail where s_number=?";
				pstmt=conn.prepareStatement(sql);
				pstmt.setString(1, s_number);
				
			}
			/* else{
				response.sendRedirect("order.jsp");
			}  */
			
			rs=pstmt.executeQuery();
			
			while (rs.next()){
			 %>
			 <div class="container">
		<div class="row">
			<table>
			
			</table>
		</div>
			
		<div style="padding-top: 50px">
			<table class="table table-hover">
			<tr>
			<th>상품</th>
			<th>가격</th>
			<th>수량</th>
			<th>소계</th>
			<th>비고</th>
			</tr>
			
			
			
			<tr>
				<td><%=rs.getString("p_name") %></td>
				<td class="text-rigth"><%=rs.getString("p_unitPrice")%>원</td>
				<td class="text-rigth"><%=rs.getString("p_unitsInStock") %>
					<!-- <button type="button" onclick="CountUp()">▲</button>
                    <button type="button" onclick="CountDown()">▼</button>   --></td>
				<td class="text-rigth"><%=rs.getString("s_unitPrice")%>원</td>
				<td><a href="deleteOrder.jsp?s_number=<%=s_number%>" class="badge badge-danger">삭제</a></td>
			</tr>
			 <%-- <div class="col-md-4">
				<img src="${pageContext.request.contextPath}/resource/images/<%=rs.getString("p_id") %>"style="width:100%">
				<h3><%=rs.getString("p_name") %></h3>
				<h3><%=rs.getString("p_unitPrice")%></h3>
				<h3><%=rs.getString("s_unitPrice")%></h3>
				<p><%=rs.getString("p_unitsInStock") %>
				
				
				<h3><fmt:formatNumber value='<%=rs.getString("p_unitPrice")%>' pattern="#,###"/>원</h3>	
			</div> --%>
			<%
			}
			%>
			
			</table></div></div>
			<%
				if (rs != null)
					rs.close();
				if(pstmt !=null)
					pstmt.close();
				if(conn != null)
					conn.close();
			%>
			 
</body>
</html>

