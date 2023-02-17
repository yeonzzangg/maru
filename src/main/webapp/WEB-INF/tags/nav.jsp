<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/nav.css">
</head>
<body>
	
<sec:authorize access="isAuthenticated()" var="loggedIn" />
<sec:authorize access="hasAuthority('admin')" var="admin" />
<sec:authentication property="name" var="userId"/>

<c:url value="/member/login" var="loginLink" />
<c:url value="/member/logout" var="logoutLink" />
<c:url value="/member/signup" var="signupLink" />
<c:url value="/admin/memberList" var="memberListLink" />
<c:url value="/main/list" var="mainLink" />
<c:url value="/notice/list" var="noticeLink" />
<c:url value="/review/list" var="reviewLink" />
<c:url value="/program/list" var="programLink" />

<c:url value="/member/info" var="memberInfoLink" >
	<c:param name="userId" value="${userId }" />
</c:url>

	
	<!--공통-->
    <!--로그인/회원가입/검색-->
    <div id="myheader">
    	<c:if test="${ not loggedIn }">
        	<p><a href="${ loginLink }">로그인</a></p>
        	<p class="line"></p>
        	<p><a href="${ signupLink }">회원가입</a></p>
    	</c:if>
    	<c:if test="${ loggedIn }">
    		<c:if test="${not admin }">
	    		<p>${userId }님 </p>
		        <p class="line"></p>
		        <p><a href="${memberInfoLink }">마이페이지</a></p>
		        <p class="line"></p>
	        	<p><a href="${ logoutLink }">로그아웃</a></p>
        	</c:if>
	    	<c:if test="${ admin }">
	    		<p>${userId }님 </p>
		        <p class="line"></p>
		        <p><a href="${ memberListLink }">회원목록</a></p>
		        <p class="line"></p>
	        	<p><a href="${ logoutLink }">로그아웃</a></p>
	    	</c:if>
    	</c:if>
    </div>


    <!--메뉴-->
    <div id="wrap_nav">
        <nav>
            <ul> 
                <h2><a href="${mainLink }"><img src="${pageContext.request.contextPath}/images/logo.jpg"></a></h2>
                <li><a href="#a">별마로 소개</a>
                    <ul class="sub">
                        <li><a href="#a">별마로 소개</a></li>
                        <li><a href="#a">오시는길</a></li>
                    </ul>
                </li>
                <li><a href="#a">천문대 이용안내</a>
                    <ul class="sub">
                        <li><a href="#a">이용시간/요금안내</a></li>
                        <li><a href="#a">시설소개</a></li>
                        <li><a href="#a">주변관광지</a></li>
                    </ul>
                </li>
                <li><a href="${programLink }">프로그램</a>
                    <ul class="sub">
                        <li><a href="#a">일정</a></li>
                        <li><a href="#a">예매하기</a></li>
                        <li><a href="#a">확인/취소</a></li>
                    </ul>
                </li>
                <li><a href="#a">혜택 안내</a>
                    <ul class="sub">
                        <li><a href="#a">이벤트</a></li>
                        <li><a href="#a">제휴할인</a></li>
                    </ul>
                </li>
                <li><a href="${noticeLink }">고객의 소리</a>
                    <ul class="sub">
                        <li><a href="${noticeLink }">공지사항</a></li>
                        <li><a href="#a">자주하는 질문</a></li>
                        <li><a href="#a">1:1 문의</a></li>
                        <li><a href="${reviewLink }">후기</a></li>
                    </ul>
                </li>
            </ul>
        </nav>
    </div>


</body>
</html>