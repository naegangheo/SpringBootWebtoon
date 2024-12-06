<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="/css/main.css">

<div class="main">
        <div class="m_top">
             <div class="m_top_week"> <%-- 요일별  best webtoon--%>
                 <div class="top_week_cate">
                    <label>${message_week}웹툰</label>&nbsp;
                    <div class="week_cate">   <%-- 요일--%>
                        <a href="#">
                            인기순
                        </a>
                        <a href="#">
                            업데이트순
                        </a>
                        <a href="#">
                            조회순
                        </a>
                    </div>
                 </div>

                 <div class="top_week_img">

                     <a href="#" class="prev">
                         <img src="/images/left_arrow.png"/>
                     </a>

                     <div class="image_container">
                         <div class="image_wrapper">
                             <div>
                                 <a href="webtoonview">
                                     <img src="/images/noname.jpg" style="height: 300px">
                                 </a>
                             </div>
                             <div>
                                 <a href=#>
                                     <img src="/images/noname.jpg" style="height: 300px">
                                 </a>
                             </div>
                             <div>
                                 <a href="#">
                                     <img src="/images/noname.jpg" style="height: 300px">
                                 </a>
                             </div>
                             <div>
                                 <a href="#">
                                     <img src="/images/noname.jpg" style="height: 300px">
                                 </a>
                             </div>
                             <div>
                                 <a href="#">
                                     <img src="/images/noname.jpg" style="height: 300px">
                                 </a>
                             </div>
                         </div>
                         <div class="image_wrapper">
                             <div>
                                 <a href="#">
                                     <img src="/images/noname.jpg" style="height: 300px">
                                 </a>
                             </div>
                             <div>
                                 <a href="#">
                                     <img src="/images/noname.jpg" style="height: 300px">
                                 </a>
                             </div>
                             <div>
                                 <a href="#">
                                     <img src="/images/noname.jpg" style="height: 300px">
                                 </a>
                             </div>
                             <div>
                                 <a href="#">
                                     <img src="/images/noname.jpg" style="height: 300px">
                                 </a>
                             </div>
                             <div>
                                 <a href="#">
                                     <img src="/images/noname.jpg" style="height: 300px">
                                 </a>
                             </div>
                         </div>
                         <div class="image_wrapper">
                             <div>
                                 <a href="#">
                                     <img src="/images/noname.jpg" style="height: 300px">
                                 </a>
                             </div>
                             <div>
                                 <a href="#">
                                     <img src="/images/noname.jpg" style="height: 300px">
                                 </a>
                             </div>
                             <div>
                                 <a href="#">
                                     <img src="/images/noname.jpg" style="height: 300px">
                                 </a>
                             </div>
                             <div>
                                 <a href="#">
                                     <img src="/images/noname.jpg" style="height: 300px">
                                 </a>
                             </div>
                             <div>
                                 <a href="#">
                                     <img src="/images/noname.jpg" style="height: 300px">
                                 </a>
                             </div>
                         </div>
                     </div>

                     <a href="#" class="next">
                         <img src="/images/right_arrow.png" alt="다음" />
                     </a>
                 </div>
             </div>
        </div>

        <div>
            <%-- 광고 배너 --%>
            <div>
                <img src="/images/ad_image1.png" style="width: 1200px;">
            </div>
            <%-- ad image --%>
        </div>

        <div class="m_mid">
            <div class="m_mid_left">
                <div class="mid_genre"> <%-- 장르별  best webtoon--%>
                    <div class="genre">
                        <label>가장 핫한 ## 웹툰만 모아봤어요!</label><br>
                        <div class="mid_genre_cate">   <%-- 장르 필요하면 더추가~--%>
                            <div>
                                <a href="#">
                                    로맨스
                                </a>&nbsp;
                            </div>
                            <div>
                                <a href="#">
                                    판타지
                                </a>&nbsp;
                            </div>
                            <div>
                                <a href="#">
                                    액션
                                </a>&nbsp;
                            </div>
                            <div>
                                <a href="#">
                                    일상
                                </a>&nbsp;
                            </div>
                            <div>
                                <a href="#">
                                    스릴러
                                </a>&nbsp;
                            </div>
                        </div>
                    </div>
                    <div class="genre_img">
                           <%-- webtoon 그림--%>
                        <div>
                            <a href="#">
                                <img src="/images/noname.jpg" style="width: 140px;">
                            </a>
                        </div>
                        <div>
                            <a href="#">
                                <img src="/images/noname.jpg" style="width: 140px;">
                            </a>
                        </div>
                        <div>
                            <a href="#">
                                <img src="/images/noname.jpg" style="width: 140px;">
                            </a>
                        </div>
                        <div>
                            <a href="#">
                                <img src="/images/noname.jpg" style="width: 140px;">
                            </a>
                        </div>
                        <div>
                            <a href="#">
                                <img src="/images/noname.jpg" style="width: 140px;">
                            </a>
                        </div>
                    </div>
                </div>

                <div class="mid_new"> <%-- new webtoon--%>
                    <div class="new">
                        <label>이달의 신작</label>
                        <div class="new_img">
                            <div>
                                <a href="#">
                                    <img src="/images/noname.jpg" style="width: 200px;">
                                </a>
                            </div>
                            <div>
                                <a href="#">
                                    <img src="/images/noname.jpg" style="width: 200px;">
                                </a>
                            </div>
                            <div>
                                <a href="#">
                                    <img src="/images/noname.jpg" style="width: 200px;">
                                </a>
                            </div>
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
                                <li><a href="#">요고슨</a></li>
                                <li><a href="#">공지사항이니께</a></li>
                                <li><a href="#">공지사항 DB에서</a></li>
                                <li><a href="#">불러서</a></li>
                                <li><a href="#">여기가 채워져야함</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>

            <div class="m_mid_right">

                <div id="ad" style="border: 3px solid red; display: flex">
                    <img src="/images/ad_image2.png" style="width: 310px; height: 310px;">
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
                            <li>
                                <div>
                                    <label>1</label>
                                    <a href="#">
                                        <img src="/images/noname.jpg" style="width: 50px; padding-left: 10px;">
                                    </a>
                                </div> <%-- 1위 사진--%>
                                <div class="title">
                                    <a href="#">title</a>
                                </div> <%--1위 제목--%>
                            </li>
                            <li>
                                <div>
                                    <label>2</label>
                                    <a href="#">
                                        <img src="/images/noname.jpg" style="width: 50px; padding-left: 10px;">
                                    </a>
                                </div> <%-- 2위 사진--%>
                                <div class="title">
                                    <a href="#">title</a>
                                </div> <%--2위 제목--%>
                            </li>
                            <li>
                                <div>
                                    <label>3</label>
                                    <a href="#">
                                        <img src="/images/noname.jpg" style="width: 50px; padding-left: 10px;">
                                    </a>
                                </div> <%-- 3위 사진--%>
                                <div class="title">
                                    <a href="#">title</a>
                                </div> <%--3위 제목--%>
                            </li>
                            <li>
                                <div>
                                    <label>4</label>
                                    <a href="#">
                                        <img src="/images/noname.jpg" style="width: 50px; padding-left: 10px;">
                                    </a>
                                </div> <%-- 4위 사진--%>
                                <div class="title">
                                    <a href="#">title</a>
                                </div> <%--4위 제목--%>
                            </li>
                            <li>
                                <div>
                                    <label>5</label>
                                    <a href="#">
                                        <img src="/images/noname.jpg" style="width: 50px; padding-left: 10px;">
                                    </a>
                                </div> <%-- 5위 사진--%>
                                <div class="title">
                                    <a href="#">title</a>
                                </div> <%--5위 제목--%>
                            </li>
                        </ul>
                </div>
            </div>
        </div>
</div>

<%@ include file="footer.jsp" %>
