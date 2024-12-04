<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="/css/webtoon/webtoonview.css" />

    <br/>
    <div class="container">
        <div class="left">
            <div id="content">

                <%-- 제목,이미지--%>
                <div class="title">
                    <div class="title_image">
                        <img class="wbimg" src="images/webtoon/noimg.png"/>
                    </div>
                    <div class="title_right">
                        <div class="subtitle" style="font-size: 26px; font-weight: bold;">제목</div>
                        <br/>
                        <div class="title_name">작가이름 /글/그림/요일/이용가</div>
                        <br/>
                        <div class="title_content">죽다 살아나 눈을 뜬 장소는 인간을 애완동물로 키우는 괴물들의 세상.
                            졸지에 괴물의 애완인간이 된 산호는 어떻게든 탈출해 집으로 돌아가고자 하는데…</div>
                        <br/>
                        <a class="tag" href="/">#판타지</a>
                        <a class="tag" href="/">#액션</a>
                        <a class="tag" href="/">#뭐시기</a>
                        <a class="tag" href="/">#어쩌구</a>
                    </div>
                </div>
                <br>
                <%-- 목록 --%>
                <div class="list" >
                    <img src="images/webtoon/webimg1.png" width="840px;" height="1080px" />
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
                <ul style="font-size: 26px; font-weight: bold;"><a href="#">공지사항</a></ul>
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
