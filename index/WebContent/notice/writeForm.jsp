<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String name = (String)request.getAttribute("name");
%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 등록</title>
</head>
<style>
	.header5{
		width:100%;
		height:450px;
		/* border:1px solid black; */
	}
	.header5 img{
		width:100%;
		height:450px;
	}
</style>
<body>
<jsp:include page="../header.jsp" />
	<jsp:include page="../nav.jsp" />
	<div class="header5"><img src="./resource/images/bike1.jpg"></div>
	
	<!-- <div class="jumbotron"> -->
		<div class="container">
			<h1 class="display-3"><a href="index.jsp"></a>게시판등록</h1>
		</div><hr>
	<div class="container">
		<form name="newWrite" action="./BoardWriteAction.do" class="form-horizontal" method="post">
		    <input name="id" type="hidden" class="form-control" value="${sessionId}">
			<div class="form-group row">
				<label class="col-sm-2 control-label">제목</label>
				<div class="col-sm-5">
					<input name="subject"
						   class="form-control"
						   placeholder="제목">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 control-label">내용</label>
				<div class="col-sm-6" style="word-break:break-all;">
					<textarea name="content" class="form-control" rows="5" cols="50" placeholder="내용">
					</textarea>
				</div>
			</div> 
			<div class="form-group row">
				<label class="col-sm-2 control-label">작성자</label>
				<div class="col-sm-3">
					<input name="name"
						   type="text"
						   class="form-control"
						   readonly="readonly"
						   value="<%=name%>">
				</div>
			</div>
			<div class="form-group row" style="text-align:center">
				<input type="submit" class="btn btn-success" value="등록">
				<input type="reset" class="btn btn-warning" value="취소">
			</div>
		</form>
	</div>
	<hr>
	<%-- <jsp:include page="../footer.jsp"/> --%>
</body>
</html>