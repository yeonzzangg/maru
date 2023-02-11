<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<link rel="stylesheet" href="../../css/signup.css">
</head>
<body>
	<jsp:include page="/WEB-INF/tags/nav.jsp"/>

	<!--회원정보-->
    <div id="signup">
        
        <form method="post">
	        <h2>회원정보</h2>
	        <p>${member.userId }님의 회원정보</p>
	        <ul class="info">
	        	<li class="txt">
	               이름
	            </li>
	            <li>
	               <input type="text" value="${member.name }" readonly="readonly">
	            </li>
	        	<li class="txt">
	               아이디
	            </li>
	            <li>
	               <input type="text" value="${member.userId }" readonly="readonly">
	            </li>
	        	<li class="txt">
	               이메일
	            </li>
	            <li>
	               <input type="text" value="${member.email }" readonly="readonly">
	            </li>
	        </ul>
	        <ul class="modifyBtn">
	        	<c:url value="/member/modify" var="modifyLink">
	        		<c:param value="${member.userId }" name="userId"></c:param>
	        	</c:url>
	        	<a href="${modifyLink }">수정하기</a>
	        </ul>
        </form>
    </div>
    
    <jsp:include page="/WEB-INF/tags/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">

/* message 경고창 */
const message = "${message}";
if (message != '') {
	alert(message);
};

</script>
</body>
</html>