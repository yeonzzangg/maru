<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">

<link rel="stylesheet" href="../../css/login.css">
</head>
<body>
	<jsp:include page="/WEB-INF/tags/nav.jsp"/>

	<!--로그인-->
    <div id="login">
        <h2>로그인</h2>
        <p>별마로 천문대를 방문해주셔서 감사합니다.</p>
        <form method="post">
            <fieldset>
                <ul>
                    <li>
                        <input type="text" name="username" placeholder="로그인">
                    </li>
                    <li>
                        <input type="password" name="password" placeholder="비밀번호">
                    </li>
                    <li><a href="#a">아이디 찾기</a><span></span><a href="#a">비밀번호 찾기</a><input type="checkbox">아이디 저장</li>
                </ul>
                <ul><input type="submit" value="로그인"></ul>
            </fieldset>
        </form>
        <h5><b></b>아직 별마로 회원이 아니신가요?<span><a href="#a">회원가입<i class="fa-solid fa-right-long"></i></a></span></h5>
    </div>
    
    <jsp:include page="/WEB-INF/tags/footer.jsp"/>
    
<script type="text/javascript">
/* message 경고창 */
const message = "${message}";
if (message != '') {
	alert(message);
};
</script>
</body>
</html>