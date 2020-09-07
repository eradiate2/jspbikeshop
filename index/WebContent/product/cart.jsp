<!-- 장바구니 페이지 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="product.Product" %>
    <%@ include file="../dbconn.jsp"%>
<%@ taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
    <%-- <%@ page import="dao.ProductRepository" %> --%>

    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
 
<!DOCTYPE html>
<html>
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
<head>

<!-- <link rel="stylesheet" href="./resources/css/bootstrap.min.css" /> -->
	<%
		String cartId = session.getId();
		
		String sessionId = (String) session.getAttribute("sessionId");
		
	%>
<meta charset="UTF-8">
<title>장바구니 페이지</title>
</head>
<script>
	function checkOrder(){
		<%
		
		 	ArrayList list = (ArrayList<Product>)session.getAttribute("cartlist"); 
		
			if(list == null || list.size() == 0){
				
		%>
		
			alert("선택하신 상품내역이 없습니다!");
			location.href = './cart.jsp';
			return false;
			
		<%
			}
		%>
			return true;
			
	}
</script>

<body>



	<jsp:include page="../header.jsp" />
	<jsp:include page="../nav.jsp" />
	
	
	<div class="header5"><img src="../resource/images/bike1.jpg"></div>
	<div class="container">
			<h1 class="display-3">장바구니</h1>
		</div><hr>
	
	
		
	
			
	<div class="container">
		<div class="row">
			<table width="100%">
				<tr>
					<td align="left"><a href="./deleteCart.jsp?cartId=<%=cartId %>" class="btn btn-danger">삭제하기</a></td>
					<td align="right">
 					<a href="./shippinginfo.jsp?cartId=<%=cartId %>&id=<%=sessionId %>" onclick="return checkOrder()"	class="btn btn-success">
					
					<%-- <a href="./shippinginfo.jsp?cartId=<%=cartId %>&id=<%=sessionId&pname=<%=product.getPname()&price=<%=product.getPrice %>" onclick="return checkOrder()"	class="btn btn-success"> --%>
					주문하기</a></td>
					
				</tr>
			</table>
		</div>
			
		<div style="padding-top: 50px">
			<table class="table table-hover">
			<tr>
			<th>상품</th>
			<th>가격</th>
			<th>수량</th>
			<th>소계</th>
			<th>비고</th>
			</tr>
			
			<%

			int sum=0;
			ArrayList<Product> cartList = (ArrayList<Product>)session.getAttribute("cartlist");
			if(cartList == null)
				cartList = new ArrayList<Product>();			
			//total : 소계를 계산
			//sum : 총계
			for(int i = 0; i<cartList.size(); i++){//상품 리스트 하나씩 출력하기
				Product product = cartList.get(i);
			int total = product.getPrice()*product.getQuantity();
			sum = sum+total;
			
			%>
			<sql:setDataSource 
			    var="dataSource"
				url="jdbc:mysql://localhost:3306/company"
				driver="com.mysql.jdbc.Driver" 
				user="root" 
				password="1234"/>	
			<sql:update dataSource="${dataSource}" 
            var="resultSet">
    insert into cart values (?, ?, ?, ?, ?)
    
    <sql:param value="<%=sessionId %>"/>
    <sql:param value="<%=product.getPname()%>"/>
    <sql:param value="<%=product.getPrice() %>"/>
    <sql:param value="<%=product.getQuantity() %>"/>
    <sql:param value="<%=total %>"/>
    
    
		
	</sql:update>
		<!-- class="text-rigth" 우측정렬  -->
			<tr>
				<td><%=product.getProductId() %>-<%=product.getPname() %></td>
				<td class="text-rigth"><fmt:formatNumber value="<%=product.getPrice() %>" pattern="#,###" />원</td>
				<td class="text-rigth" name = "qnt" id="qnt"><fmt:formatNumber value="<%=product.getQuantity()%>" pattern="#,###" />
					<button type="button" onclick="CountUp()">▲</button>
                    <button type="button" onclick="CountDown()">▼</button>  </td>
				<td class="text-rigth"><fmt:formatNumber value="<%=total %>" pattern="#,###" />원</td>
				<td><a href="./removeCart.jsp?id=<%=product.getProductId()%>" class="badge badge-danger">삭제</a></td>
			</tr>
					
			<%	
			
			}
			
			%>
			
			<tr>
				<th></th>
				<th></th>
				<th class="text-rigth">총액</th>
				<th class="text-rigth"><fmt:formatNumber value="<%=sum %>" pattern="#,###" />원</th>
				<th></th>
			</tr>
			
		</table>
			
		<a href="./products.jsp" class="btn btn-success">&laquo;쇼핑계속하기</a>
		
		</div>
		<hr>
	</div>
	<%-- <jsp:include page="../footer.jsp" /> --%>
</body>
<script>
    var x = document.getElementById("qnt").value;
    function CountUp(){
        x++;
        document.getElementById("qnt").value = x;
    }
    function CountDown(){
        x--;
        if(x<=1){
            x = 1;
        }
        document.getElementById("qnt").value = x;
    }
</script>
</html>

