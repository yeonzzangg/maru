<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지</title>
<link rel="stylesheet" href="../../css/notice.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
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
        </ul>
    </div>

    <!-- 카테고리 -->
    <div id="notice_nav">
		<c:url value="/notice/list" var="listLink"></c:url>
		
		<form action="${listLink }">
        <ul>
            <li class="first">
                <button class="txt" name="category" value="" >전체</a><br><span></span></button>
                <p class="line"></p>
            </li>
            <li>
                <button type="txt" class="txt" name="category" value="일반공지">일반공지<br><span></span></button>
                <p class="line"></p>
            </li>
            <li>
                <button type="txt" class="txt" name="category" value="날씨안내">날씨안내<br><span></span></button>
                <p class="line"></p>
            </li>
            <li>
                <button type="txt" class="txt" name="category" value="도로안내">도로안내<br><span></span></button>
                <p class="line"></p>
            </li>
            <li>
                <button type="txt" class="txt" name="category" value="강의교육">강의/교육<br><span></span></button>
                <p class="line"></p>
            </li>
            <li>
                <button type="txt" class="txt" name="category" value="보도자료">보도자료<br><span></span></button>
            </li>
        </ul>
        </form>
        <p class="bottom_line"></p>
    </div>
    
    
    
    <!--검색라인-->
    <div id="search">
        <p class="first">전체</p>
        <p>103건</p>
        <c:url value="/notice/list" var="listLink"></c:url>
		<form action="${listLink }" role="search">
	        <!-- 검색 범위 설정 -->
			<select name="t" class="searchSelect">
				<option value="all">전체</option>
				<option value="title" ${param.t == 'title' ? 'selected' : '' }>제목</option>
				<option value="content" ${param.t == 'content' ? 'selected' : '' }>본문</option>
			</select>
	        <input name="q" value="${param.q }" type="search" placeholder="검색어를 입력하세요">
	        <input type="submit" value="검색">
        </form>
    </div>

    
    
    <!--공지-->
    <div id="notice">
        <h2>공지사항</h2>
        <table>
        	<c:forEach items="${noticeList }" var="notice">
        	
       		<c:url value="/notice/get" var="getLink">
        		<c:param name="number" value="${notice.number }"></c:param>
       		</c:url>
        		
        		<tr onclick="location.href='${getLink}'">
        			<td>${notice.number }</td>
        			<td>${notice.title }</td>
        			<td>${notice.insertDate }</td>
        		</tr>
        	</c:forEach>
            <tr class="top"><a href="#a">
                <td><p>공지</p></td>
                <td><a href="#a">2022년 7월 온라인 예매 및 휴관일 안내</a></td>
                <td>2022.06.22</td></a>
            </tr>
            </tr>
               <tr><a href="#a">
                <td class="num">103</td>
                <td><a href="#a">별마로 천문대 야외화장실 보수공사 안내</a></td>
                <td>2022.06.23</td></a>
            </tr>
        </table>
        
        <ul class="pagination">
		  <!-- 첫페이지로 가는 버튼 : 1페이지일때 빼고 다 존재함 -->
		  <c:if test="${pageInfo.currentPageNumber != 1 }">
			  <c:url value="/notice/list" var="listLink">
			  		<c:param name="page" value="1"></c:param>
			  		<c:param name="q" value="${param.q }"></c:param>
			  		<c:param name="t" value="${param.t }"></c:param>
			  		<c:param name="category" value="${param.category }"></c:param>
			  </c:url>
			  <li class="page-item"><a class="page-link" href="${listLink }">
			  	<i class="fa-solid fa-angles-left"></i>
			  </a></li>
		  </c:if>
		  
		  <!-- 이전 페이지 버튼 -->
		  <c:if test="${pageInfo.hasPrevButton}">
			  <c:url value="/notice/list" var="listLink">
			  		<c:param name="page" value="${ pageInfo.jumpPrevPageNumber}"></c:param>
			  		<c:param name="q" value="${param.q }"></c:param>
			  		<c:param name="t" value="${param.t }"></c:param>
			  		<c:param name="category" value="${param.category }"></c:param>
			  </c:url>
			  <li class="page-item"><a class="page-link" href="${listLink }">
			  	<i class="fa-solid fa-angle-left"></i>
			  </a></li>
		  </c:if>
	  
		  <c:forEach begin="${pageInfo.leftPageNumber }" end="${pageInfo.rightPageNumber }" var="pageNumber">
		  	<c:url value="/notice/list" var="listLink">
		  		<c:param name="page" value="${pageNumber }"></c:param>
		  		<c:param name="q" value="${param.q }"></c:param>
		  		<c:param name="t" value="${param.t }"></c:param>
		  		<c:param name="category" value="${param.category }"></c:param>
		  	</c:url>
		  	
		  	<!-- 현재 페이지 active 클래스 추가 -->
		    <li class="page-item
		  		  ${ pageInfo.currentPageNumber == pageNumber ? 'active' : ''}
		    "><a class="page-link" href="${listLink }">${pageNumber }</a></li>
		  </c:forEach>
		  
		  <!-- 다음 페이지 버튼 -->
		  <c:if test="${pageInfo.hasNextButton}">
			  <c:url value="/notice/list" var="listLink">
			  		<c:param name="page" value="${ pageInfo.jumpNextPageNumber}"></c:param>
			  		<c:param name="q" value="${param.q }"></c:param>
			  		<c:param name="t" value="${param.t }"></c:param>
			  		<c:param name="category" value="${param.category }"></c:param>
			  </c:url>
			  <li class="page-item"><a class="page-link" href="${listLink }">
			  	<i class="fa-solid fa-angle-right"></i>
			  </a></li>
		  </c:if>
		  
		  <!-- 마지막 페이지로 가는 버튼 : 마지막페이지일때 빼고 다 존재함 -->
		  <c:if test="${pageInfo.currentPageNumber != pageInfo.lastPageNumber }">				  	
			  <c:url value="/notice/list" var="listLink">
			  		<c:param name="page" value="${pageInfo.lastPageNumber }"></c:param>
			  		<c:param name="q" value="${param.q }"></c:param>
			  		<c:param name="t" value="${param.t }"></c:param>
			  		<c:param name="category" value="${param.category }"></c:param>
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