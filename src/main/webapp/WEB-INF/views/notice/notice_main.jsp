<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="/css/notice/notice.css" />
<section>
    <br/>
    <div class="container">

        <br/>
        <div id="notice">

            <div class="top">
                <div style="font-weight: bold; font-size: 26px; display: flex; justify-content: flex-start; align-content: center; flex:6;">공지사항</div>
                <div class="qnasearch">
                    <div id="search"><input type="text" name="search" placeholder="제목/내용으로 검색할 수 있습니다" size="35px" height="20px" maxlength="18"/></div>
                    <div><img src="images/search.png"/></div>
                </div>
            </div>

            <div id="list">

            </div>

        </div>


        <%-- 오른쪽 광고 및 공지사항--%>
        <div class="aside_banner">
            <div class="ad">
                <img class="adimg" src="images/webtoon/noimg.png">
            </div>
            <br/>
            <div class="ad">
                <img class="adimg" src="images/webtoon/noimg.png">
            </div>
        </div>

    </div>

</section>


<%@ include file="../footer.jsp"%>