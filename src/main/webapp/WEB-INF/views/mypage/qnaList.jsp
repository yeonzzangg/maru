<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
		
	<sec:authentication property="name" var="userIdValue"/>

<div id="adminBookList">
	<h2>내 문의내역</h2>

    <div id="qnaTable">
        <table>
        	<thead>
	        	<tr>
	        		<td>답변상태</td>
	        		<td>질문</td>
	        		<td>작성자</td>
	        		<td>작성일</td>
	        	</tr>
        	</thead>
        	<tbody>
        	<c:forEach items="${qnaList }" var="qna">
	       		<c:url value="/qna/get" var="getLink">
	        		<c:param name="number" value="${qna.number }"></c:param>
	       		</c:url>
        		<tr>
        			<td>
	       				<p class=" ${qna.status eq '답변완료' ? 'qna_status' : '' }">${qna.status }</p>
	       			</td>
        			<td><a href="${getLink}">${qna.title }</a></td>
        			<td>${qna.member_userId }</td>
        			<td>${qna.insertDate }</td>
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
			  <c:url value="/mypage/qnaList" var="listLink">
			  		<c:param name="userId" value="${userIdValue }"></c:param>
			  		<c:param name="page" value="1"></c:param>
			  </c:url>
			  <li class="page-item"><a class="page-link" href="${listLink }">
			  	<i class="fa-solid fa-angles-left"></i>
			  </a></li>
		  </c:if>
		  
		  <!-- 이전 페이지 버튼 -->
		  <c:if test="${pageInfo.hasPrevButton}">
			  <c:url value="/mypage/qnaList" var="listLink">
			  		<c:param name="userId" value="${userIdValue }"></c:param>
			  		<c:param name="page" value="${ pageInfo.jumpPrevPageNumber}"></c:param>
			  </c:url>
			  <li class="page-item"><a class="page-link" href="${listLink }">
			  	<i class="fa-solid fa-angle-left"></i>
			  </a></li>
		  </c:if>
	  
		  <c:forEach begin="${pageInfo.leftPageNumber }" end="${pageInfo.rightPageNumber }" var="pageNumber">
		  	<c:url value="/mypage/qnaList" var="listLink">
		  		<c:param name="userId" value="${userIdValue }"></c:param>
		  		<c:param name="page" value="${pageNumber }"></c:param>
		  	</c:url>
		  	
		  	<!-- 현재 페이지 active 클래스 추가 -->
		    <li class="page-item
		  		  ${ pageInfo.currentPageNumber == pageNumber ? 'active' : ''}
		    "><a class="page-link" href="${listLink }">${pageNumber }</a></li>
		  </c:forEach>
		  
		  <!-- 다음 페이지 버튼 -->
		  <c:if test="${pageInfo.hasNextButton}">
			  <c:url value="/mypage/qnaList" var="listLink">
			  		<c:param name="userId" value="${userIdValue }"></c:param>
			  		<c:param name="page" value="${ pageInfo.jumpNextPageNumber}"></c:param>
			  </c:url>
			  <li class="page-item"><a class="page-link" href="${listLink }">
			  	<i class="fa-solid fa-angle-right"></i>
			  </a></li>
		  </c:if>
		  
		  <!-- 마지막 페이지로 가는 버튼 : 마지막페이지일때 빼고 다 존재함 -->
		  <c:if test="${pageInfo.currentPageNumber != pageInfo.lastPageNumber }">				  	
			  <c:url value="/mypage/qnaList" var="listLink">
			  		<c:param name="userId" value="${userIdValue }"></c:param>
			  		<c:param name="page" value="${pageInfo.lastPageNumber }"></c:param>
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

</script>
</body>
</html>