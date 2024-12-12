<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="/css/main.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<div class="main">
    <div class="m_top">
        <div class="m_top_week"> <%-- 요일별  best webtoon--%>
            <div class="top_week_cate">
                <label>웹툰</label>
            </div>
            <div class="top_week_img">
                <a href="#" class="prev" >
                    <img src="images/main/left_arrow.png" alt="이전"/>
                </a>
                <div class="image_container" >
                    <div id="webtoon" class="image_wrapper" >
                            <c:forEach  begin="0" end="14" items="${webtoon}" var="wvo">
                                <div class="best_item">
                                    <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                                        <img src="/images/webtoon/webtoon_images/title_img/${wvo.image}" style="height: 290px"/>
                                    </a>
                                    <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                                        제목 ${wvo.subject}
                                    </a>
                                    <div class="b_author">
                                        <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                                           저자 ${wvo.userid}
                                        </a>
                                    </div>
                                    <div class="views">
                                        👁 조회수 ${wvo.readcountM + wvo.readcountF + wvo.readcountN}
                                    </div>
                                </div>
                          </c:forEach>
                        </div>

                </div>

                <a href="#" class="next">
                    <img src="images/main/right_arrow.png" alt="다음" />
                </a>
            </div>
        </div>
    </div>

    <div>
        <%-- 광고 배너 --%>
        <div>
            <img src="images/main/ad_image1.png" style="width: 1200px;">
        </div>
        <%-- ad image --%>
    </div>

    <div class="m_mid">
        <div class="m_mid_left">
            <div class="mid_genre"> <%-- 장르별  best webtoon--%>
                <div class="genre">
                    <label>가장 핫한 ${messageG} 웹툰만 모아봤어요!</label><br>
                    <div class="mid_genre_cate">   <%-- 장르 필요하면 더추가~--%>
                        <div>
                            <a href="#" class="genre_button" data-genre="2">
                                로맨스
                            </a>&nbsp;
                        </div>
                        <div>
                            <a href="#" class="genre_button" data-genre="3">
                                판타지
                            </a>&nbsp;
                        </div>
                        <div>
                            <a href="#" class="genre_button" data-genre="4">
                                액션
                            </a>&nbsp;
                        </div>
                        <div>
                            <a href="#" class="genre_button" data-genre="5">
                                일상
                            </a>&nbsp;
                        </div>
                        <div>
                            <a href="#" class="genre_button" data-genre="6">
                                스릴러
                            </a>&nbsp;
                        </div>
                    </div>
                </div>
                <div class="genre_img">
                    <%-- AJAX로 웹툰 구현--%>
                    <c:forEach begin="0" end="4"  items="${webtoon}" var="wvo">
                        <div class="genre_item">
                            <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                                <img src="/images/webtoon/webtoon_images/title_img/${wvo.image}"  style="width: 150px"/>
                            </a>
                            <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                                제목 ${wvo.subject}
                            </a>
                            <div class="author">
                                <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                                   저자 ${wvo.userid}
                                </a>
                            </div>
                            <div class="views">
                                👁 조회수 ${wvo.readcountM + wvo.readcountF + wvo.readcountN}
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>

            <div class="mid_new"> <%-- new webtoon--%>
                <div class="new">
                    <label>이달의 신작</label>
                    <div class="new_img">
                        <c:forEach begin="0" end="2" items="${last}" var="last">
                            <div class="new_item">
                                <a href="webtoon_view?wseq=${last.wseq}&gender=${loginUser.gender}">
                                    <img src="/images/webtoon/webtoon_images/title_img/${last.image}" style="width: 200px; "/>
                                </a>
                                <a href="webtoon_view?wseq=${last.wseq}&gender=${loginUser.gender}">
                                    제목 ${last.subject}
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

            <div class="notice">
                <div class ="list_title">
                    <label>공지사항</label>
                    <div>
                        <a href="notice">더보기></a>
                    </div>
                </div>
                <div>
                    <div>
                        <ul>
                            <c:forEach items="${noticeList}" var="noticeVO" begin="0" end="4">
                                <li>
                                    ${noticeVO.subject}
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>

        <div class="m_mid_right">

            <div id="ad" style="border: 3px solid red; display: flex">
                <img src="images/main/ad_image2.png" style="width: 310px; height: 310px;">
                <%-- ad광고 란~  (이것의 크기는 높이를 장르별 테그의 높이와 동일하게 작성 )--%>
            </div>

            <div class="mid_right_list">

                <div class="list_title">
                    <label>실시간 인기 웹툰</label>
                    <div>
                        <a href="#">
                            전체
                        </a>
                        <a href="#">
                            여성
                        </a>
                        <a href="#">
                            남성
                        </a>
                    </div>
                </div>
                <ul>
                    <c:forEach begin="0" end="4" var="index">
                        <li id="rank_list">
                            <div>
                                <label>${index+1}</label>
                                <a href="#">
                                    <img src="images/main/noname.jpg" style="width: 50px; padding-left: 10px;">
                                </a>
                            </div>
                            <div class="title">
                                <a href="#">title${index+1}</a>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </div>
    </div>
</div>



<%@ include file="footer.jsp" %>


<script>
    $(window).on('load', function() {
        let currentIndex = 0;
        const slideWidth = 1200;
        const totalSlides = 3;



        $('.prev').click(function() {
            if (currentIndex > 0) {
                currentIndex--;
                $('.image_container').css('transform', 'translateX(' + (-currentIndex * slideWidth) + 'px)');
                checkButtons();
            }
        });

        $('.next').click(function() {
            console.log("총 슬라이드 개수:", totalSlides);
            if (currentIndex < totalSlides - 1) {
                currentIndex++;
                $('.image_container').css('transform', 'translateX(' + (-currentIndex * slideWidth) + 'px)');
                checkButtons();
            }
        });

        function checkButtons() {
            $('.prev').toggle(currentIndex !== 0);
            $('.next').toggle(currentIndex !== totalSlides - 1);
        }

        checkButtons();  // 초기 버튼 상태 설정

    });


    // 장르 버튼 클릭 이벤트 처리
    document.querySelectorAll(".genre_button").forEach(button => {
        button.addEventListener("click", event => {
            event.preventDefault(); // 기본 동작 방지
            const genre = button.getAttribute("data-genre");  // data-genre 속성에서 장르 값 가져오기
            console.log("Selected Genre ID:", genre);  // 장르 값 출력
            // genre가 비어있으면 처리 방지
            if (!genre) {
                console.error("장르 값이 비어 있습니다!");
                return;
            }
            const url = '/readCountByGenre?genre=${genre}';
            console.log("Request URL:", url);  // 요청 URL을 로그로 출력
            loadGenreWebtoons(url);  // AJAX 요청
        });
    });

    function loadGenreWebtoons(url) {
        fetch(url)
            .then(response => response.json())
            .then(data => {
                console.log("Received data:", data);  // 받아온 데이터 출력
                const container = document.querySelector(".genre_img");
                container.innerHTML = data.length
                    ? data.map(wvo => `
                    <div class="genre_item">
                        <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                            <img src="/images/webtoon/webtoon_images/title_img/${wvo.image}" style="width: 150px"/>
                        </a>
                        <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                            제목 ${wvo.subject}
                        </a>
                        <div class="author">
                            <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                                저자 ${wvo.userid}
                            </a>
                        </div>
                        <div class="views">
                            👁 조회수 ${wvo.readcountM + wvo.readcountF + wvo.readcountN}
                        </div>
                    </div>
                `).join("")
                    : "<p>해당 장르에 웹툰이 없습니다.</p>";
            })
            .catch(console.error);
    }
</script>