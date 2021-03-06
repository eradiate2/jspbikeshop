<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 form 페이지</title>
</head>
<style>


	/* body {
    padding-top: 90px;
} */
.header5{
		width:100%;
		height:350px;
		/* border:1px solid black; */
	}
	.header5 img{
		width:100%;
		height:350px;
	}

.panel-login {
	border-color: #ccc;
	-webkit-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	-moz-box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
	box-shadow: 0px 2px 3px 0px rgba(0,0,0,0.2);
}
.panel-login>.panel-heading {
	color: #00415d;
	background-color: #fff;
	border-color: #fff;
	text-align:center;
}
.panel-login>.panel-heading a{
	text-decoration: none;
	color: #666;
	font-weight: bold;
	font-size: 15px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}
.panel-login>.panel-heading a.active{
	color: #029f5b;
	font-size: 18px;
}
.panel-login>.panel-heading hr{
	margin-top: 10px;
	margin-bottom: 0px;
	clear: both;
	border: 0;
	height: 1px;
	background-image: -webkit-linear-gradient(left,rgba(0, 0, 0, 0),rgba(0, 0, 0, 0.15),rgba(0, 0, 0, 0));
	background-image: -moz-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	background-image: -ms-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
	background-image: -o-linear-gradient(left,rgba(0,0,0,0),rgba(0,0,0,0.15),rgba(0,0,0,0));
}
.panel-login input[type="text"],.panel-login input[type="email"],.panel-login input[type="password"] {
	height: 45px;
	border: 1px solid #ddd;
	font-size: 16px;
	-webkit-transition: all 0.1s linear;
	-moz-transition: all 0.1s linear;
	transition: all 0.1s linear;
}
.panel-login input:hover,
.panel-login input:focus {
	outline:none;
	-webkit-box-shadow: none;
	-moz-box-shadow: none;
	box-shadow: none;
	border-color: #ccc;
}
.btn-login {
	background-color: #59B2E0;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #59B2E6;
}
.btn-login:hover,
.btn-login:focus {
	color: #fff;
	background-color: #53A3CD;
	border-color: #53A3CD;
}
.forgot-password {
	text-decoration: underline;
	color: #888;
}
.forgot-password:hover,
.forgot-password:focus {
	text-decoration: underline;
	color: #666;
}

.btn-register {
	background-color: #1CB94E;
	outline: none;
	color: #fff;
	font-size: 14px;
	height: auto;
	font-weight: normal;
	padding: 14px 0;
	text-transform: uppercase;
	border-color: #1CB94A;
}
.btn-register:hover,
.btn-register:focus {
	color: #fff;
	background-color: #1CA347;
	border-color: #1CA347;
}
</style>
<body>

	<jsp:include page="../header.jsp" />
	<jsp:include page="../nav.jsp" />

	<div class="header5"><img src="../resource/images/bike1.jpg"></div>

<div class="member1">
		<div class="container">
    	<div class="row">
			<div class="col-md-6 col-md-offset-3">
				<div class="panel panel-login">
					<div class="panel-heading">
						<div class="row">
							<div class="col-xs-12">
								
								<a href="#" class="active" id="login-form-link">비밀번호 찾기</a>
							</div>
							<!-- <div class="col-xs-6">
								<a href="#" id="register-form-link">Register</a>
							</div> -->
						</div>
						<hr>
					</div>
					<div class="panel-body">
						<div class="row">
							<div class="col-lg-12">
								<form name="searchId" id="login-form" action="processPasswordfind.jsp" method="post" role="form" style="display: block;">
									<div class="form-group">
										<input type="text" name="id" id="username" tabindex="1" class="form-control" placeholder="ID" value="">
									</div>
									<div class="form-group">
										<input type="text" name="name" id="username" tabindex="1" class="form-control" placeholder="Name" value="">
									</div>
									<div class="form-group">
										<!-- <input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password"> -->
										<input  name="Securitynumber" type="text" maxlength="13" size="13" tabindex="2" class="form-control" />-<input  name="Securitynumber1" type="password" maxlength="13" size="13" tabindex="2" class="form-control" />
									</div>
									<!-- <div class="form-group text-center">
										<input type="checkbox" tabindex="3" class="" name="remember" id="remember">
										<label for="remember"> Remember Me</label>
									</div> -->
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="login-submit" id="login-submit" tabindex="4" class="form-control btn btn-login" value="확인">
											</div>
										</div>
									</div>
									<!-- <div class="form-group">
										<div class="row">
											<div class="col-lg-12">
												<div class="text-center">
													<a href="idfind.jsp" tabindex="5" class="forgot-password">ID 찾기</a>
													<a href="passwordfind.jsp" tabindex="5" class="forgot-password">Password 찾기</a>
												</div>
											</div>
										</div>
									</div> -->
								</form>
								<form id="register-form" action="https://phpoll.com/register/process" method="post" role="form" style="display: none;">
									<div class="form-group">
										<input type="text" name="username" id="username" tabindex="1" class="form-control" placeholder="Username" value="">
									</div>
									<div class="form-group">
										<input type="email" name="email" id="email" tabindex="1" class="form-control" placeholder="Email Address" value="">
									</div>
									<div class="form-group">
										<input type="password" name="password" id="password" tabindex="2" class="form-control" placeholder="Password">
									</div>
									<div class="form-group">
										<input type="password" name="confirm-password" id="confirm-password" tabindex="2" class="form-control" placeholder="Confirm Password">
									</div>
									<div class="form-group">
										<div class="row">
											<div class="col-sm-6 col-sm-offset-3">
												<input type="submit" name="register-submit" id="register-submit" tabindex="4" class="form-control btn btn-register" value="Register Now">
											</div>
										</div>
									</div>
								</form>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- <form name="searchId" action="processPasswordfind.jsp" method="post" class="member2">
		  
		  <div class="member3">
			<label for="inputUserId" >ID </label>
		   <div class="member4">
			<input  name="id" type="text" /><br>
		   </div>	
		  </div>
		  
		 <div class="member3">
			<label for="inputUserName" >이름 </label>
		   <div class="member4">
			<input  name="name" type="text" /><br>
		   </div>	
		  </div>
		  
		  <div class="member3">
			<label>주민번호</label>
		   <div class="member4">
			<input  name="Securitynumber" type="text" maxlength="13" size="13" />-<input  name="Securitynumber1" type="password" maxlength="13" size="13" /><br>
		   </div>	
		  </div>
		  <br>
		  
		  <div class="member3">
		   <div class="member4">
			<button type="submit" value="등록">password찾기</button>
		   </div>	
		  </div>
		</form> -->
	</div>
</body>
</html>