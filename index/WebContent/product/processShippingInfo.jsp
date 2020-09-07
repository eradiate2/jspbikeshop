<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%-- 
	<%
		String id = request.getParameter("cartId");
	
		/* System.out.println(id); */
	%> --%>

	<%
		//배송등록 화면에서 입력받은 모든 항목에 대해 쿠키생성
		Cookie cartId = new Cookie("Shipping_cartId",URLEncoder.encode(request.getParameter("cartId"),"utf-8"));
		
	/* Cookie id = new Cookie("Shipping_id",URLEncoder.encode(request.getParameter("id"),"utf-8"));
	Cookie pname = new Cookie("Shipping_pname",URLEncoder.encode(request.getParameter("pname"),"utf-8"));
	Cookie pPrice = new Cookie("Shipping_pPrice",URLEncoder.encode(request.getParameter("pPrice"),"utf-8")); */
	
		Cookie name = new Cookie("Shipping_name",URLEncoder.encode(request.getParameter("name"),"utf-8"));
	
		
		Cookie country = new Cookie("Shipping_country",URLEncoder.encode(request.getParameter("country"),"utf-8"));
		Cookie shippingDate = new Cookie("Shipping_shippingDate",URLEncoder.encode(request.getParameter("shippingDate"),"utf-8"));
		Cookie zipCode = new Cookie("Shipping_zipCode",URLEncoder.encode(request.getParameter("zipCode"),"utf-8"));
		Cookie addressName = new Cookie("Shipping_addressName",URLEncoder.encode(request.getParameter("addressName"),"utf-8"));
		Cookie addressName2 = new Cookie("Shipping_addressName2",URLEncoder.encode(request.getParameter("addressName2"),"utf-8"));
		
		
		
		//쿠키값의 유효시간:1일 지정
		cartId.setMaxAge(24*60*60);
		name.setMaxAge(24*60*60);
		zipCode.setMaxAge(24*60*60);
		country.setMaxAge(24*60*60);
		addressName.setMaxAge(24*60*60);
		
		//쿠키생성 response 내장객체를 이용
		response.addCookie(cartId);
		
		/* response.addCookie(id);
		response.addCookie(pname);
		response.addCookie(pPrice); */
		
		response.addCookie(name);
		
		response.addCookie(country);
		response.addCookie(shippingDate);
		response.addCookie(zipCode);
		response.addCookie(addressName);
		response.addCookie(addressName2);
		
		response.sendRedirect("orderConfirmation.jsp");
	%>

</body>
</html>