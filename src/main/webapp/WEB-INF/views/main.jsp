<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" href="/css/main.css">

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div class="main">
    <div class="m_top">
        <div class="m_top_week"> <%-- 요일별  best webtoon--%>
            <div class="top_week_cate">
                <label>${message_week}웹툰</label>&nbsp;
                <div class="week_cate">   <%-- 요일--%>
                    <a href="javascript:void(0);" id="sortReadcount">
                        인기순
                    </a>
                    <a href="javascript:void(0);" id="sortWritedate">
                        업데이트순
                    </a>
                </div>
            </div>

            <div class="top_week_img">

                <a href="#" class="prev">
                    <img src="images/main/left_arrow.png"/>
                </a>

                <div class="image_container" >


                    <div id="webtoon" class="image_wrapper" >
                            <c:forEach begin="0" end="14"   items="${webtoon}" var="wvo">
                                <div class="best_item" data-read="${wvo.readcountM + wvo.readcountF + wvo.readcountN}" data-date="${wvo.indate}">
                                    <a href="webtoonview?wseq=${wvo.wseq}">
                                        <img src="/images/main/noname.jpg" style="height: 290px"/>
                                    </a>
                                    <a href="#">
                                        제목 ${wvo.subject}
                                    </a>
                                    <div class="b_author">
                                        <a href="#">
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
                    <c:forEach begin="0" end="4">
                        <div class="genre_item">
                            <a href="#">
                                <img src="/images/main/noname.jpg" style="width: 150px"/>
                            </a>
                            <a href="#">
                                제목
                            </a>
                            <div class="author">
                                <a href="#">
                                   저자
                                </a>
                            </div>
                            <div class="views">
                                👁 조회수
                            </div>
                        </div>
                     </c:forEach>
                </div>
            </div>

            <div class="mid_new"> <%-- new webtoon--%>
                <div class="new">
                    <label>이달의 신작</label>
                    <div class="new_img">
                        <c:forEach begin="0" end="2">
                            <div class="new_item">
                                <a href="#">
                                    <img src="/images/main/noname.jpg" style="width: 200px; "/>
                                </a>
                                <a href="#">
                                    제목
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
                            <c:forEach begin="0" end="4">
                                <li><a href="#">요고슨 반복문으로만든 공지사항임</a></li>
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
                                <label>${index}</label>
                                <a href="#">
                                    <img src="images/main/noname.jpg" style="width: 50px; padding-left: 10px;">
                                </a>
                            </div>
                            <div class="title">
                                <a href="#">title${index}</a>
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
    // sortReadcount
    // sortWritedate

    document.getElementById("sortReadcount").addEventListener("click",function (){ sortList("readcount");});

    document.getElementById("sortWritedate").addEventListener("click",function (){sortList("writedate"); });

    function sortList(type){
        let webtoon = document.getElementById("webtoon");
        let items = Array.from(webtoon.getElementsByClassName("best_item"));

        if(type ==="readcount"){
            items.sort((a,b) =>{
                let readA = parseInt(a.getAttribute("data-read"))||0;
                let readB = parseInt(b.getAttribute("data-read"))||0;
                return readB - readA;
            });
        }else if(type === "writedate"){
            items.sort((a,b)=>{
                let dateA = a.getAttribute("data-date");
                let dateB = b.getAttribute("data-date");
                return new Date(dateB) - new Date(dateA);
            });
        }

        webtoon.innerHTML = "";
        items.forEach(item => webtoon.appendChild(item));
    }



</script>