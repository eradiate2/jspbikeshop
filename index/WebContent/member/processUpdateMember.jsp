<%@ page contentType="text/html; charset=utf-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="java.text.SimpleDateFormat" %>

<%

  String id =
      (String) session.getAttribute("sessionId");

	String password = request.getParameter("password");
	String password2 = request.getParameter("password2");
	String name = request.getParameter("name");
	String gender = request.getParameter("gender");
	String birth = request.getParameter("birth");
	birth = birth.replaceAll("-","");
	String mail1 = request.getParameter("mail1");
	String mail2 = request.getParameterValues("mail2")[0];
	String mail = mail1 + "@" + mail2;
	String phone = request.getParameter("phone");
	String address = request.getParameter("address");
	String address2 = request.getParameter("address2");
	String postCd = request.getParameter("postCd"); 
	

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
     
    update human
       set password = ?,
       	   password2 = ?, 
           name = ?,
           gender = ?, 
           birth = ?,
           mail = ?,
           phone = ?,
           address = ?,
           address2 = ?,
           postcd = ?,
           regdate = ?
     where id = ?
    
	<sql:param value="<%=password%>" />
	<sql:param value="<%=password2%>" />
	<sql:param value="<%=name%>" />
	<sql:param value="<%=gender%>" />
	<sql:param value="<%=birth%>" />
	<sql:param value="<%=mail%>" />
	<sql:param value="<%=phone%>" />
	<sql:param value="<%=address%>" />
	<sql:param value="<%=address2%>" />
	<sql:param value="<%=postCd%>"/>
	<sql:param value="<%=today%>" />
	<sql:param value="<%=id%>" />
</sql:update>

<c:redirect url="resultMember.jsp?gubun=update" />


