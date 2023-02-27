<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
 <style>
 .modifyDivNone {
 display: none;
 }
 </style>

<link rel="stylesheet" href="../../css/get.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/WEB-INF/tags/nav.jsp"/>
	
	<sec:authorize access="hasAuthority('admin')" var="admin" />
	
	<input type="hidden" value="${qna.member_userId }" />
	<input type="hidden" id="number" value="${qna.number }" />
	
	<div id="NoticeGet">
		<!-- qna 돌아가기 버튼 --><!-- 수정하기!!!! -->
		<div class="topbtnBox">
			<c:url value="/mypage/qnaList" var="listLink"></c:url>
			<a href="${listLink }">
				<button type="button" class="listBtn">내 문의 목록</button>
			</a>
			
			<!-- 작성자와 authentication.name이 같아야 버튼 보여주기 -->
			<sec:authentication property="name" var="userIdValue" />
			<c:if test="${qna.member_userId == userIdValue}" >
			<!--  qna 삭제버튼 -->
				<c:url value="/qna/remove" var="removeLink"></c:url>
				<form id="removeForm" action="${removeLink }" method="post">
					<input type="hidden" name="number" value="${qna.number }"/>
				</form>
				<input class="removeBtn" type="submit" value="삭제" data-bs-toggle="modal" data-bs-target="#removeModal"/>
				<!-- 수정버튼 -->
				<c:url value="/qna/modify" var="modifyLink">
					<c:param name="number" value="${qna.number }"></c:param>
				</c:url>
				<a  href="${modifyLink }">
					<button type="button" class="modifyBtn">수정</button>
				</a>
			</c:if>
		</div>
		
		<!-- qna 본문 -->
		<div id="post_wrap">
			<div class="post_top">
				<p class="txt">제목</p><span class="colLine"></span>
				<p class="top_title">${qna.title }</p><br>
				<div class="rowLine"></div><br>
				<p class="txt">답변상태</p><span class="colLine"></span><p>${qna.status }</p>
				<p class="txt space1">작성자</p><span class="colLine"></span><p>${qna.member_userId }</p>
				<p class="txt space2">일자</p><span class="colLine"></span><p>${qna.insertDate }</p>
				<div class="rowLine"></div><br>
			</div>
			<div id="summernote" class="top_content">
				<pre>${qna.content }</pre>
			</div>
		</div>
	</div>
	
	<!-- 답변입력 -->
	<c:if test="${ admin }">
		<div class="replyBox container">
			<input class="replyContentInput" type="text" id="qna_content"
				placeholder="답변을 입력해주세요."/><br>
					
			<button id="answerBtn" class="replyBnt btn btn-success" >답변 등록</button>
		</div>
	</c:if>
	
	<!-- 답변 -->
		<div class="row">
			<div class="col">
				<div id="answerListContainer">
					<!-- 답변 나오는 부분 -->
				</div>
			</div>
		</div>
		
	
	<!-- qna 게시글 삭제 모달 -->
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
	
	<!-- 답변 삭제 확인 모달 -->
	<div class="modal fade" id="answerDeleteModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        답변을 삭제하시겠습니까?
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <button type="button" id="answerDeleteConfirmButton" class="btn btn-primary" data-bs-dismiss="modal">삭제</button>
	      </div>
	    </div>
	  </div>
	</div>
	
 	<jsp:include page="/WEB-INF/tags/footer.jsp"/>
 	
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">

const ctx = "${pageContext.request.contextPath}";



listAnswer();

// 수정창 보여주기
function modifyClass(number){
	document.getElementById('modifyAnswerBox' + number).classList.remove('modifyDivNone');
	document.getElementById('originContent' + number).classList.add('modifyDivNone');
};

// 수정 input에 답변 내용 가져오기
function readAnswerAndSetInput(number) {
	fetch(`\${ctx}/answer/get/\${number}`)
	.then(res => res.json())
	.then(answer => {
		document.querySelector("#modifyAnswerInput" + number).value = answer.content;
		answerModifyConfirmButton(number);
	})
};

//답변 수정 확인버튼
function answerModifyConfirmButton(number) {
	
	document.querySelector("#answerModifyConfirmButton" + number).addEventListener("click", function() {
		
		const number = this.dataset.answerId;
		const content = document.querySelector("#modifyAnswerInput" + number).value;
		const data = {number, content}
		
		fetch(`\${ctx}/answer/modify`, {
			method : "put",
			headers : {
				"Content-Type" : "application/json"
			},
			body : JSON.stringify(data)
		})
		.then(res => res.json())
		.then(() => listAnswer());
	});
}


// 답변 삭제
function removeAnswer(number) {
	fetch(ctx + "/answer/delete/" + number, {
		method : "delete"
	})
	.then(res => res.json())
	.then(() => listAnswer());
}

//답변 삭제 확인버튼
document.querySelector("#answerDeleteConfirmButton").addEventListener("click", function() {
	removeAnswer(this.dataset.answerId);
});


// 답변 리스트
function listAnswer() {
	const qna_number = document.querySelector("#number").value; 
	const content = document.querySelector("#qna_content").value;
	
	fetch(`\${ctx}/answer/list/\${qna_number}`)
	.then(res => res.json())
	.then(list => {
		// 답변 목록 다 지우고
		const answerListContainer = document.querySelector("#answerListContainer");
		answerListContainer.innerHTML = "";
		
		// 다시 답변목록 가져오기
		// item = answerDto
		for (const item of list) {
			
			const modifyAnswerButtonId = `modifyAnswerButton\${item.number}`;
			const removeAnswerButtonId = `removeAnswerButton\${item.number}`;
			const modifyAnswerBoxId = `modifyAnswerBox\${item.number}`;
			const answerModifyConfirmButton = `answerModifyConfirmButton\${item.number}`;
			const modifyAnswerInput = `modifyAnswerInput\${item.number}`;
			const originContent = `originContent\${item.number}`;
			
			/* 수정 삭제버튼 */
			const editButton = 
				`<button class="btn" data-answer-id="\${item.number}" id="\${modifyAnswerButtonId}"> 수정</button>
				<button class="btn" data-bs-toggle="modal" data-bs-target="#answerDeleteModal" data-answer-id="\${item.number}" id="\${removeAnswerButtonId}"> 삭제</button>`
								
			const answerDiv = 
				`<div class="reply_list">
					<span class="row"></span>
					<div class="replylist_top">
						<p> \${item.member_userId}</p>
						<p> \${item.insertDate}</p>
						\${item.editable ? editButton : ''}
					</div>
					<p id="\${originContent}"> \${item.content}</p>
					<p id="\${modifyAnswerBoxId}" class="modifyDivNone">
						<input type="text" id="\${modifyAnswerInput}" />
						<button type="button" id="\${answerModifyConfirmButton}" class="btn">수정확인</button>
					</p>
				</div>`; 
				
			answerListContainer.insertAdjacentHTML("beforeend", answerDiv);
			
			if(item.editable){
				// 수정 input에 답변 내용 넣기
				document.querySelector("#" + modifyAnswerButtonId).addEventListener("click", function() {
					// 수정 input 보여주기
					modifyClass(this.dataset.answerId);
					
					// 내용옮기기
					document.querySelector("#" + answerModifyConfirmButton).setAttribute("data-answer-id", this.dataset.answerId)
					readAnswerAndSetInput(this.dataset.answerId);
				});
				
				// 모달 삭제확인 버튼에 number 옮기기
				document.querySelector("#" + removeAnswerButtonId).addEventListener("click", function() {
					document.querySelector("#answerDeleteConfirmButton").setAttribute("data-answer-id", this.dataset.answerId)
				});
			}
		}
	});
}


// 답변입력
document.querySelector("#answerBtn").addEventListener("click", function() {
	const qna_number = document.querySelector("#number").value; 
	const content = document.querySelector("#qna_content").value;
	const data = { qna_number, content }
	
	fetch(`\${ctx}/answer/add`, {
		method : "post",
		headers : {
			"Content-Type" : "application/json"
		},
		body : JSON.stringify(data)
	})
	.then(res => res.json())
	.then(data => {
		document.querySelector("#qna_content").value = "";
	})
	.then(() => location.reload() );
	
});

//삭제확인 버튼 클릭하면 삭제 form 전송
document.querySelector("#removeConfirmButton").addEventListener("click", function() {
	document.querySelector("#removeForm").submit();
});

</script>
</body>
</html>