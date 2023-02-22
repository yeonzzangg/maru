<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지</title>
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
	
	<sec:authentication property="name" var="userId"/>
	
    <div id="adminBookList">
		<h2>예매 목록</h2>
 
    <!--검색라인-->
    <div id="search">
        <c:url value="/admin/bookList" var="listLink"></c:url>
		<form action="${listLink }" role="search">
	        <!-- 검색 범위 설정 -->
			<select name="t" class="searchSelect">
				<option value="all">전체</option>
				<option value="member_userId" ${param.t == 'member_userId' ? 'selected' : '' }>아이디</option>
				<option value="name" ${param.t == 'name' ? 'selected' : '' }>예매명</option>
				<option value="bookDate" ${param.t == 'bookDate' ? 'selected' : '' }>관람일</option>
			</select>
	        <input name="q" value="${param.q }" type="search" placeholder="검색어를 입력하세요">
	        <input type="submit" value="검색">
        </form>
    </div>
    
    <!--예약목록-->
    <div id="adminBookTable">
        <table>
        	<thead>
	        	<tr>
	        		<td>#</td>
	        		<td>아이디</td>
	        		<td>예매명</td>
	        		<td>관람일</td>
	        		<td>시간</td>
	        		<td>인원</td>
	        		<td></td>
	        	</tr>
        	</thead>
        	<tbody>
        	<c:forEach items="${bookList }" var="book">
        		<tr>
        			<td>${book.number }</td>
        			<td>${book.member_userId }</td>
        			<td>${book.name }</td>
        			<td>${book.bookDate }</td>
        			<td>${book.bookTime }</td>
        			<td>${book.personnel }</td>
        			<td>
        				<c:url value="/book/remove" var="removeLink">
        					<c:param name="number" value="${book.number }"></c:param>
        					<c:param name="userId" value="${userId }"></c:param>
        					<c:param name="removeId" value="${book.member_userId }"></c:param>
        				</c:url>
        				<a href=" ${removeLink }">예매취소</a>
        			</td>
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
			  <c:url value="/admin/bookList" var="listLink">
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
			  <c:url value="/admin/bookList" var="listLink">
			  		<c:param name="page" value="${ pageInfo.jumpPrevPageNumber}"></c:param>
			  		<c:param name="q" value="${param.q }"></c:param>
			  		<c:param name="t" value="${param.t }"></c:param>
			  </c:url>
			  <li class="page-item"><a class="page-link" href="${listLink }">
			  	<i class="fa-solid fa-angle-left"></i>
			  </a></li>
		  </c:if>
	  
		  <c:forEach begin="${pageInfo.leftPageNumber }" end="${pageInfo.rightPageNumber }" var="pageNumber">
		  	<c:url value="/admin/bookList" var="listLink">
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
			  <c:url value="/admin/bookList" var="listLink">
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
			  <c:url value="/admin/bookList" var="listLink">
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
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">
const ctx = "${pageContext.request.contextPath}";

/* message 경고창 */
const message = "${message}";
if (message != '') {
	alert(message);
};

</script>
</body>
</html>