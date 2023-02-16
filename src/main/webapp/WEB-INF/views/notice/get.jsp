<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../../css/get.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/WEB-INF/tags/nav.jsp"/>
	<input type="hidden" value="${notice.member_userId }"  />
	<input type="hidden" id="noticenotice_fb_number" value="${notice.number }" readonly/>
	
	
	<div id="NoticeGet">

	<!-- 게시글로 돌아가기 버튼 -->
	<div class="topbtnBox">
		<c:url value="/notice/list" var="listLink"></c:url>
		<a href="${listLink }">
			<button type="button" class="listBtn">게시글 목록</button>
		</a>
		
		<!-- 작성자와 authentication.name이 같아야 버튼 보여주기 -->
		<sec:authentication property="name" var="userIdValue" />
		<c:if test="${notice.member_userId == userIdValue}" >
		<!-- 삭제버튼 -->
			<c:url value="/notice/remove" var="removeLink"></c:url>
			<form id="removeForm" action="${removeLink }" method="post">
				<input type="hidden" name="number" value="${notice.number }"/>
			</form>
			<input class="removeBtn" type="submit" value="삭제" data-bs-toggle="modal" data-bs-target="#removeModal"/>
			<!-- 수정버튼 -->
			<c:url value="/notice/modify" var="modifyLink">
				<c:param name="number" value="${notice.number }"></c:param>
			</c:url>
			<a  href="${modifyLink }">
				<button type="button" class="modifyBtn">수정</button>
			</a>
		</c:if>
	</div>
	
	<!-- 본문 -->
	<div id="post_wrap">
		<div class="post_top">
			<p class="txt">제목</p><span class="colLine"></span>
			<p class="top_title">${notice.title }</p><br>
			<div class="rowLine"></div><br>
			<p class="txt">카테고리</p><span class="colLine"></span><p>${notice.category }</p>
			<p class="txt space1">작성자</p><span class="colLine"></span><p>${notice.member_userId }</p>
			<p class="txt space2">일자</p><span class="colLine"></span><p>${notice.insertDate }</p>
			<div class="rowLine"></div><br>
		</div>
		<div id="summernote" class="top_content">${notice.content }</div>
	</div>
	
	</div>
	
	<!-- 게시글 삭제 모달 -->
	<div class="modal fade" id="removeModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">삭제 확인</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button id="removeConfirmButton" type="button" class="btn btn-primary">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
	
 	<jsp:include page="/WEB-INF/tags/footer.jsp"/>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">

const ctx = "${pageContext.request.contextPath}";

//삭제확인 버튼 클릭하면 삭제 form 전송
document.querySelector("#removeConfirmButton").addEventListener("click", function() {
	document.querySelector("#removeForm").submit();
});

</script>
</body>
</html>