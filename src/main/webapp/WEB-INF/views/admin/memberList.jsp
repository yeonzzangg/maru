<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/review/reviewList.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
	<jsp:include page="/WEB-INF/tags/nav.jsp"/>


<div id="adminBookList">
	
	<h2>전체 회원 목록 </h2>
	
	<!--검색라인-->
    <div id="search">
        <c:url value="/admin/memberList" var="listLink"></c:url>
		<form action="${listLink }" role="search">
	        <!-- 검색 범위 설정 -->
			<select name="t" class="searchSelect">
				<option value="all">전체</option>
				<option value="member_userId" ${param.t == 'member_userId' ? 'selected' : '' }>아이디</option>
				<option value="name" ${param.t == 'name' ? 'selected' : '' }>이름</option>
				<option value="email" ${param.t == 'email' ? 'selected' : '' }>이메일</option>
			</select>
	        <input name="q" value="${param.q }" type="search" placeholder="검색어를 입력하세요">
	        <input type="submit" value="검색">
        </form>
    </div>
	
	<div id="adminBookTable">
		<table>
			<thead>
				<tr>
	        		<td>아이디</td>
	        		<td>패스워드</td>
	        		<td>이름</td>
	        		<td>이메일</td>
	        	</tr>
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
	
	<!-- 페이지네이션 -->
	<div id="pagination">
        <ul class="pagination">
		  <!-- 첫페이지로 가는 버튼 : 1페이지일때 빼고 다 존재함 -->
		  <c:if test="${pageInfo.currentPageNumber != 1 }">
			  <c:url value="/admin/memberList" var="listLink">
			  		<c:param name="page" value="1"></c:param>
			  		<c:param name="q" value="${param.q }"></c:param>
			  		<c:param name="t" value="${param.t }"></c:param>
			  </c:url>
			  <li class="page-item"><a class="page-link" href="${listLink }">
			  	<i class="fa-solid fa-angles-left"></i>
			  </a></li>
		  </c:if>
		  
		  <!-- 이전 페이지 버튼 -->
		  <c:if test="${pageInfo.hasPrevButton}">
			  <c:url value="/admin/memberList" var="listLink">
			  		<c:param name="page" value="${ pageInfo.jumpPrevPageNumber}"></c:param>
			  		<c:param name="q" value="${param.q }"></c:param>
			  		<c:param name="t" value="${param.t }"></c:param>
			  </c:url>
			  <li class="page-item"><a class="page-link" href="${listLink }">
			  	<i class="fa-solid fa-angle-left"></i>
			  </a></li>
		  </c:if>
	  
		  <c:forEach begin="${pageInfo.leftPageNumber }" end="${pageInfo.rightPageNumber }" var="pageNumber">
		  	<c:url value="/admin/memberList" var="listLink">
		  		<c:param name="page" value="${pageNumber }"></c:param>
		  		<c:param name="q" value="${param.q }"></c:param>
		  		<c:param name="t" value="${param.t }"></c:param>
		  	</c:url>
		  	
		  	<!-- 현재 페이지 active 클래스 추가 -->
		    <li class="page-item
		  		  ${ pageInfo.currentPageNumber == pageNumber ? 'active' : ''}
		    "><a class="page-link" href="${listLink }">${pageNumber }</a></li>
		  </c:forEach>
		  
		  <!-- 다음 페이지 버튼 -->
		  <c:if test="${pageInfo.hasNextButton}">
			  <c:url value="/admin/memberList" var="listLink">
			  		<c:param name="page" value="${ pageInfo.jumpNextPageNumber}"></c:param>
			  		<c:param name="q" value="${param.q }"></c:param>
			  		<c:param name="t" value="${param.t }"></c:param>
			  </c:url>
			  <li class="page-item"><a class="page-link" href="${listLink }">
			  	<i class="fa-solid fa-angle-right"></i>
			  </a></li>
		  </c:if>
		  
		  <!-- 마지막 페이지로 가는 버튼 : 마지막페이지일때 빼고 다 존재함 -->
		  <c:if test="${pageInfo.currentPageNumber != pageInfo.lastPageNumber }">				  	
			  <c:url value="/admin/memberList" var="listLink">
			  		<c:param name="page" value="${pageInfo.lastPageNumber }"></c:param>
			  		<c:param name="q" value="${param.q }"></c:param>
			  		<c:param name="t" value="${param.t }"></c:param>
			  </c:url>
			  <li class="page-item"><a class="page-link" href="${listLink }">
			  	<i class="fa-solid fa-angles-right"></i>
			  </a></li>
		  </c:if>
	   </ul>
   </div>
	
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







