<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="/css/main.css">

<div class="nav_areaO">
<div class="main">
    <div class="m_top">
        <div class="m_top_week"> <%-- 요일별  best webtoon--%>
            <div class="top_week_cate">
                인기웹툰
            </div>
            <div class="top_week_img">
                <a href="#" class="prev" >
                    <img src="images/main/left_arrow.png" alt="이전"/>
                </a>
                <div class="image_container" >
                    <div id="webtoon" class="image_wrapper" >
                            <c:forEach  begin="0" end="14" items="${webtoon}" var="wvo">
                                <div class="best_item">
                                    <a id="TitleBorder" href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                                        <img src="/images/webtoon/webtoon_images/title_img/${wvo.image}" style="height: 290px"/>
                                    </a>
                                    <a id="best_subject" href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                                        ${wvo.subject}
                                    </a>
                                    <div class="b_author">
                                        <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                                            ${wvo.userid}
                                        </a>
                                    </div>
                                    <div class="views">
                                        👁 ${wvo.readcountM + wvo.readcountF + wvo.readcountN}
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
                    <h2>가장 핫한 ${messageG} 웹툰만 모아봤어요!</h2>
                    <div class="mid_genre_cate">   <%-- 장르 필요하면 더추가~--%>
                            <h4 class="genre_button" data-genre="2">로맨스</h4>
                            <h4 class="genre_button" data-genre="3">판타지 </h4>
                            <h4 class="genre_button" data-genre="4"> 액션</h4>
                            <h4 class="genre_button" data-genre="5">일상</h4>
                            <h4 class="genre_button" data-genre="6">스릴러</h4>
                    </div>

                </div>
                <div class="genre_img" id="genreForm">
                    <c:forEach begin="0" end="4"  items="${readCountByGenre}" var="rcg">
                    <%-- AJAX로 웹툰 구현--%>
                        <div class="genre_item">
                            <a href="webtoon_view?wseq=${rcg.wseq}&gender=${loginUser.gender}">
                                <img src="/images/webtoon/webtoon_images/title_img/${rcg.image}"/>
                            </a>
                            <a href="webtoon_view?wseq=${rcg.wseq}&gender=${loginUser.gender}"  class="subject">
                               ${rcg.subject}
                            </a>
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
                                <a id="new_Atag" href="webtoon_view?wseq=${last.wseq}&gender=${loginUser.gender}">
                                    <img src="/images/webtoon/webtoon_images/title_img/${last.image}" style="width: 250px; height: 150px "/>
                                </a>
                                <a id="new_Atag2" href="webtoon_view?wseq=${last.wseq}&gender=${loginUser.gender}">
                                    ${last.subject}
                                </a>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>

           <div class="notice">
                <div class ="list_title">
                    <label>공지사항 </label><a href="notice" id="noticeMore">더보기></a>
                </div>
                <div>
                    <div>
                        <ul>
                        <c:if test="${empty noticeList}">
                            <p>공지사항이 없습니다.</p>
                        </c:if>
                            <c:forEach items="${noticeList}" var="nvo" begin="0" end="4">
                                    <a href="/notice?nseq=${noticeVO.nseq}" class="nosub">
                                    ${nvo.subject}
                                    </a>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
        <div class="m_mid_right">

            <div id="ad" style="display: flex">
                <img src="images/main/ad_image2.png" style="width: 310px; height: 310px;">
                <%-- ad광고 란~  (이것의 크기는 높이를 장르별 테그의 높이와 동일하게 작성 )--%>
            </div>

            <div class="mid_right_list">

                <div class="list_title">
                    <label>실시간 인기 웹툰</label>
                    <div class="gender_item">
                        <a href="#" class="gender_button" data-gender="T">
                            전체
                        </a>
                        <a href="#" class="gender_button" data-gender="F">
                            여성
                        </a>
                        <a href="#" class="gender_button" data-gender="M">
                            남성
                        </a>
                    </div>
                    </div>
                </div>
                <ul id="rank">
                    <c:forEach begin="0" end="4" var="rbg" items="${readCountByGender}">
                        <%--  AJax로 구현--%>
                    </c:forEach>
                </ul>
            </div>
        </div>
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
</script>