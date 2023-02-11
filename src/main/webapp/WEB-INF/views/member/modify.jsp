<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>수정수정</title>
<link rel="stylesheet" href="../../css/signup.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/WEB-INF/tags/nav.jsp"/>

	<!--회원정보 수정-->
    <div id="signup">
        
        <form method="post" id="modifyForm">
	        <h2>회원정보 수정</h2>
	        <p>${member.userId }님의 회원정보</p>
	        <ul class="info">
	        	<li class="txt">이름</li>
	            <li><input type="text" value="${member.name }" readonly></li>
	            
	        	<li class="txt">아이디</li>
	            <li><input type="text" value="${member.userId }" readonly></li>
	            
	            <li class="txt">비밀번호 변경<input id="newPasswordCheckbox1" type="checkbox" name="newPassword" ></li>
	        	<li class="txt">새 비밀번호</li>
	            <li><input disabled id="passwordInput1" type="text" name="password" ></li>

	        	<li class="txt"> 비밀번호 확인</li>
	            <li><input disabled id="passwordInput2" type="text" ></li>
	            <li id="passwordText1" class="form-text"></li>
	            
	        	<li class="txt">이메일<span id="emailExistButton1">중복확인</span></li>
	            <li><input id="emailInput1" type="text" value="${member.email }" name="email" data-old-value="${member.email }"></li>
	            <li id="emailText1" class="form-text"></li>
	            
	            <input type="hidden" name="oldPassword" />
	        </ul>
        </form>
        
        <c:url value="/member/remove" var="removeUrl"></c:url>
        <form id="removeForm" action="${removeUrl }" method="post">
        	<input type="hidden" name="userId" value="${member.userId }"/>
        	<input type="hidden" name="oldPassword" />
        </form>
        
        <div class="btnBox">
	        <input disabled id="modifyModalButton1" class="btn1 disabled" type="submit" value="수정완료" data-bs-toggle="modal" data-bs-target="#modifyModal" >
    	   	<input class="btn1 leave" type="submit" value="탈퇴하기" data-bs-toggle="modal" data-bs-target="#removeModal" >
        </div>
        
    </div>
    
    <!-- 수정 모달-->
	<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">기존 비밀번호를 입력해주세요</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<input type="text" id="oldPasswordInput1" />
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" id="modalConfirmButton1"  class="btn btn-primary">확인</button>
	      </div>
	    </div>
	  </div>
	</div>

    <!-- 탈퇴 모달-->
	<div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">비밀번호를 입력해주세요</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	      	<input type="text" id="oldPasswordInput2" />
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" id="modalConfirmButton2"  class="btn btn-primary">탈퇴</button>
	      </div>
	    </div>
	  </div>
	</div>
    
    <jsp:include page="/WEB-INF/tags/footer.jsp"/>

<script type="text/javascript">
const ctx = "${pageContext.request.contextPath}";

<%-- 새 패스워드 입력 체크박스 --%>
document.querySelector("#newPasswordCheckbox1").addEventListener("change", function() {
	const pwInput1 = document.querySelector("#passwordInput1");
	const pwInput2 = document.querySelector("#passwordInput2");
	if (this.checked) { //활성화
		pwInput1.removeAttribute("disabled");
		pwInput2.removeAttribute("disabled");
	} else { //비활성화
		pwInput1.setAttribute("disabled", "");
		pwInput2.setAttribute("disabled", "");
	}
});

/* message 경고창 */
const message = "${message}";
if (message != '') {
	alert(message);
};

// 패스워드 사용 가능
let availablePassword = true;
//이메일 사용 가능
let availableEmail = true;

function availableModifyButton() {
	const button = document.querySelector("#modifyModalButton1");
	
	if (availableEmail && availablePassword){
		// 수정버튼 활성화
		button.removeAttribute("disabled");
		button.classList.remove("disabled");
	}else {
		// 수정버튼 비활성화
		button.setAttribute("disabled", "");
		button.classList.add("disabled");
	}
}

<%-- 이메일 중복확인--%>
const emailInput1 = document.querySelector("#emailInput1");
const emailExistButton1 = document.querySelector("#emailExistButton1");
const emailText1 = document.querySelector("#emailText1");

<%-- 이메일 input값이 변경 되었을 때--%>
emailInput1.addEventListener("keyup", function(){
	availableEmail = false;
	
	const oldValue = emailInput1.dataset.oldValue;
	const newValue = emailInput1.value;
	
	if(oldValue == newValue){
		emailText1.innerText = "";
		availableEmail = true;
	} else {
		emailText1.innerText = "이메일 중복확인을 해주세요.";
	}
	availableModifyButton();
})

<%-- 중복확인 클릭하면--%>
emailExistButton1.addEventListener("click", function(){
	availableEmail = false;
	
	const email = emailInput1.value;
	
	fetch(ctx + "/member/existEmail/", {
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify({email})
	})
		.then(res => res.json())
		.then(data => {
			// 응답받아서 메세지 출력
			document.querySelector("#emailText1").innerText = data.message;
			if (data.status == "not exist"){
				availableEmail = true;
			}
			availableModifyButton();
		})
})

<%-- 비밀번호 일치 확인 --%>
const passwordInput1 = document.querySelector("#passwordInput1");
const passwordInput2 = document.querySelector("#passwordInput2");
const passwordText1 = document.querySelector("#passwordText1");

document.querySelector("#passwordInput1").addEventListener("keyup", matchPassword);
document.querySelector("#passwordInput2").addEventListener("keyup", matchPassword);

function matchPassword(){
	availablePassword = false;
	if (passwordInput1.value == passwordInput2.value){
		passwordText1.innerText = "패스워드가 일치합니다.";
		availablePassword = true;
	} else {
		passwordText1.innerText = "패스워드가 일치하지 않습니다.";
	}
	availableModifyButton();
}

<%-- 수정 모달 확인 버튼 눌렀을 때 --%>
document.querySelector("#modalConfirmButton1").addEventListener("click", function() {
	const form = document.forms.modifyForm;
	const modalInput = document.querySelector("#oldPasswordInput1");
	const formOldPasswordInput = document.querySelector(`#modifyForm input[name="oldPassword"]`)
	// 모달 암호 input 입력된 값을 
	// form 안의 기존암호 input에 옮기고
	formOldPasswordInput.value = modalInput.value;
	
	// form을 submit
	form.submit();	
});

<%-- 탈퇴 모달 확인 버튼 눌렀을 때 --%>
document.querySelector("#modalConfirmButton2").addEventListener("click", function() {
	const form = document.forms.removeForm;
	const modalInput = document.querySelector("#oldPasswordInput2");
	const formOldPasswordInput = document.querySelector(`#removeForm input[name="oldPassword"]`)
	// 모달 암호 input 입력된 값을 
	// form 안의 기존암호 input에 옮기고
	formOldPasswordInput.value = modalInput.value;
	
	// form을 submit
	form.submit();	
});
</script>
</body>
</html>