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
		String id = request.getParameter("id");
		String password =  
			request.getParameter("password");
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
	        from human
	       where id = ?
	         and password = ? 

		  <sql:param value="<%=id%>" />
		  <sql:param value="<%=password%>" />
	 </sql:query>
 
	 <c:if test="${resultSet.rowCount > 0}">
	  <%
	 	session.setAttribute("sessionId",id);
	   %>
	   
	   <c:redirect url="../index.jsp?gubun=login"/>
	  
	 </c:if>
	 
	 <c:if test="${resultSet.rowCount == 0}">
	 	<c:redirect url="resultMember.jsp?gubun=loginError"/>
	 
	 </c:if>	
	 	
	 
	 	
	
</body>
</html>

