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
</head>
<body>
	<sec:authentication property="name" var="userIdValue"/>
	
	<jsp:include page="/WEB-INF/tags/nav.jsp"/>
	
    <div id="bookInfo">
        <h2>천문대 예약</h2>
        
		<form action="/book/bookInfo/" method="get">
		<input type="hidden" value="${ userIdValue}" name="member_userId"/>
			<table>
				<tr class="first">
					<td>관람일</td>
					<td>${book.bookDate }
					<input name="bookDate" type="hidden" value="${book.bookDate }"/>
					</td>
				</tr>
				<tr>
					<td>예매자명</td>
					<td><input name="name" type="text" /></td>
				</tr>
				<tr>
					<td>시간</td>
					<td>
						<select name="BookTime">
							<option value="14:30">14:30</option>
							<option value="15:30">15:30</option>
							<option value="19:00">19:00</option>
							<option value="20:00">20:00</option>
							<option value="21:00">21:00</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>인원</td>
					<td>
						<select name="personnel">
							<option value="1">1</option>
							<option value="2">2</option>
							<option value="3">3</option>
							<option value="4">4</option>
							<option value="5">5</option>
						</select>
					</td>
				</tr>
			</table>
			<input type="submit" value="예매하기" />
		</form>
		
    </div>
	
 	<jsp:include page="/WEB-INF/tags/footer.jsp"/>
    
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">
const ctx = "${pageContext.request.contextPath}";
</script>
</body>
</html>