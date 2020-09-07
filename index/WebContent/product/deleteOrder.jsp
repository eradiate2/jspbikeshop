<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ page import="java.sql.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@include file="../dbconn.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>주문한 상품 취소</title>
</head>
<body>

<%
		String s_number = request.getParameter("s_number");
		/* int p_unitsInStock = Integer.parseInt(request.getParameter("p_unitsInStock")); */		
		String p_name = request.getParameter("p_name");

		
		/* System.out.println(p_unitsInStock); */
		
		
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		
		String sql = "select * from orderdetail where s_number = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,s_number);
		//rs 값은 데이터베이스에 쿼리 실행결과
		rs = pstmt.executeQuery();
	
	
	//rs.next() 는 쿼리문의 다음값이 있으면 실행
	while(rs.next()){
		
		sql = "delete from address where s_number = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,s_number);
		pstmt.executeUpdate();
		//데이터베이스에 있는 주문한 모든 데이터를 가져와서 수정한다
		
		
		sql = "update product set p_unitsInStock = p_unitsInStock + ? where p_name = ? ";
		/* for(int i=0; i<=p_name; i++){ */
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,rs.getString("p_unitsInStock"));
		pstmt.setString(2,rs.getString("p_name"));
		pstmt.executeUpdate();
		
		
		sql = "delete from orderdetail where s_number = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1,s_number);
		pstmt.executeUpdate();
	}
	
	if(rs != null) rs.close();
	if(pstmt != null) pstmt.close();
	if(conn != null) conn.close();
	
	/* response.sendRedirect("../index.jsp"); */
	
	%>


<%-- 	<%
		String s_number = request.getParameter("s_number");

	
		System.out.println(s_number);
	%>
		
	<sql:setDataSource
	var="dataSource"
	driver="com.mysql.jdbc.Driver"
	url="jdbc:mysql://localhost:3306/company"
	user="root"
	password="1234"/>




<sql:update
	dataSource="${dataSource}"
	var="resultSet">
	
	delete from cart
	 where s_number = ?
	 
	<sql:param value="<%=s_number%>"/> 

</sql:update>


<sql:update
	dataSource="${dataSource}"
	var="resultSet">
	
	delete from order1
	 where s_number = ?
	 
	<sql:param value="<%=s_number%>"/> 

</sql:update> --%>



	<c:redirect url="resultMember.jsp?gubun=delete"/>

</body>
</html>