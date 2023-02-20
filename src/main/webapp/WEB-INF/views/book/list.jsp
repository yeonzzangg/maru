<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../../css/notice.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<sec:authentication property="name" var="userIdValue"/>
	
	<jsp:include page="/WEB-INF/tags/nav.jsp"/>
	
	<h2>${userIdValue } 님의 예매내역</h2>

	<c:forEach items="${bookList }" var="book">
	<c:url value="/book/remove" var="removeLink">
		<c:param name="number" value="${ book.number }"></c:param>
	</c:url>
	    <table>
			<tr>
				<td>관람일</td>
				<td>${book.bookDate }</td>
			</tr>
			<tr>
				<td>관람시간</td>
				<td>${book.bookTime }</td>
			</tr>
			<tr>
				<td>예매자명</td>
				<td>${book.name }</td>
			</tr>
			<tr>
				<td>관람인원</td>
				<td>${book.personnel }</td>
			</tr>
			<tr>
				<td>
				<a href="${removeLink }">취소하기</a></td>
			</tr>
	    </table>
	</c:forEach>
	
 	<jsp:include page="/WEB-INF/tags/footer.jsp"/>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">
const ctx = "${pageContext.request.contextPath}";
</script>
</body>
</html>