<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp" %>
<link rel="stylesheet" type="text/css" href="css/best.css" />

<div class="main-container">
    <!-- 오늘의 인기 베스트 -->
    <section class="today-best">
        <h2>오늘의 인기 베스트</h2>
        <div class="best-wrapper">
            <c:forEach items="${BestListTop}" var="wvo">
                <div class="best-item">
                    <a href="webtoon_view?wseq=${wvo.wseq}">
                        <img src="/images/webtoon/webtoon_images/title_img/${wvo.image}" alt="${wvo.subject}" />
                    </a>
                    <a href="webtoon_view?wseq=${wvo.wseq}">${wvo.subject}</a>
                    <div class="author"><a href="webtoon_view?wseq=${wvo.wseq}">${wvo.userid}</a></div>
                    <div class="views">👁 ${wvo.readcountF + wvo.readcountM + wvo.readcountN}</div>
                </div>
            </c:forEach>
        </div>
    </section>

    <!-- 전체 베스트 -->
    <section class="all-best">
        <div class="best-header">
            <h2>전체 베스트</h2>
            <div class="filters">
                <a href="?filter=update">업데이트순</a>
                <a href="?filter=read">인기순</a>
                <a href="?filter=name">가나다순</a>
            </div>
        </div>
        <div class="best-grid">
            <c:forEach items="${webtoonList}" var="wvo">
                <div class="grid-item">
                    <a href="webtoon_view?wseq=${wvo.wseq}">
                       <img src="/images/${wvo.savefilename != null ? wvo.savefilename : 'main/noname.jpg'}" alt="${wvo.subject}" />
                    </a>
                    <div class="content">
                        <p class="title"><a href="webtoon_view?wseq=${wvo.wseq}">${wvo.subject}</a></p>
                        <p class="author"><a href="#">${wvo.userid}</a></p>
                        <p class="views">👁 ${wvo.readcountF + wvo.readcountM + wvo.readcountN}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>
</div>

<%@ include file="../footer.jsp" %>
