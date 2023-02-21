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
	
	<!--메인-->
    <main>
        <p class="txt1">CUSTOMER<span></span></p>
        <h2>별마로 천문대<br>고객센터<b>입니다.</b></h2>
        <p class="txt2">정확한 공지와 신속한 답변을 위해 노력하겠습니다</p>
    </main>

    <!--중간메뉴-->
    <div id="under_nav">
        <ul>
            <li><a href="#a">공지사항</a></li>
            <li><a href="#a">자주 묻는 질문</a></li>
            <li><a href="#a">1 : 1 문의</a></li>
            <li><a href="#a">별마로 후기</a></li>
        </ul>
		<h2>문의 내역</h2>
    </div>

    
    <!--검색라인-->
    <div id="search">
        <c:url value="/qna/list" var="listLink"></c:url>
		<form action="${listLink }" role="search">
	        <!-- 검색 범위 설정 -->
			<select name="t" class="searchSelect">
				<option value="all">전체</option>
				<option value="title" ${param.t == 'title' ? 'selected' : '' }>제목</option>
				<option value="content" ${param.t == 'content' ? 'selected' : '' }>본문</option>
				<option value="writer" ${param.t == 'writer' ? 'selected' : '' }>작성자</option>
			</select>
	        <input name="q" value="${param.q }" type="search" placeholder="검색어를 입력하세요">
	        <input type="submit" value="검색">
        </form>
    </div>
    
    <!--공지-->
    <div id="notice">
        <table>
        	<c:forEach items="${qnaList }" var="qna">
        	
       		<c:url value="/qna/get" var="qnaLink">
        		<c:param name="number" value="${qna.number }"></c:param>
       		</c:url>
        		<tr>
        			<td>${qna.number }</td>
        			<td><a href="${qnaLink}">${qna.title }</a></td>
        			<td>${qna.member_userId }</td>
        			<td>${qna.status }</td>
        			<td>${qna.insertDate }</td>
        		</tr>
        	</c:forEach>
        </table>
     </div>
        

    <!-- 페이지네이션 -->
	<div id="pagination">
        <ul class="pagination">
		  <!-- 첫페이지로 가는 버튼 : 1페이지일때 빼고 다 존재함 -->
		  <c:if test="${pageInfo.currentPageNumber != 1 }">
			  <c:url value="/review/list" var="listLink">
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
			  <c:url value="/qna/list" var="listLink">
			  		<c:param name="page" value="${ pageInfo.jumpPrevPageNumber}"></c:param>
			  		<c:param name="q" value="${param.q }"></c:param>
			  		<c:param name="t" value="${param.t }"></c:param>
			  </c:url>
			  <li class="page-item"><a class="page-link" href="${listLink }">
			  	<i class="fa-solid fa-angle-left"></i>
			  </a></li>
		  </c:if>
	  
		  <c:forEach begin="${pageInfo.leftPageNumber }" end="${pageInfo.rightPageNumber }" var="pageNumber">
		  	<c:url value="/qna/list" var="listLink">
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
			  <c:url value="/qna/list" var="listLink">
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
			  <c:url value="/qna/list" var="listLink">
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
    
	
 	<jsp:include page="/WEB-INF/tags/footer.jsp"/>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">
const ctx = "${pageContext.request.contextPath}";


</script>
</body>
</html>