<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/footer.css">
</head>
<body>

    <!--카피라이트-->
    <div id="wrap_footer">
        <div id="myfooter">
            <p class="logo"><a href="main.html"><img src="${pageContext.request.contextPath}/images/logo2.png"></a></p>

            <ul class="left">
                <li><a href="#a">개인정보처리방침</a><span></span><a href="#a">저작권보호정책</a><span></span><a href="#a">이메일무단수집거부</a><span></span><a href="#a">CCTV설치 및 운영지침</a></li>
                <li>강원도 영월군 영월읍 천문대길 397<br>전화 : 033-372-8445 | 팩스 : 033-374-7463 | 전화문의는 운영시간에만 가능합니다.<br>상호 : 영월군시성관리공단 | 사업자등록번호 : 225-82-18099<br>Copyright 2022YeongWolgun FacilitiesManagement Corporation. All right reserved.</li>
            </ul>

            <ul class="right">
                <li>
                    <select onchange="window.open(value);">
                        <option value="https://www.ywfmc.or.kr/#lnk">관련사이트</option>
                        <option value="https://www.ywfmc.or.kr/#lnk">영월군시설관리공단</option>
                        <option value="https://www.yw.go.kr/corona_inte/intro.html">영월군청</option>
                        <option value="https://www.weather.go.kr/w/index.do">기상청</option>
                        <option value="http://www.ywmuseum.com/">영월박물관</option>
                    </select>
                </li>
                <li>
                    <p><a href="#a"><img src="${pageContext.request.contextPath}/images/copy_logo1.png"></a></p>
                    <p><a href="#a"><img src="${pageContext.request.contextPath}/images/copy_logo2.png"></a></p>
                    <p><a href="#a"><img src="${pageContext.request.contextPath}/images/copy_logo3.png"></a></p>
                    <p><a href="#a"><img src="${pageContext.request.contextPath}/images/copy_logo4.png"></a></p>
                </li>
            </ul>
        </div>
    </div>


</body>
</html>