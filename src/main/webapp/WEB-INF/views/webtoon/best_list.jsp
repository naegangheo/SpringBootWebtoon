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
                    <a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">
                        <img src="/images/webtoon/webtoon_images/title_img/${wvo.image}" alt="${wvo.subject}" />
                    </a>
                    <div class="subject"><a href="webtoon_view?wseq=${wvo.wseq}">${wvo.subject}</a></div>
                    <div class="author"><a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">${wvo.userid}</a></div>
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
                       <img src="/images/webtoon/webtoon_images/title_img/${wvo.image}" alt="${wvo.subject}" />
                    </a>
                    <div class="content">
                        <p class="title"><a href="webtoon_view?wseq=${wvo.wseq}&gender=${loginUser.gender}">${wvo.subject}</a></p>
                        <p class="author"><a href="webtoon_view?wseq=${wvo.wseq}">${wvo.userid}</a></p>
                        <p class="views">👁 ${wvo.readcountF + wvo.readcountM + wvo.readcountN}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
        <div class="paging">
            <c:if test="${currentPage > 1}">
                <a href="?page=${currentPage - 1}&pageSize=${pageSize}">〈</a>
            </c:if>
             <c:if test="${currentPage == 1}">
                <a class="disabled" href="javascript:void(0);">〈</a>
            </c:if>
            <c:forEach begin="1" end="${totalPages}" var="i">
                <a href="?page=${i}&pageSize=${pageSize}" class="${i == currentPage ? 'active' : ''}">${i}</a>
            </c:forEach>
            <c:if test="${currentPage < totalPages}">
                <a href="?page=${currentPage + 1}&pageSize=${pageSize}">〉</a>
            </c:if>
            <c:if test="${currentPage == totalPages}">
                <a class="disabled" href="javascript:void(0);">〉</a>
             </c:if>
        </div>
    </section>
</div>

<%@ include file="../footer.jsp" %>
