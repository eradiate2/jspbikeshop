/*
 * 2020.06.10 유효성 검사
 * 
 */

function CheckAddProduct(){
	
	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var price = document.getElementById("price");
	var unitsInStock = document.getElementById("unitsInStock");
	
	//상품 아이디 체크
	/*if(!check(/^P[0-9]{4,11}$/,productId,"[상품코드]\nP와 숫자를 조합하여 5~12자 까지 입력하세요\n첫 글자는 반드시 P로 시작하세요")){
		return false;
	}*/
	
	//상품명 체크
	if(name.value.length < 4 || name.value.length > 12){
       alert("[상품명]\n최소 4자에서 최대 12자 까지 입력하세요!");
       name.select();
       name.focus();
	   return false;
	}
	
	if(price.value == ""){
		alert("[가격]\n가격을 입력하세요!");
		price.select();
		price.focus();
		return false;
	}
	
	if(price.value.length == 0 || isNaN(price.value)){
		alert("[가격]\n숫자만 입력하세요!");
		price.select();
		price.focus();
		return false;
	}
	
	if(price.value < 0){
		alert("[가격]\n음수는 입력할 수 없습니다!");
		price.select();
		price.focus();
		return false;
	}else if(!check(/^\d+(?:[.]?[\d]?[\d])?$/,price,"[가격]\n소숫점 둘째 자리까지만 입력하세요!")){
		return false;
	}

    if(isNaN(unitsInStock.value)){
    	alert("[재고수]\n숫자만 입력하세요!");
    	unitsInStock.select();
    	unitsInStock.focus();
    	return false;
    }
    
    function check(regExp,e,msg){
    	
    	if(regExp.test(e.value)){
    		return true;
    	}
    	
    	alert(msg);
    	e.select();
    	e.focus();
    	return false;
    	
    }
    
    document.newProduct.submit();
}
/*function CheckAddMember(){
	
	var productId = document.getElementById("productId");
	var name = document.getElementById("name");
	var price = document.getElementById("price");
	var unitsInStock = document.getElementById("unitsInStock");
	
	//상품 아이디 체크
	if(!check(/^P[0-9]{4,11}$/,productId,"[상품코드]\nP와 숫자를 조합하여 5~12자 까지 입력하세요\n첫 글자는 반드시 P로 시작하세요")){
		return false;
	}
	
	//상품명 체크
	if(name.value.length < 4 || name.value.length > 12){
       alert("[상품명]\n최소 4자에서 최대 12자 까지 입력하세요!");
       name.select();
       name.focus();
	   return false;
	}
	
	if(price.value == ""){
		alert("[가격]\n가격을 입력하세요!");
		price.select();
		price.focus();
		return false;
	}
	
	if(price.value.length == 0 || isNaN(price.value)){
		alert("[가격]\n숫자만 입력하세요!");
		price.select();
		price.focus();
		return false;
	}
	
	if(price.value < 0){
		alert("[가격]\n음수는 입력할 수 없습니다!");
		price.select();
		price.focus();
		return false;
	}else if(!check(/^\d+(?:[.]?[\d]?[\d])?$/,price,"[가격]\n소숫점 둘째 자리까지만 입력하세요!")){
		return false;
	}

    if(isNaN(unitsInStock.value)){
    	alert("[재고수]\n숫자만 입력하세요!");
    	unitsInStock.select();
    	unitsInStock.focus();
    	return false;
    }
    
    function check(regExp,e,msg){
    	
    	if(regExp.test(e.value)){
    		return true;
    	}
    	
    	alert(msg);
    	e.select();
    	e.focus();
    	return false;
    	
    }
    
    document.newProduct.submit();
}*/


function CheckAddMember(){

	
	var id = newMember.id.value;
	/*var id = document.getElementById("id").value;
	var flag = true;
	var list =  [<%=values.toString()%>];*/
	var password = newMember.password.value;
	var name = newMember.name.value;
//	var passwd2 = newMember.password_confirm.value;
	var gender = newMember.gender.value;
	var birth = newMember.birth.value;
//	var mail1 = newMember.mail1.value;
//	var mail2 = newMember.mail2.value;
	var phone = newMember.phone.value;
	var address = newMember.address.value;
	var address2 = newMember.address2.value;
//	var postCd = newMember.postCd.value;
//	
	
	if (id == ""){
		alert("아이디를 입력하세요");
		newMember.id.select();
		newMember.id.focus();
		return false;
	}
	if(id.length < 4 || id.length > 12){
	       alert("[아이디]\n최소 4자에서 최대 12자 까지 입력하세요!");
	       newMember.id.select();
	       newMember.id.focus();
		   return false;
		}
	/*for(var i=0;i<list.length;i++){
		if(id==list[i]){
			flag=false;
			break;
		}
	}
	if(flag)
		alert("사용 가능한 아이디 입니다.");
	else
		alert("중복된 아이디 입니다.");*/

	
	
	if (password == "") {
		alert("비밀번호를 입력하세요.");
		newMember.password.select();
		newMember.password.focus();
		return false;
	}
	
//	if (passwd2 == "") {
//		alert("비밀번호 확인을 입력하세요.");
//		newMember.password_confirm.select();
//		newMember.password_confirm.focus();
//		return false;
//	}
//
//	if (passwd1 != passwd2) {
//		alert("비밀번호를 동일하게 입력하세요.");
//		newMember.password_confirm.select();
//		newMember.password_confirm.focus();
//		return false;
//	}
//	
	if (name == "") {
		alert("이름을 입력하세요.");
		newMember.name.select();
		newMember.name.focus();
		return false;
	}	
	
	if (gender == "") {
		alert("성별을 선택하세요.");
		newMember.gender[0].focus();		
		return false;
	}		
	
	if (document.newMember.birth.value == "") {
		alert("생일을 선택하세요.");
		newMember.birth.select();
		newMember.birth.focus();
		return false;
	}
	if (document.newMember.phone.value == "") {
		alert("휴대폰 번호를 입력하세요.");
		newMember.phone.select();
		newMember.phone.focus();
		return false;
	}	
	if (document.newMember.address.value == "") {
	alert("우편번호 찾기를 실행하세요");
	newMember.address.select();
	newMember.address.focus();
	return false;
	}	

	if (document.newMember.address2.value == "") {
	alert("상세주소내역을 입력하세요");
	newMember.address2.select();
	newMember.address2.focus();
	return false;
	}
	
	

//	
//	if(passwd1.search(id) > -1){
//		alert("비밀번호는 아이디를 포함할 수 없습니다!");
//		newMember.passwd1.select();
//		newMember.passwd1.focus();
//		return false;
//	}
	
	
	document.newMember.submit();
}
//================ 배송정보 유효성검사
function Profile(){

	var name = addressProfile.name.value;
	var shippingDate = addressProfile.shippingDate.value;
	var country = addressProfile.country.value;
	var zipCode = addressProfile.zipCode.value;
	var addressName = addressProfile.addressName.value;
	var addressName2 = addressProfile.addressName2.value;
	

	
	if (name == ""){
		alert("성함을 입력하세요");
		addressProfile.name.select();
		addressProfile.name.focus();
		return false;
	}

	
	if (shippingDate == "") {
		alert("배송일을 입력하세요.");
		addressProfile.shippingDate.select();
		addressProfile.shippingDate.focus();
		return false;
	}
	
	if (country == "") {
		alert("전화번호를 입력하세요.");
		addressProfile.country.select();
		addressProfile.country.focus();
		return false;
	}	
	
	if (zipCode == "") {
		alert("우편번호를 선택하세요.");
		addressProfile.zipCode.focus();		
		return false;
	}		
	
	if (addressName == "") {
	alert("우편번호 찾기를 실행하세요");
	addressProfile.addressName.select();
	addressProfile.addressName.focus();
	return false;
	}	

	if (addressName2 == "") {
	alert("상세주소내역을 입력하세요");
	addressProfile.addressName2.select();
	addressProfile.addressName2.focus();
	return false;
	}
	
	
	
	document.addressProfile.submit();
}
//주문내역 유효성 검사

function orderCheck(){
	
	var s_number = newMember1.s_number.value;
	
	if (s_number == "") {
	alert("주문내역을 입력하세요");
	return false;
	}
	document.newMember1.submit();
}

