<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLDecoder"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="product.Product" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>




<!DOCTYPE html>
<html>
<head>
<!-- <link rel="stylesheet" href="./resources/css/bootstrap.min.css"/> -->
<meta charset="UTF-8">
<title>주문 완료</title>
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

<%
		String id = request.getParameter("cartId");
	
String m_id = (String) session.getAttribute("sessionId");
		
	%>
		
<!--  ===============================  -->

	<%
	/* String cartId = session.getId(); */
	%>

	<%-- <%
		String Shipping_cartId = "";
		String shipping_name = "";
		String shipping_shippingDate = "";
		String shipping_country = "";
		String shipping_zipCode = "";
		String shipping_addressName = "";
		String shipping_addressName2 = "";
		
		Cookie[] cookies = request.getCookies();
		
		if(cookies != null){
			for(int i=0;i<cookies.length;i++){
				Cookie thisCookie = cookies[i];
				String n = thisCookie.getName();
				
				if(n.equals("Shipping_cartId")){
					Shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				}
				
				if(n.equals("Shipping_shippingDate")){
					shipping_shippingDate = URLDecoder.decode((thisCookie.getValue()),"utf-8");
				}
			}
		}
	%> --%>
	
	<%
		/* String cartId = session.getId(); */
	
		/* String shipping_cartId = ""; */
		
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
				/* if(n.equals("Shipping_cartId"))
					shipping_cartId = URLDecoder.decode((thisCookie.getValue()),"utf-8"); */
				
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
	
	<!-- 주문한 회원의 배송정보를 테이블에 넣는다 -->
	
	<sql:update dataSource="${dataSource}" 
            var="resultSet">
    insert into address values (?, ?, ?, ?, ?, ?, ?, ?)
    <sql:param value="<%=id%>" />
    
    <%-- <sql:param value="<%=shipping_id%>" />
    <sql:param value="<%=shipping_pname%>" />
    <sql:param value="<%=shipping_pPrice%>" /> --%>
    <sql:param value="<%=m_id%>" />
	<sql:param value="<%=shipping_name%>" />
	<sql:param value="<%=shipping_country%>" />
	<sql:param value="<%=shipping_shippingDate%>" />
	<sql:param value="<%=shipping_zipCode %>" />
	<sql:param value="<%=shipping_addressName %>" />
	<sql:param value="<%=shipping_addressName2%>" />

</sql:update>
	
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
				<%-- <tr>
					<td class="text-center"><em><%=product.getPname() %></em></td>
					<td class="text-center"><fmt:formatNumber value='<%=product.getQuantity() %>' pattern="#,###"/></td>
					<td class="text-center"><fmt:formatNumber value='<%=product.getPrice() %>' pattern="#,###"/>원</td>
					<td class="text-center"><fmt:formatNumber value='<%=total %>' pattern="#,###"/>원</td>
				</tr> --%>
				
				

	<sql:update dataSource="${dataSource}" 
            var="resultSet">
    insert into orderdetail values (?, ?, ?, ?, ?, ?, ?)
    
    <sql:param value="<%=product.getPname() %>"/>
    <sql:param value="<%=m_id%>"/>
    <sql:param value="<%=product.getPrice() %>"/>
    <sql:param value="<%=product.getQuantity() %>"/>
    <sql:param value="<%=total %>"/>
    <sql:param value="<%=shipping_shippingDate%>"/>
    <sql:param value="<%=id %>"/>
		
	</sql:update>
	
	
	
	
	<!-- 주문완료시 주문한 수량만큼 상품테이블의 수량 감소 -->
	<sql:update dataSource="${dataSource}" 
            var="resultSet">
    update product set p_unitsInStock = p_unitsInStock - ? where p_name = ?  
    
    
    <sql:param value="<%=product.getQuantity() %>"/>
    <sql:param value="<%=product.getPname() %>"/>
			
	</sql:update>
				
				<!-- update product set quantity = quantity - ? where p_id = ? -->
				
				<%
					}
				%>
	<sql:update dataSource="${dataSource}" var="resultSet">
		
		insert into ordermst (s_number,m_id,shippingDate,s_unitsInStock,ps_unitPrice)
		(select s_number,max(m_id),max(shippingDate),sum(p_unitsInStock),sum(s_unitPrice) from orderdetail where s_number = ? )
	
	<sql:param value="<%=id %>"/>
			
	</sql:update> 
	
	<jsp:include page="../header.jsp"/>
	<jsp:include page="../nav.jsp"/>
	
	<div class="header5"><img src="../resource/images/bike1.jpg"></div>
	<div class="container">
			<h1 class="display-3">영수증</h1>
		</div><hr>
	
	<div class="container">
		<h2 class="alert alert-danger">주문해주셔서 감사합니다.</h2>
		<p>주문은 <% out.println(shipping_shippingDate);%>에 배송될 예정입니다!
		<p>주문번호:<% out.println(id);%>
	</div>
	
	<div class="container">
		<p><a href="./products.jsp" class="btn btn-seconary">&laquo;상품목록</a>
	</div>
</body>
</html>

<%
	
	/* session.invalidate(); = 전체 데이터 삭제 */
	
	/* session.removeAttribute("cartId"); */
	
	//장바구니 쿠키에 대한 정보만 전체 삭제
	session.removeAttribute("cartlist");

	for(int i=0;i<cookies.length;i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		
		/* if(n.equals("Shipping_Id")){
			thisCookie.setMaxAge(0);
		} */
		/* if(n.equals("Shipping_cartId")){
			thisCookie.setMaxAge(0);
		} */
		if(n.equals("Shipping_name")){
			thisCookie.setMaxAge(0);
		}
		
		if(n.equals("Shipping_country")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_shippingDate")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_zipCode")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_addressName")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_addressName2")){
			thisCookie.setMaxAge(0);
		}
		
		response.addCookie(thisCookie);
	}
%>