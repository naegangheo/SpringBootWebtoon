<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp" %>
<link rel="stylesheet" type="text/css" href="css/best.css" />

<div class="main-container">
    <!-- 오늘의 베스트 웹툰 -->
    <div class="today-best">
        <h2>오늘의 베스트 웹툰</h2>
        <div class="best-list">
            <c:forEach items="${todayBestList}" var="webtoon">
                <div class="best-item">
                    <a href="${webtoon.link}">
                        <img src="${webtoon.image}" style="width: 270px; height: 160px" alt="${webtoon.title}">
                    </a>
                    <a href="${webtoon.link}" class="title">${webtoon.title}</a>
                    <a href="${webtoon.authorLink}" class="author">${webtoon.author}</a>
                    <p>👁 ${webtoon.views}</p>
                </div>
            </c:forEach>
        </div>
    </div>

    <!-- 전체 베스트 -->
    <div class="all-best">
        <h2>전체 베스트</h2>
        <div class="filters">
            <a href="?sort=updated">업데이트순</a>
            <a href="?sort=popular">인기순</a>
            <a href="?sort=rating">별점순</a>
        </div>
        <div class="best-grid">
            <c:forEach items="${allBestList}" var="webtoon" varStatus="status">
                <div class="grid-item">
                    <a href="${webtoon.link}">
                        <img src="${webtoon.image}" style="width: 100px; height: 100px" alt="${webtoon.title}">
                    </a>
                    <a href="${webtoon.link}" class="title">${webtoon.title}</a>
                    <a href="${webtoon.authorLink}" class="author">${webtoon.author}</a>
                    <p>👁 ${webtoon.views}</p>
                </div>
                <c:if test="${status.index % 3 == 2}">
                    <div class="row-separator"></div> <!-- 3개 단위로 줄바꿈 -->
                </c:if>
            </c:forEach>
        </div>
    </div>
</div>

<%@ include file="footer.jsp" %>
