<!-- 장바구니 전체 삭제 페이지 -->


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="product.Product" %>
<%@ page import="java.net.URLDecoder"%>
<%-- <%@ page import="dao.ProductRepository" %> --%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body> 

	<%
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
	%>

	<%
	
	/* session.invalidate(); = 전체 데이터 삭제 */
	
	//장바구니 쿠키에 대한 정보만 전체 삭제
	session.removeAttribute("cartlist");

	for(int i=0;i<cookies.length;i++){
		Cookie thisCookie = cookies[i];
		String n = thisCookie.getName();
		
		if(n.equals("Shipping_Id")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_cartId")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_name")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_shippingDate")){
			thisCookie.setMaxAge(0);
		}
		if(n.equals("Shipping_country")){
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

	<%
		String id=request.getParameter("cartId");
		if(id == null || id.trim().equals("")){
			response.sendRedirect("cart.jsp");
			return;
		}
		
		/* session.invalidate(); */
		
		response.sendRedirect("cart.jsp");
	%>

</body>
</html>