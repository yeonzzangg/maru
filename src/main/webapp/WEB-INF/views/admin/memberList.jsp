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
</head>
<body>
	<jsp:include page="/WEB-INF/tags/nav.jsp"/>

	<h3>전체 회원 목록 </h3>
	<div id="allMemberList">
		<table class="table">
			<thead>
				<th>아이디</th>
				<th>패스워드</th>
				<th>이름</th>
				<th>이메일</th>
			</thead>
			<tbody>
				<c:forEach items="${memberList }" var="member">
					<tr>
						<td>
							<c:url value="/member/info" var="memberInfoLink" >
								<c:param value="${member.userId }" name="userId"></c:param>
							</c:url>
							<a href="${ memberInfoLink }">
								${member.userId }
							</a>
						</td>
						<td>${member.password }</td>
						<td>${member.name }</td>
						<td>${member.email }</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
	</div>

	
	
    <jsp:include page="/WEB-INF/tags/footer.jsp"/>
    
<script type="text/javascript">


</script>
</body>
</html>







