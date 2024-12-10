<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="/css/webtoon/webtoon_view.css" />

    <br/>
    <div class="container">
        <div class="left">
            <div id="content">

                <%-- 제목,이미지--%>
                <div class="title">
                    <div class="title_image">
                        <img class="wbimg" src="../images/webtoon/webtoon_images/title_img/${webtoonVO.image}"/>
                    </div>
                    <div class="title_right">
                        <div class="subtitle" style="font-size: 26px; font-weight: bold;">${webtoonVO.subject}</div>
                        <br/>
                        <div class="title_name" id="tag">작가 : ${webtoonVO.userid}</div>
                        <br/>
                        <div class="title_content" id="tag">내용 : ${webtoonVO.content}</div>
                        <br/>
                        <div class="title_content" id="tag">
                            <c:choose>
                                <c:when test ="${webtoonVO.genre == 1}">장르 : 전체</c:when>
                                <c:when test ="${webtoonVO.genre == 2}">장르 : 로맨스</c:when>
                                <c:when test ="${webtoonVO.genre == 3}">장르 : 판타지</c:when>
                                <c:when test ="${webtoonVO.genre == 4}">장르 : 액션</c:when>
                                <c:when test ="${webtoonVO.genre == 5}">장르 : 일상</c:when>
                                <c:when test ="${webtoonVO.genre == 6}">장르 : 스릴러</c:when>
                                <c:otherwise>장르 : null</c:otherwise>
                            </c:choose>
                        </div>
                        <input type="button" value="목록보기" onClick="history.go(-1)"/>
                    </div>
                </div>
                <br>
                <%-- 내용 --%>
                <div class="list" >
                    <img src="../images/webtoon/webtoon_images/content_img/content_img01.png" width="840px;" height="1080px" />
                </div>

                <div class="reply">
                    <h2>댓글</h2>
                    <form mehod="post" action="" class="replyform">
                        <div>#아이디</div>
                        <textarea id="reply_input" placeholder="댓글을 입력하세요..." rows="4" cols="100"></textarea>
                        <input type="submit" value="댓글추가" onclick=""/>
                    </form>
                    <br>
                    <div>
                        <div class="replylist_row">
                            <div class="replylist_title">작성자</div>
                            <div class="replylist_title">내용</div>
                            <div class="replylist_title">작성일시</div>
                        </div>
                        <div class="replylist">
<%--                            댓글리스트--%>
                        </div>

                    </div>
                </div>

            </div>
        </div>

        <br/>


<%-- 오른쪽 광고 및 공지사항--%>
        <div class="aside_banner">
            <div class="ad">
                <img class="wbimg" src="images/webtoon/noimg.png">
            </div>
            <br/>
            <div class="ad">
                <img class="wbimg" src="images/webtoon/noimg.png">
            </div>

            <div class="notice">
                <ul style="font-size: 26px; font-weight: bold;">
                    <a href="#">공지사항</a>
                </ul>
                <ul class="notice_list">
                    <li><a class="notice_line" href="/">첫 번째 공지</a></li>
                    <li><a class="notice_line" href="/">두 번째 공지</a></li>
                    <li><a class="notice_line" href="/">세 번째 공지</a></li>
                    <li><a class="notice_line" href="/">네 번째 공지</a></li>
                    <li><a class="notice_line" href="/">다섯 번째 공지</a></li>
                </ul>
            </div>
        </div>
    </div>





<%@ include file="../footer.jsp"%>
