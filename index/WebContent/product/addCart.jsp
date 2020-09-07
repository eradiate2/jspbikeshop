<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="product.Product"%>
<%@ include file="../dbconn.jsp"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page import="java.sql.*" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>장바구니</title>
</head>



<body>

<%-- <%
	
		String p_id = request.getParameter("id");
		/* String p_unitPrice = request.getParameter("p_unitPrice"); */
		String m_id =request.getParameter("m_id");
		String p_name =request.getParameter("p_name");
		
		String p_unitPrice =request.getParameter("p_unitPrice");
	%>
	
	
	<sql:setDataSource 
    var="dataSource"
	url="jdbc:mysql://localhost:3306/company"
	driver="com.mysql.jdbc.Driver" 
	user="root" 
	password="1234"/>

<sql:update dataSource="${dataSource}" 
            var="resultSet">
    insert into cart values (?, ?, ?, ?)
    
    <sql:param value="<%=p_id %>"/>
    <sql:param value="<%=m_id %>"/>
    <sql:param value="<%=p_name %>"/>
    
    <sql:param value="<%=p_unitPrice %>"/>
    <sql:param value="<%=p_name%>" />
	<sql:param value="<%=p_unitPrice%>" />
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
</sql:update> --%>

<%
		String id = request.getParameter("id");
	
	 	if(id == null || id.trim().equals("")){
			response.sendRedirect("products.jsp");
			return;
		}
		
		ArrayList<Product> list = (ArrayList<Product>)session.getAttribute("cartlist");
		
		if(list == null){
			list = new ArrayList<Product>();
			session.setAttribute("cartlist",list);
		}
		
		//데이터베이스 접근
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		int cnt = 0;
		Product goodsQnt = new Product();
		
		for(int i=0;i<list.size();i++){
			goodsQnt = list.get(i);
			
			//동일한 상품을 선택하면
			if(goodsQnt.getProductId().equals(id)){
				cnt++;
				int orderQuantity = goodsQnt.getQuantity() + 1;
				goodsQnt.setQuantity(orderQuantity);
			}
			
		}
		
		//장바구니에 처음으로 담긴 상품이면
		//수량을 1로 대입
		if(cnt == 0){
			
			try{
				
				Product goods = new Product();
				String sql = "select * from product where p_id = ?";
				pstmt = conn.prepareStatement(sql);
				pstmt.setString(1,id);
				rs = pstmt.executeQuery();
				
				while(rs.next()){
					goods.setPname(rs.getString("p_name"));
					goods.setProductId(rs.getString("p_id"));
					goods.setPrice(rs.getInt("p_unitPrice"));
					goods.setQuantity(1);
					
					list.add(goods);
				}
				
			}catch(SQLException e){
					out.println("addCart.jsp 오류<br>");
					out.println("SQLException:" + e.getMessage());
			}finally{
				if(rs != null) rs.close();
				if(pstmt != null) pstmt.close();
				if(conn != null) conn.close();
			}
		}
		
		
		
		
		response.sendRedirect("buyProduct.jsp?id=" + id/* +"&m_id="+m_id+"&p_unitPrice="+p_unitPrice */);	
	
	%>
</body>
</html>