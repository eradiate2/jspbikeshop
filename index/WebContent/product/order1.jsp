<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>    
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
</head>
<body>
	<%
		String s_number = request.getParameter("s_number");
		
		
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
	        from orderdetail
	       where s_number = ?
	         

		  <sql:param value="<%=s_number%>" />
		  
	 </sql:query>
 
	 <c:if test="${resultSet.rowCount > 0}">
	  <%
	 	session.setAttribute("s_number",s_number);
	  
	  	String url = "processOrder.jsp?s_number=" + s_number;
	   %>
	   
	   <c:redirect url="<%=url%>"/>
	  
	 </c:if>
	 
	 <c:if test="${resultSet.rowCount == 0}">
	 	<c:redirect url="../member/resultMember.jsp?gubun=loginError"/>
	 
	 </c:if>	
	 	
	 
	 	
	
</body>
</html>

