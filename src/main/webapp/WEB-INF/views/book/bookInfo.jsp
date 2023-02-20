<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<link rel="stylesheet" href="../../css/bookInfo.css">
<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
<!-- 폰트어썸 -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css" integrity="sha512-xh6O/CkQoPOWDdYTDqeRdPCVd1SpvCA9XXcUnZS2FmJNp1coAFzvtCN9BmamE+4aHK8yyUHUSCcJHgXloTyT2A=="crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>
<body>
	<sec:authentication property="name" var="userIdValue"/>
	
	<jsp:include page="/WEB-INF/tags/nav.jsp"/>
	
	<div id="bookInfo">
		<h2>${userIdValue }님의 예매내역</h2>
		<form action="" method="post">
		    <table>
				<tr class="first">
					<td>관람일</td>
					<td>${book.bookDate }
					</td>
				</tr>
				<tr>
					<td>관람시간</td>
					<td>${book.bookTime }
					</td>
				</tr>
				<tr>
					<td>예매자명</td>
					<td>${book.name }
					</td>
				</tr>
				<tr>
					<td>관람인원</td>
					<td id="personnel">${book.personnel }</td>
				</tr>
				<tr>
					<td>결제금액</td>
					<td id="total"></td>
				</tr>
		    </table>
		    <input type="submit" value="결제하기" />					
		</form>
	</div>
	
 	<jsp:include page="/WEB-INF/tags/footer.jsp"/>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">
const ctx = "${pageContext.request.contextPath}";

window.onload = function () { total(); }

function total() {
	const personnel = document.querySelector("#personnel").innerText;
	const total = personnel * 5000;
	console.log(personnel);
	console.log(total);
	
	document.querySelector("#total").innerText = total + "원";
};
</script>
</body>
</html>