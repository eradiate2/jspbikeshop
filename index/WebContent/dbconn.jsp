<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>데이터베이스 연결</title>
</head>
<body>

	<%
		Connection conn = null;
	
		try{
			String url="jdbc:mysql://localhost:3306/company";
			String user="root";
			String password = "1234";
			
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(url,user,password);
			/* out.println("데이터베이스 연결이 성공했습니다."); */
			
		}catch (SQLException ex){
			out.println("데이터베이스 연결이 실패했습니다.<br>");
			out.println("SQLException: "+ex.getMessage());
		}
	%>
	
</body>
</html>