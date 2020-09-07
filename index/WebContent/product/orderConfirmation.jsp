<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="java.net.URLDecoder" %>
<%@ page import="product.Product" %>

<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>

<%-- <%@ page import="dao.ProductRepository" %> --%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<!DOCTYPE html>
<%@ page import="java.util.UUID" %>	
<%--  <%
	String id = request.getParameter("cartId");
	System.out.println(id);
%>  --%>

 <%
			 	UUID one = UUID.randomUUID();
 			
			%>

<%
		/* String cartId = session.getId(); */
	
		String shipping_cartId = "";
		
		/* String shipping_id = "";
		String shipping_pname = "";
		String shipping_pPrice = ""; */
		
		String shipping_name="";
		
		String shipping_country="";
		String shipping_shippingDate="";
		String shipping_zipCode="";
		String shipping_addressName="";
		String shipping_addressName2="";
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null) {
			for (int i =0; i<cookies.length; i++){
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				if(n.equals("Shipping_cartId"))
					shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				
				/* if(n.equals("Shipping_id"))
					shipping_id = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				
				if(n.equals("Shipping_pname"))
					shipping_pname = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("Shipping_pPrice"))
					shipping_pPrice = URLDecoder.decode((thisCookie.getValue()),"utf-8"); */
				
				if(n.equals("Shipping_name"))
					shipping_name = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				
				if(n.equals("Shipping_country"))
					shipping_country = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("Shipping_shippingDate"))
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("Shipping_zipCode"))
					shipping_zipCode = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("Shipping_addressName"))
					shipping_addressName = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				if(n.equals("Shipping_addressName2"))
					shipping_addressName2 = URLDecoder.decode((thisCookie.getValue()),"utf-8");
			}
			
		}
	%>
	
<sql:setDataSource 
    var="dataSource"
	url="jdbc:mysql://localhost:3306/company"
	driver="com.mysql.jdbc.Driver" 
	user="root" 
	password="1234"/>
<html>

<%-- <sql:update dataSource="${dataSource}" 
            var="resultSet">
    insert into order1 values (?, ?, ?, ?, ?, ?, ?)
    <sql:param value="<%=one%>" />
    
    <sql:param value="<%=shipping_id%>" />
    <sql:param value="<%=shipping_pname%>" />
    <sql:param value="<%=shipping_pPrice%>" />
    
	<sql:param value="<%=shipping_name%>" />
	<sql:param value="<%=shipping_shippingDate%>" />
	<sql:param value="<%=shipping_country%>" />
	<sql:param value="<%=shipping_zipCode %>" />
	<sql:param value="<%=shipping_addressName %>" />
	<sql:param value="<%=shipping_addressName2%>" />

</sql:update> --%>

<head>
<!-- <link rel="stylesheet" href="./resources/css/bootstrap.min.css" /> -->
<meta charset="UTF-8">
<title>Insert title here</title>
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
			<!-- <h1 class="display-3">영수증</h1> -->
		</div><hr>
	
	<div class="container col-8 alert alert-info">
		<div class="text-center">
			<h1>영수증</h1>
		</div>
		
		<div class="row justify-content-between">
			<div class="col-4" align="left">
				<strong>배송 주소</strong><br> 성명 : <%out.println(shipping_name); %><br>
				우편번호 : <%out.println(shipping_zipCode); %>
				주소     : <%out.println(shipping_addressName); %>(<%  out.println(shipping_country); %>)<br>
			</div>
			<div class="col-4" align="right">
				<p> <em>배송일: <%out.println(shipping_shippingDate); %></em>
			</div>
		</div>
		<div>
			<table class="table table-hover">
				<tr>
					<th class="text-center">상품명</th>
					<th class="text-center">수량</th>
					<th class="text-center">가격</th>
					<th class="text-center">소계</th>
				</tr>
				<%
					int sum =0;
					ArrayList<Product> cartList = (ArrayList<Product>) session.getAttribute("cartlist");
					if (cartList == null)
						cartList = new ArrayList<Product>();
					for(int i = 0; i<cartList.size();i++){//상품 리스트 하나씩 출력하기
						Product product = cartList.get(i);
					int total=product.getPrice()*product.getQuantity();
					sum=sum+total;
						
				%>
				<tr>
					<td class="text-center"><em><%=product.getPname() %></em></td>
					<td class="text-center"><fmt:formatNumber value='<%=product.getQuantity() %>' pattern="#,###"/></td>
					<td class="text-center"><fmt:formatNumber value='<%=product.getPrice() %>' pattern="#,###"/>원</td>
					<td class="text-center"><fmt:formatNumber value='<%=total %>' pattern="#,###"/>원</td>
				</tr>
				
				<%-- <sql:setDataSource 
			    var="dataSource"
				url="jdbc:mysql://localhost:3306/company"
				driver="com.mysql.jdbc.Driver" 
				user="root" 
				password="1234"/>

	<sql:update dataSource="${dataSource}" 
            var="resultSet">
    insert into cart values (?, ?, ?, ?)
    
    <sql:param value="<%=product.getPname() %>"/>
    <sql:param value="<%=product.getPrice() %>"/>
    <sql:param value="<%=product.getQuantity() %>"/>
    
    <sql:param value="<%=total %>"/>
			
	</sql:update> --%>
				
				<%
					}
				%>
				<tr>
					<td></td>
					<td></td>
					<td class="text-right"><strong>총액: </strong></td>
					<td class="text-center text-danger"><strong><fmt:formatNumber value='<%=sum %>' pattern="#,###"/>원</strong></td>
				</tr>
			</table>
			
			<!-- <a href="./shippingInfo.jsp" class="btn btn-secondary" role="button">이전</a> -->
			<a href="./thankCustomer.jsp?cartId=<%=one %>" class="btn btn-success" role="button">주문 완료</a>
			<a href="./checkOutCancelled.jsp" class="btn btn-secondary" role="button">취소</a>
			
			
		</div>
	</div>

</body>
</html>