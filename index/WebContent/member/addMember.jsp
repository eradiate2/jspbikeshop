<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!DOCTYPE html>
<html>
<jsp:include page="../header.jsp" />
	 <jsp:include page="../nav.jsp" /> 
<head>
<meta charset="UTF-8">
<title>회원가입 페이지</title>
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
	.member1{
		width:60%;
		height:100%;
		margin:0 auto;
		border:1px solid black;
	}
	.member1 h1{
		text-align:center;
	}
	.member2{
		text-align:center;
	}
	
</style>

<link rel="stylesheet" href="//code.jquery.com/ui/1.11.4/themes/smoothness/jquery-ui.css">
<script src="//code.jquery.com/jquery.min.js"></script>
<script src="//code.jquery.com/ui/1.11.4/jquery-ui.min.js"></script>
<script src="../resource/js/validation.js"></script>

<script>


	$(document).ready(function () {
	   $(function () {
	            $('.phone').keydown(function (event) {
	             var key = event.charCode || event.keyCode || 0;
	             $text = $(this); 
	             if (key !== 8 && key !== 9) {
	                 if ($text.val().length === 4) {
	                     $text.val($text.val() + '-');
	                 }
	                 if ($text.val().length === 8) {
	                     $text.val($text.val() + '-');
	                 }
	             }
	
	             return (key == 8 || key == 9 || key == 46 || (key >= 48 && key <= 57) || (key >= 96 && key <= 105));
				 // Key 8번 백스페이스, Key 9번 탭, Key 46번 Delete 부터 0 ~ 9까지, Key 96 ~ 105까지 넘버패트
				 // 한마디로 JQuery 0 ~~~ 9 숫자 백스페이스, 탭, Delete 키 넘버패드외에는 입력못함
	         })
	   });
	});
</script>



<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
    function Postcode() {
        new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                // 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수

                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }

                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    // 조합된 참고항목을 해당 필드에 넣는다.
                    document.getElementById("addressName2").value = extraAddr;
                
                } else {
                    document.getElementById("addressName2").value = '';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById('postCd').value = data.zonecode;
                document.getElementById("addressName").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("postCd").focus();
            }
        }).open();
    }
 
</script>

<script>
   var request = new XMLHttpRequest();

   function idCheck(){       
       request.open("Get", "${pageContext.request.contextPath}/CheckServlet?userId=" + encodeURIComponent(document.getElementById("id").value),true);             
       request.onreadystatechange = nextProcess;
       request.send(null);
   }
   
   function nextProcess(){
       if(request.readyState == 4 && request.status == 200){
//         console.log("request.responseText : " + request.responseText);
           var object = eval('(' + request.responseText + ')');
//         console.log("object : " + object);
           var result = object.result;
           console.log("result : " + result);
           if(result>0){
               $("#idCheckMsg").html("<span id='idCheckSpan' style='color:red'>이미 등록된 아이디입니다.</span>");
           }else{
               $("#idCheckMsg").html("<span id='idCheckSpan' style='color:green'>사용 가능한 아이디입니다.</span>");
           }
       }       
   }

</script>
<body>

	
	
	<div class="header5"><img src="../resource/images/bike1.jpg"></div>
	
	<div class="container">
		<h1>회원가입</h1>
		<hr>
		<form name="newMember" action="processAddMember.jsp" method="post" class="member2">
		  <div class="form-group row">
			<label class="col-sm-2">아 이 디 </label>
		   <div class="col-sm-3">
			<input id="id" name="id" type="text" class="form-control" placeholder="아이디입력" onkeyup="idCheck()"/><br>
		   </div>
		   <!-- <div class="idcheck">ID중복</div> -->	
		  </div>
		
			<div class="form-group row">
			<label class="col-sm-2">비밀번호 </label>
		   <div class="col-sm-3">
			<input  name="password" type="password" class="form-control" placeholder="비밀번호입력" /><br>
		   </div>	
		  </div>
			
			<div class="form-group row">
			<label class="col-sm-2">비밀번호확인 </label>
		   <div class="col-sm-3">
			<input  name="password2" type="password" class="form-control" placeholder="비밀번호확인입력" /><br>
		   </div>	
		  </div>
		  
		  <div class="form-group row">
			<label class="col-sm-2">이름 </label>
		   <div class="col-sm-3">
			<input  name="name" type="text" class="form-control"/><br>
		   </div>	
		  </div>
		  
		  <!-- 주민번호 추가 -->
		  <div class="form-group row">
			<label class="col-sm-2">주민번호</label>
		   <div class="col-sm-3">
		   
			<input name="securitynumber" class="form-control" type="text" maxlength="13" size="13" />-<input name="securitynumber1" class="form-control" type="password" maxlength="13" size="13" /><br>
		   </div>	
		  </div>
		  
		  
		  <div class="form-group row">
			<label class="col-sm-2">성별 </label>
		   <div class="col-sm-3">
			<input name="gender" type="radio" value="남" /> 남 
			<input name="gender" type="radio" value="여" /> 여<br>
		   </div>	
		  </div>
		  
		  <div class="form-group row">
			<label class="col-sm-2">생년월일 </label>
		   <div class="col-sm-3">
			<input  name="birth" id="birth" type="text" class="form-control"/><br>
		   </div>	
		  </div>
		  
		  <div class="form-group row" >
			<label class="col-sm-2">E-mail </label>
		   <div class="col-sm-2">
			<input  name="mail" type="text" class="form-control" style="height:14"/>
			</div>
			
			<div style="float:left">@
			<select name="mail2" style="margin:5px 670px 0 0">
						<option>naver.com</option>
						<option>daum.net</option>
						<option>gmail.com</option>
						<option>nate.com</option>
				</select>
			</div>

		  </div>
		  
		  <!-- DB에 값이 들어가지않음 -->
		  <div class="form-group row">
			<label class="col-sm-2">연락처 </label>
		   <div class="col-sm-3">
		   <select name="phone" >
		   <option value ="010" selected="selected" >010</option>
		   <option value="011">011</option>
		   <option value="016">016</option>
		   <option value="017">017</option>
		   </select>-<input class="phone" class="form-control" name="phone1" type="text" maxlength="4" size="4">-<input class="phone" class="form-control" name="phone2" type="text" maxlength="4" size="4"><!-- -<input class="phone" name="phone" type="text" maxlength="13" size="13">-<input class="phone" name="phone" type="text" maxlength="13" size="13"> --><br>
		   </div>	
		  </div>
		  
		  <div class="form-group row">
		  	<label class="col-sm-2">우편번호 </label>
		  	<div class="col-sm-3">
		  		<input id="postCd" name="postCd" type="text" class="form-control" readonly="readonly">
		  		<input type="button" class="form-control" value="우편번호 찾기" onclick="Postcode()"/>
		  	</div>
		  </div>
		  
		  <div class="form-group row">
			<label class="col-sm-2">주소 </label>
		   <div class="col-sm-3">
			<input id="addressName" name="address" class="form-control" type="text" readonly="readonly"/><br>
		   </div>	
		  </div>
		  
		  <div class="form-group row">
			<label class="col-sm-2">상세주소 </label>
		   <div class="col-sm-3">
			<input id="addressName2" name="address2" class="form-control" type="text"/><br>
		   </div>	
		  </div>
		  
		  
		  <div class="form-group row">
		   <div class="col-sm-offset-2 col-sm-3">
			<input type="button" class="btn btn-primary" value="등록" onclick="CheckAddMember()">
			<input type="reset" class="btn btn-secondary" value="취소" onclick="reset()">
		   </div>	
		  </div>
		  
		</form>
	</div>
</body>
<script>
	$(function(){
		$("#birth").datepicker({
			changeMonth:true,
			changeYear:true,
			dateFormat:"yy-mm-dd",
			prevText:"이전 달",
			nextText:"다음 달",
			monthNames:['1월','2월','3월','4월',
						'5월','6월','7월','8월',
						'9월','10월','11월','12월'
				       ],
			monthNamesShort:['1월','2월','3월','4월',
							'5월','6월','7월','8월',
							'9월','10월','11월','12월'
					       ],
			dayNames:['일','월','화','수','목','금','토'],
			dayNamesShort:['일','월','화','수','목','금','토'],
			dayNamesMin:['일','월','화','수','목','금','토'],
			showMonthAfterYear:true,
			yearSuffix:'년'
		});
	});
</script>
</html>