<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.net.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>

<link rel="stylesheet" href="../../css/calendar.css">

<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<!-- CSS only -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
</head>
<body>
	<jsp:include page="/WEB-INF/tags/nav.jsp"/>
	
	<div id="calendar">
	<h2>천문대 예약</h2>
		<table class="Calendar">
	        <thead>
	            <tr>
	                <td onClick="prevCalendar();" style="cursor:pointer;">&#60;</td>
	                <td colspan="5">
	                    <span id="calYear"></span>년
	                    <span id="calMonth"></span>월
	                </td>
	                <td onClick="nextCalendar();" style="cursor:pointer;">&#62;</td>
	            </tr>
	            <tr>
	                <td>일</td>
	                <td>월</td>
	                <td>화</td>
	                <td>수</td>
	                <td>목</td>
	                <td>금</td>
	                <td>토</td>
	            </tr>
	        </thead>
	        <tbody>
	        </tbody>
	    </table>
   </div>
   
   	<!-- 비회원 예매시 로그인유도 팝업 -->
	<div class="modal fade" id="nonMemberModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
	  <div class="modal-dialog">
	    <div class="modal-content">
	      <div class="modal-header">
	        <h1 class="modal-title fs-5" id="exampleModalLabel"></h1>
	        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
	      </div>
	      <div class="modal-body">
	        회원만 예약이 가능합니다. 로그인해주세요.
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">닫기</button>
	        <c:url value="/member/login" var="loginLink"></c:url>
	        <a href="${loginLink }">
	       		<button type="button" class="btn btn-primary">로그인</button>
	        </a>
	      </div>
	    </div>
	  </div>
	</div>
   
 	<jsp:include page="/WEB-INF/tags/footer.jsp"/>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
<script type="text/javascript">
	const ctx = "${pageContext.request.contextPath}";

        window.onload = function () { buildCalendar(); }    // 웹 페이지가 로드되면 buildCalendar 실행

        let nowMonth = new Date();  // 현재 달을 페이지를 로드한 날의 달로 초기화
        let today = new Date();     // 페이지를 로드한 날짜를 저장
        today.setHours(0,0,0,0);    // 비교 편의를 위해 today의 시간을 초기화
        
        // 달력 생성 : 해당 달에 맞춰 테이블을 만들고, 날짜를 채워 넣는다.
        function buildCalendar() {

            let firstDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth(), 1);     // 이번달 1일
            let lastDate = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, 0);  // 이번달 마지막날

            let tbody_Calendar = document.querySelector(".Calendar > tbody");
            document.getElementById("calYear").innerText = nowMonth.getFullYear();             // 연도 숫자 갱신
            document.getElementById("calMonth").innerText = leftPad(nowMonth.getMonth() + 1);  // 월 숫자 갱신
            
            while (tbody_Calendar.rows.length > 0) {                        // 이전 출력결과가 남아있는 경우 초기화
                tbody_Calendar.deleteRow(tbody_Calendar.rows.length - 1);
            }

            let nowRow = tbody_Calendar.insertRow();        // 첫번째 행 추가           

            for (let j = 0; j < firstDate.getDay(); j++) {  // 이번달 1일의 요일만큼
                let nowColumn = nowRow.insertCell();        // 열 추가
            }

            for (let nowDay = firstDate; nowDay <= lastDate; nowDay.setDate(nowDay.getDate() + 1)) {   // day는 날짜를 저장하는 변수, 이번달 마지막날까지 증가시키며 반복  

                let nowColumn = nowRow.insertCell();        // 새 열을 추가하고 td
                
                nowColumn.innerHTML = "<form action='/book/book' method='get'><p>" + leftPad(nowDay.getDate()) + "</p>"
                					+ "<input type='hidden' name='bookDate' value='"
                					+ nowMonth.getFullYear() + "-" + (nowMonth.getMonth() + 1) + "-" + leftPad(nowDay.getDate()) + "'>"
                					+ "<sec:authorize access='isAuthenticated()'>"
                					+ "<button class='bookSubmitBtn' type='submit'>예매하기</button>"
                					+ "</sec:authorize></form>"
                					+ "<sec:authorize access='not isAuthenticated()'>"
                					+ "<button class='bookSubmitBtn' data-bs-toggle='modal' data-bs-target='#nonMemberModal' id='nonMemberInsertButton'>예매하기</button>"
                					+ "</sec:authorize>"
                						
                
                if (nowDay.getDay() == 0) {                 // 일요일인 경우 글자색 빨강으로
                    nowColumn.style.color = "#DC143C";
                }
                if (nowDay.getDay() == 6) {                 // 토요일인 경우 글자색 파랑으로 하고
                    nowColumn.style.color = "#0000CD";
                    nowRow = tbody_Calendar.insertRow();    // 새로운 행 추가
                }

             	// 지난날인 경우
                if (nowDay < today) {                       
                    nowColumn.className = "pastDay";
                }
             	// 오늘인 경우 
                else if (nowDay.getFullYear() == today.getFullYear() && nowDay.getMonth() == today.getMonth() && nowDay.getDate() == today.getDate()) {           
                    nowColumn.className = "today";
                    nowColumn.onclick = function () { choiceDate(this); }
                }
            	 // 미래인 경우
                else {                                      
                    nowColumn.className = "futureDay";
                    nowColumn.onclick = function () { choiceDate(this); }
                }
            }
            
            over();
        }
        
        // 지난 날짜 선택불가
        function over() {
        	const pasts = document.querySelectorAll(".pastDay");
        	
        	pasts.forEach(items);
        	
	        	function items(item){
	        		const b = item.firstChild
	        		const c = b.lastChild
	        		c.disabled = true;
	        	}
        	}
        
        // 날짜 선택
        function choiceDate(nowColumn) {
            if (document.getElementsByClassName("choiceDay")[0]) {                              // 기존에 선택한 날짜가 있으면
                document.getElementsByClassName("choiceDay")[0].classList.remove("choiceDay");  // 해당 날짜의 "choiceDay" class 제거
            }
            nowColumn.classList.add("choiceDay");           // 선택된 날짜에 "choiceDay" class 추가
        }
        
        // 이전달 버튼 클릭
        function prevCalendar() {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() - 1, nowMonth.getDate());   // 현재 달을 1 감소
            buildCalendar();    // 달력 다시 생성
        }
        // 다음달 버튼 클릭
        function nextCalendar() {
            nowMonth = new Date(nowMonth.getFullYear(), nowMonth.getMonth() + 1, nowMonth.getDate());   // 현재 달을 1 증가
            buildCalendar();    // 달력 다시 생성
        }

        // input값이 한자리 숫자인 경우 앞에 '0' 붙혀주는 함수
        function leftPad(value) {
            if (value < 10) {
                value = "0" + value;
                return value;
            }
            return value;
        }
        
        
    </script>

</body>
</html>