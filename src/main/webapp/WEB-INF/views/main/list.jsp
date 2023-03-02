<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../../css/main.css">

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
        <h2>별을 보는 고요한 정상,<br>별마로 천문대</h2>
        <h5>별마로 천문대는 시민천문대 최상의 관측조건인 해발 799.8m에 자리하고 있으며<br>지름 800mm 주망원경과 여러대의 보조망원경이 설치되어 있어 달이나 행성, 별을 관측할수 있습니다. </h5>
        <p class="left"><a href="#a"><img src="../images/left.png"></a></p>
        <p class="right"><a href="#a"><img src="../images/right.png"></a></p>
    </main>


    <!--아이콘메뉴-->
    <div id="icon_nav">
        <ul>
            <li><a href="#a">
                    <p class="img"><img src="../images/nav_icon1.jpg"></p>
                    <p class="txt">오늘의 날씨</p>
                </a>
            </li>
            <li><a href="#a">
                    <p class="img"><img src="../images/nav_icon2.jpg"></p>
                    <p class="txt">도로 상황</p>
                </a>
            </li>
            <li><a href="#a">
                    <p class="img"><img src="../images/nav_icon3.jpg"></p>
                    <p class="txt">요금 안내</p>
                </a>
            </li>
            <li><a href="#a">
                    <p class="img"><img src="../images/nav_icon4.jpg"></p>
                    <p class="txt">프로그램 일정</p>
                </a>
            </li>
            <li><a href="#a">
                    <p class="img"><img src="../images/nav_icon5.jpg"></p>
                    <p class="txt">문의 사항</p>
                </a>
            </li>
            <li><a href="#a">
                    <p class="img"><img src="../images/nav_icon6.jpg"></p>
                    <p class="txt">제휴 할인</p>
                </a>
            </li>
        </ul>
    </div>


    <!--공지사항-->
    <div id="notice">
        <p><a href="#a">더 볼게요<i class="fa-solid fa-angle-right"></i></a></p>

        <ul class="left">
            <li><a href="#a"><i class="fa-solid fa-arrow-right-long"></i>공지사항</a></li>
            <li><a href="#a"><i class="fa-solid fa-arrow-right-long"></i>날씨안내</a></li>
            <li><a href="#a"><i class="fa-solid fa-arrow-right-long"></i>도로안내</a></li>
            <li><a href="#a"><i class="fa-solid fa-arrow-right-long"></i>강좌/교육</a></li>
            <li><a href="#a"><i class="fa-solid fa-arrow-right-long"></i>보도자료</a></li>
        </ul>

        <ul class="info"><a href="#a">
                <li>공지</li>
                <li>2022년 7월<br>온라인 예매 및 휴관일 안내</li>
                <li>7월 온라인 예매 시작일<br>2022년 6월 1일(수) 15:00...</li>
                <li>2022-06-21</li>
            </a>
        </ul>
        <ul class="info"><a href="#a">
                <li>공지</li>
                <li>2022년 6월<br>온라인 예매 및 휴관일 안내</li>
                <li>6월 온라인 예매 시작일<br>2022년 5월 2일(월) 15:00...</li>
                <li>2022-05-20</li>
            </a>
        </ul>
        <ul class="info"><a href="#a">
                <li>공지</li>
                <li>2022년 5월<br>온라인 예매 및 휴관일 안내</li>
                <li>4월 온라인 예매 시작일<br>2022년 4월 1일(금) 15:00...</li>
                <li>2022-04-21</li>
            </a>
        </ul>
    </div>


    <!--프로그램-->
    <div id="program">
        <p class="title1">#별마로 프로그램</p>
        <p class="title2">Byeolmaro</p>
        <p class="title3">Program</p>

        <ul class="left">
            <li><a href="#a">
                    <p class="left">01</p>
                    <p class="right">카오스의 틈</p>
                </a>
            </li>
            <li><a href="#a">
                    <p class="left">02</p>
                    <p class="right">녹스의 물결</p>
                </a>
            </li>
            <li><a href="#a">
                    <p class="left">03</p>
                    <p class="right">에레보스의 빛</p>
                </a>
            </li>
            <li><a href="#a">
                    <p class="left">04</p>
                    <p class="right">도로시의 별</p>
                </a>
            </li>
            <li><a href="#a">
                    <p class="left">05</p>
                    <p class="right">별헤는 밤</p>
                </a>
            </li>
            <li><a href="#a">
                    <p class="left">06</p>
                    <p class="right">별나라 우주여행</p>
                </a>
            </li>
            <li><a href="#a">
                    <p class="left">07</p>
                    <p class="right">시간 탐험대</p>
                </a>
            </li>
        </ul>

        <ul class="right">
            <li>겹겹이 쌓인<br>아름다운 우주의 형상</li>
            <li>지금! 전문가가 추천하는 프로그램</li>
            <li><a href="#a">바로가기</a></li>
        </ul>
    </div>


    <!--예매하기-->
    <div id="wrap_ticket">
        <div id="ticket">
            <h2>천문대 예매하기</h2>
            <h5>방문시에 편리한 <span>온라인 예매서비스</span>를 이용해 보세요.</h5>
            <p class="btn"><a href="#a">예매하기</a></p>
        </div>
    </div>



    <!--시설소개-->
    <div id="introduce">
        <h2>별마로 시설소개</h2>
        <p class="line"></p>

        <ul><a href="#a">
                <li><img src="../images/intro_menu1.png"></li>
                <li>천체관측실</li>
                <li></li>
            </a>
        </ul>
        <ul><a href="#a">
                <li><img src="../images/intro_menu2.png"></li>
                <li>CAFE 799</li>
                <li></li>
            </a>
        </ul>
        <ul><a href="#a">
                <li><img src="../images/intro_menu3.png"></li>
                <li>천체투영실</li>
                <li></li>
            </a>
        </ul>
        <ul><a href="#a">
                <li><img src="../images/intro_menu4.png"></li>
                <li>미디어존</li>
                <li></li>
            </a>
        </ul>
    </div>


    <!--이벤트-->
    <div id="event">
        <h2>Event</h2>
        <h4>별마로의 <b>특별한 이벤트</b>와 <b>다양한 제휴혜택</b>을 만나보세요!</h4>

        <ul class="first">
            <li><img src="../images/event_icon1.png"></li>
            <li>이벤트</li>
            <li>특별 이벤트와<br>통합 이벤트를 만나보세요.</li>
            <li><a href="#a">자세히보기</a></li>
        </ul>
        <ul class="second">
            <li><img src="../images/event_icon2.png"></li>
            <li>제휴할인</li>
            <li>제휴카드, 멤버십 할인 등<br>우대 혜택을 알아보세요.</li>
            <li><a href="#a">자세히보기</a></li>
        </ul>
        <ul>
            <li><img src="../images/event_icon3.png"></li>
            <li>연간회원</li>
            <li>365일 매일매일<br>별마로와 함께해요!</li>
            <li><a href="#a">자세히보기</a></li>
        </ul>
    </div>


    <!--sns-->
    <div id="sns">
        <h2>별마로 SNS</h2>
        <ul><a href="#a">
                <li><img src="../images/sns_img1.jpg"></li>
                <li>왜 유명한 천문대들은 전부 높은 곳에 위치하고 있는 걸까?</li>
                <li><img src="../images/sns_icon1.png"></li>
            </a>
        </ul>
        <ul><a href="#a">
                <li><img src="../images/sns_img2.jpg"></li>
                <li>여름밤. 나랑 별 보러 갈래? 영월군이 보장하는 '영월여행' 추천 코스!</li>
                <li><img src="../images/sns_icon2.png"></li>
            </a>
        </ul>
        <ul><a href="#a">
                <li><img src="../images/sns_img3.jpg"></li>
                <li>지금 볼 수 있는 별자리 모음</li>
                <li><img src="../images/sns_icon3.png"></li>
            </a>
        </ul>
        <ul><a href="#a">
                <li><img src="../images/sns_img4.jpg"></li>
                <li>[포착! 현장7] 영월 ‘별마로 천문대’ 천문우주 문화공간으로 재탄생</li>
                <li><img src="../images/sns_icon4.png"></li>
            </a>
        </ul>
    </div>

<jsp:include page="/WEB-INF/tags/footer.jsp"/>


<script type="text/javascript">

/* message 경고창 */
const message = "${message}";
if (message != '') {
	alert(message);
};

</script>
</body>
</html>