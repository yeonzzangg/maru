<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<link rel="stylesheet" href="../../css/signup.css">
</head>
<body>
	<jsp:include page="/WEB-INF/tags/nav.jsp"/>

	<!--회원가입-->
    <div id="signup">
        
        <form method="post">
	        <h2>회원가입</h2>
	        <p>자주 쓰는 메일로 시작해보세요.</p>
	        <ul class="info">
	        	<li class="txt">아이디<span id="userIdExistButton1">중복확인</span></li>
	            <li><input id="userIdInput1" type="text" name="userId"></li>
	            <li id="userIdText1" class="form-text"></li>
	            
	        	<li class="txt">비밀번호</li>
	            <li><input id="passwordInput1" type="text" name="password"></li>
	            <li id="passwordText1" class="form-text"></li>
	            
	        	<li class="txt">비밀번호 확인</li>
	            <li><input id="passwordInput2" type="text" ></li>
	            
	        	<li class="txt">이름</li>
	            <li><input type="text" name="name"></li>
	            
	        	<li class="txt">이메일<span id="emailExistButton1">중복확인</span></li>
	            <li><input id="emailInput1" type="text" name="email"></li>
	            <li id="emailText1" class="form-text"></li>
	        </ul>
	        
	        <ul><input disabled id="submitButton1" class="disabled" type="submit" value="입력완료" ></ul>
        </form>
    </div>
    
    <jsp:include page="/WEB-INF/tags/footer.jsp"/>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">
const ctx = "${pageContext.request.contextPath}";

//아이디 사용 가능
let availableId = false;
// 이메일 사용 가능
let availableEmail = false;
// 패스워드 사용 가능
let availablePassword = false;

function enableSubmitButton() {
	const button = document.querySelector("#submitButton1");
	
	if (availableId && availableEmail && availablePassword) {
		button.removeAttribute("disabled")
		button.classList.remove("disabled");
	} else {
		button.setAttribute("disabled", "");
		button.classList.add("disabled");
	}
}

//id input 변경시 submit 버튼 비활성화
document.querySelector("#userIdInput1").addEventListener("keyup", function() {
	availableId = false;
	document.querySelector("#userIdText1").innerText = "아이디 중복확인을 해주세요.";
	enableSubmitButton();
});

// 이메일 input 변경시 submit 버튼 비활성화
document.querySelector("#emailInput1").addEventListener("keyup", function() {
	availableEmail = false;
	document.querySelector("#emailText1").innerText = "이메일 중복확인을 해주세요.";
	enableSubmitButton();
});

// 이메일 중복 확인
document.querySelector("#emailExistButton1").addEventListener("click", function() {
	availableEmail = false;
	const email = document.querySelector("#emailInput1").value;
	
	// fetch 요청 보내고
	fetch(ctx + "/member/existEmail/", {
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify({email})// email:email 변수명과 프로퍼티명 같은면 생략
	})
		.then(res => res.json())
		.then(data => {
			// 응답받아서 메세지 출력
			document.querySelector("#emailText1").innerText = data.message;
			if (data.status == "not exist") {
				availableEmail = true;
				enableSubmitButton();
			}
		}); 
});

// 아이디 중복 확인
document.querySelector("#userIdExistButton1").addEventListener("click", function() {
	availableId = false;
	// 입력된 userId를
	const userId = document.querySelector("#userIdInput1").value;
	
	// fetch 요청 보내고
	fetch(ctx + "/member/existId/" + userId)
		.then(res => res.json())
		.then(data => {
			// 응답받아서 메세지 출력
			document.querySelector("#userIdText1").innerText = data.message;
			if (data.status == "not exist") {
				availableId = true;
				enableSubmitButton();
			}
		}); 
	
});

// 패스워트 일치확인
const passwordInput1 = document.querySelector("#passwordInput1");
const passwordInput2 = document.querySelector("#passwordInput2");
const passwordText1 = document.querySelector("#passwordText1");

function matchPassword(){
	availablePassword = false;
	
	const value1 = passwordInput1.value;
	const value2 = passwordInput2.value;
	
	if (value1 == value2){
		passwordText1.innerText = "패스워드가 일치합니다.";
		availablePassword = true;
	} else {
		passwordText1.innerText = "패스워드가 일치하지 않습니다.";
	}
	enableSubmitButton();
}

document.querySelector("#passwordInput1").addEventListener("keyup", matchPassword);
document.querySelector("#passwordInput2").addEventListener("keyup", matchPassword);

</script>
</body>
</html>