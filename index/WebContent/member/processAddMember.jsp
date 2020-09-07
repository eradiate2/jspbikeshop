<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%
	String id = request.getParameter("id");
	String password = request.getParameter("password");
	String password2 = request.getParameter("password2");
	String securitynumber = request.getParameter("securitynumber");
	String securitynumber1 = request.getParameter("securitynumber1"); 
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String birth = request.getParameter("birth");
	String mail = request.getParameter("mail");
	String phone = request.getParameter("phone"); 
	String address = request.getParameter("address");
	String address2 = request.getParameter("address2");
	String postCd = request.getParameter("postCd");
	String regdate = request.getParameter("regdate");
	

	//가입일자 처리
	Date now = new Date();
	SimpleDateFormat sf = 
	  new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	String today = sf.format(now);

%>

<sql:setDataSource 
    var="dataSource"
	url="jdbc:mysql://localhost:3306/company"
	driver="com.mysql.jdbc.Driver" 
	user="root" 
	password="1234"/>

<sql:update dataSource="${dataSource}" 
            var="resultSet">
    insert into human values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)
    <sql:param value="<%=id%>" />
	<sql:param value="<%=password%>" />
	<sql:param value="<%=password2%>" />
	<sql:param value="<%=securitynumber %>" />
	<sql:param value="<%=securitynumber1 %>" />
	<sql:param value="<%=name%>" />
	<sql:param value="<%=gender%>" />
	<sql:param value="<%=birth%>" />
	<sql:param value="<%=mail%>" />
	<sql:param value="<%=phone%>" />
	<sql:param value="<%=address%>" />
	<sql:param value="<%=address2%>" />
	<sql:param value="<%=postCd%>"/>
	<sql:param value="<%=regdate%>" />
</sql:update>

<c:redirect url="resultMember.jsp?gubun=insert" />


