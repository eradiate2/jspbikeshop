<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
  <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인페이지</title>

<style>

	* {box-sizing:border-box}

body {
	font-family: Verdana,sans-serif;
	margin:0;

}

/* Slideshow container */

#container{
	height:650px;
}


.slideshow-container {

width: 100%;

height: 500px;

position: static;

margin: auto;

margin-top: 50px;

}

.main_slideImg{

width: 100%; 

height: 650px; 

top : 100px;

}
.next{
margin-right: 201px;
}

/* Next & previous buttons */

.prev, .next {

  cursor: pointer;

  position: absolute;

  text-align : center;

  top: 0;

  top: 47%;

  width: 3%;

  padding: 16px;

  margin-top: -22px;

  color: white;

  font-weight: bold;

  font-size: 18px;

  transition: 0.6s ease;

  border-radius: 0 3px 3px 0;

  z-index: 100;

}

/* Position the "next button" to the right */

.next{

  right: 0;

  border-radius: 3px 0 0 3px;

}

/* On hover, add a black background color with a little bit see-through */

.prev:hover, .next:hover {

  background-color: rgba(0,0,0,0.8);

}

/* Caption text */

.text {

  color: #f2f2f2;

  font-size: 15px;

  padding: 8px 12px;

  position: absolute;

  bottom: 8px;

  width: 100%;

  text-align: center;

}

/* Number text (1/3 etc) */

.numbertext {

  color: #f2f2f2;

  font-size: 12px;

  padding: 8px 12px;

  position: absolute;

  top: 0;

}

/* The dots/bullets/indicators */

.dot {

  cursor:pointer;

  height: 13px;

  width: 13px;

  margin: 0 2px;

  background-color: #bbb;

  border-radius: 50%;

  display: inline-block;

  transition: background-color 0.6s ease;

}

.active, .dot:hover {

  background-color: #717171;

}

/* Fading animation */

.fade2 {

  -webkit-animation-name: fade;

  -webkit-animation-duration: 0.5s;

  animation-name: fade;

  animation-duration: 5s;

}

@-webkit-keyframes fade2 {

  from {opacity: .4}

  to {opacity: 1}

}

@keyframes fade2 {

  from {opacity: .4}

  to {opacity: 1}

}

/* On smaller screens, decrease text size */

@media only screen and (max-width: 300px) {

  .slprev, .slnext,.text {font-size: 11px}

}

article{
		width:1500px;
		margin:0 auto;
		
	}
	.img{
		float:left;
	}
	.mainimg2 img{
		width:1500px;
		height:400px;
	}
	article .img{
		width:1500px;
		height:355px;
		/* border:1px solid black; */
		margin:0 auto ;
		display:inline-block;

	}
	.main3{
		text-align:center;
		border-bottom:1px solid green;
	}
	 .img div a img{
		width:365px;
		height:355px;
		float:left;
		margin:5px 5px 5px 5px;
		display:inline-block;
	} 
	
	
</style>

</head>



<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>



<body>
	<jsp:include page="header.jsp" />
	<jsp:include page="nav.jsp" />
	
<article>
<div id="container">
	<div class="slideshow-container">
	
		<div class="mySlides fade2">
		
			<img class="main_slideImg" src="resource/images/bike1.jpg">
			
		</div>
		
		<div class="mySlides fade2">
		
			<img class="main_slideImg" src="resource/images/bike231.jpg">
	
		</div>
	
		<div class="mySlides fade2">
		
			<img class="main_slideImg" src="resource/images/bike3.jpg">
		
		</div>
		
			<a class="prev" onclick="plusSlides(-1)">❮</a>
			
			<a class="next"onclick="plusSlides(1)">❯</a>
		
		
	</div>
	
</div>
<div style="text-align: center">
		
		<span class="dot" onclick="currentSlide(1)"></span> 
		
		<span class="dot" onclick="currentSlide(2)"></span>
		
		<span class="dot" onclick="currentSlide(3)"></span>
	
	</div>
<br>


	
		<div class="main3"><h2><span style="color:red">BEST</span> COMPLETE BIKE <span style="font-size:20px">윤셩바이크샵의 인기 완성 바이크!</span></h2></div>
	<div class="row">
	  <div class="img">	
		<%@include file="dbconn.jsp" %>
		
		<%
			PreparedStatement pstmt = null;
			ResultSet rs = null;
			String sql = "select * from product";
			pstmt=conn.prepareStatement(sql);
			/* 쿼리실행문장 */
			rs=pstmt.executeQuery();
			while (rs.next()){
		%> 
			
		
	
			<div class="col-md-3" style="text-align:center">
			<div style=""><a href="${pageContext.request.contextPath}/product/buyProduct.jsp?id=<%=rs.getString("p_id") %>"><img src="${pageContext.request.contextPath}/resource/images/<%=rs.getString("p_fileName") %>"></a></div>
			
			<p style="font-size:30px"><%=rs.getString("p_name")%>
			<p>배기량:<%=rs.getString("p_description")%>
			<p><b>재조사</b>:<%=rs.getString("p_manufacturer")%>
			<h4 style="color:red">가격:<fmt:formatNumber value='<%=rs.getString("p_unitPrice")%>'
				 pattern="#,###" />원</h4>
			</div>
		<%
			}%></div>
			</div><%
			
				if (rs != null)
					rs.close();
				if(pstmt !=null)
					pstmt.close();
				if(conn != null)
					conn.close();
	
			%>
			
	<%-- <input type="hidden" name ="${_csrf.parameterName }" value="${_csrf.token }"> --%>
	</article>
	
 	
 <%-- <jsp:include page="footer.jsp" /> --%> 	
</body>

<script>

$( document ).ready(function() {
	currentSlide(1);
});


function plusSlides(n) {

	  showSlides(slideIndex += n);

	}

	function currentSlide(n) {

	  showSlides(slideIndex = n);

	}

	function showSlides(n) {

	  var i;

	  var slides = document.getElementsByClassName("mySlides");

	  var dots = document.getElementsByClassName("dot");

	  if (n > slides.length) {slideIndex = 1}

	  if (n < 1) {slideIndex = slides.length}

	  for (i = 0; i < slides.length; i++) {

	      slides[i].style.display = "none";

	  }

	  for (i = 0; i < dots.length; i++) {

	      dots[i].className = dots[i].className.replace(" active", "");

	  }

	  slides[slideIndex-1].style.display = "block";

	  dots[slideIndex-1].className += " active";

	}


	
</script>
</html>
