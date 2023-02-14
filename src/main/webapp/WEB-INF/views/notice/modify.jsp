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
	<jsp:include page="/WEB-INF/tags/nav.jsp"/>
	
<input type="hidden" value="${notice.number }"  />
<input type="hidden" value="${notice.member_userId }"  />


<!-- 전체 컨테이너 -->
<div class="container-sm" >

	<form id="modifyForm" action="" method="post" >
		<input type="hidden" name="number" value="${notice.number}"/>
		<div class="categorySelectBox">
			<p>카테고리</p>
			<select class="categorySelect" name="category">
				<option name="일반공지">일반공지</option>
				<option name="날씨안내">날씨안내</option>
				<option name="도로안내">도로안내</option>
				<option name="강의교육">강의/교육</option>
				<option name="보도자료">보도자료</option>
			</select>
		</div>
		<div class="row">
			<input class="titleInput" type="text" name="title" value="${notice.title }"/>
		</div>
		<div class="row">
			<textarea class="contnet" name="content">${notice.content }</textarea>
		</div>
	</form>
			
	<div class="submitBox">
		<input class="noticeBtn" type="submit" value="게시글 수정하기" data-bs-toggle="modal" data-bs-target="#modifyModal">
	</div>
	
</div> <!-- 전체컨테이너 -->
	
	
	<!-- 수정 모달 -->
	<div class="modal fade" id="modifyModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel">수정 확인</h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        수정하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	        <button id="modifyConfirmButton" type="button" class="btn btn-primary">확인</button>
	      </div>
	    </div>
	  </div>
	</div>
	
 	<jsp:include page="/WEB-INF/tags/footer.jsp"/>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">

const ctx = "${pageContext.request.contextPath}";

// 수정확인 버튼 클릭하면 수정 form 전송
document.querySelector("#modifyConfirmButton").addEventListener("click", function() {
	document.querySelector("#modifyForm").submit();
});

</script>
</body>
</html>