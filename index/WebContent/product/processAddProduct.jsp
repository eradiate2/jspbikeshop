<!-- 상품 등록 페이지 -->

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="product.Product" %>
    <%@ page import="com.oreilly.servlet.*" %>
    <%@ page import="com.oreilly.servlet.multipart.*" %>
    <%@ page import="java.util.*" %>
    <%-- <%@ page import="dao.ProductRepository" %> --%>
    <%@ page import="java.sql.*" %>
    <%@ include file="../dbconn.jsp" %>
 
    <%
    	request.setCharacterEncoding("UTF-8");
    String filename="";
    String realFolder="E:\\jspStudy\\index\\WebContent\\resource\\images";
    int maxSize=5*1024*1024;
    String encType="utf-8";
    
    MultipartRequest multi=
    		new MultipartRequest(request,realFolder,maxSize,encType,new DefaultFileRenamePolicy());
    
    String productId= multi.getParameter("productId");
    String name=multi.getParameter("name");
    String unitPrice = multi.getParameter("price");
    String description=multi.getParameter("description");
    String category=multi.getParameter("category");
    String manufacturer=multi.getParameter("manufacturer");
    String unitsInStock=multi.getParameter("unitsInStock");
    String condition=multi.getParameter("condition");
    
    Integer price;
    
    if(unitPrice.isEmpty())
    	price=0;
    else
    	//ValueOf():기본자료형->객체형
    	price=Integer.valueOf(unitPrice);
    
    long stock;
    
    if(unitsInStock.isEmpty())
    	stock=0;
    else
    	stock=Long.valueOf(unitsInStock);
    
    Enumeration files=multi.getFileNames();
    String fname=(String)files.nextElement();
    String fileName=multi.getFilesystemName(fname);
    
    /* ProductRepository dao=ProductRepository.getInstance(); */
    
    /* Product newProduct=new Product(); */
    PreparedStatement pstmt = null;
    
    String sql="insert into product values(?,?,?,?,?,?,?,?,?)";
    
    pstmt = conn.prepareStatement(sql);
    
    pstmt.setString(1, productId);
    pstmt.setString(2, name);
    pstmt.setInt(3, price);
    pstmt.setString(4, description);
    pstmt.setString(5, category);
    pstmt.setString(6, manufacturer);
    pstmt.setLong(7, stock);
    pstmt.setString(8, condition);
    pstmt.setString(9, fileName);
    
    pstmt.executeUpdate();
    
    if(pstmt != null)
    	pstmt.close();
    if(conn != null)
    	conn.close();
    /* newProduct.setProductId(productId);
    newProduct.setPname(name);
    newProduct.setUnitPrice(price);
    newProduct.setDescription(description);
    newProduct.setManufacturer(manufacturer);
    newProduct.setCategory(category);
    newProduct.setUnitsInStock(stock);
    newProduct.setCondition(condition);
    newProduct.setFilename(fileName);
    
    dao.addProduct(newProduct); */
    //메인화면으로 가기
    
    response.sendRedirect("products.jsp");
   %>
    
    