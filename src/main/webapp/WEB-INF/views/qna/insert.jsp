<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../../css/insert.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<sec:authentication property="name" var="userIdValue"/>

	<jsp:include page="/WEB-INF/tags/nav.jsp"/>
	
	<!-- 전체 컨테이너 -->
	<div class="container-sm" >

	<form action="" method="post">
		<div class="categorySelectBox">
			<p class="categorySelect">1:1문의</p>
		</div>
		<div class="row">
			<input class="titleInput" type="text" name="title" placeholder="제목을 입력해주세요."/><br>
		</div>
		<div class="row">
			<textarea class="contnet" name="content" ></textarea>
		</div>
		<input value="${userIdValue }" readonly type="hidden" name="member_userId"/>
		<div class="submitBox">
			<input class="noticeBtn" type="submit" value="등록" />
		</div>
	</form>
	
	</div>
	
 	<jsp:include page="/WEB-INF/tags/footer.jsp"/>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">
const ctx = "${pageContext.request.contextPath}";

</script>
</body>
</html>