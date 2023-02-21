<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../../css/mypage.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
	<sec:authentication property="name" var="userIdValue"/>
	<c:url value="/member/info" var="memberInfoLink">
		<c:param name="userId" value="${userIdValue }"></c:param>
	</c:url>
	<c:url value="/mypage/reviewList" var="reviewListLink">
		<c:param name="userId" value="${userIdValue }"></c:param>
	</c:url>
	<c:url value="/mypage/qnaList" var="qnaListLink">
		<c:param name="userId" value="${userIdValue }"></c:param>
	</c:url>
	
	<c:url value="/book/list" var="bookListLink" />
	
	<jsp:include page="/WEB-INF/tags/nav.jsp"/>
		
		<div id="mypage">
			<h2>${userIdValue }님의 마이페이지</h2>
			<ul>
				<li>
					<i class="fa-solid fa-user"></i><br>
					<a href="${memberInfoLink }">계정정보</a>
				</li>
				<li>
					<i class="fa-solid fa-star"></i><br>
					<a href="${bookListLink }">예매내역</a>
				</li>
				<li>
					<i class="fa-solid fa-pen"></i><br>
					<a href="${reviewListLink }">나의 리뷰</a>
				</li>
				<li>
					<i class="fa-brands fa-quora"></i><br>
					<a href="${qnaListLink }">문의내역</a>
				</li>
			</ul>
		</div>
		

	
 	<jsp:include page="/WEB-INF/tags/footer.jsp"/>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">
const ctx = "${pageContext.request.contextPath}";

</script>
</body>
</html>