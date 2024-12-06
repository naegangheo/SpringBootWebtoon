<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/webtoon/week_list.css" />
<script src="script/mainL.js"></script>

<div class="main-container">
    <!-- 오늘의 인기 베스트도전 -->
    <section class="today-best" >
        <h2>${weekend} 인기 베스트</h2>
        <div class="best-wrapper">
            <div class="best-item">
                <img src="/images/noname.jpg" alt="webtoon">
                <a href="#">작품 이름 1</a>
                <div class="author"><a href="#">작가 이름</a></div>
                <div class="views">👁 1234</div>
            </div>
            <div class="best-item">
                <img src="/images/noname.jpg" alt="webtoon">
                <a href="#">작품 이름 2</a>
                <div class="author"><a href="#">작가 이름</a></div>
                <div class="views">👁 2345</div>
            </div>
            <div class="best-item">
                <img src="/images/noname.jpg" alt="webtoon">
                <a href="#">작품 이름 3</a>
                <div class="author"><a href="#">작가 이름</a></div>
                <div class="views">👁 3456</div>
            </div>
        </div>
    </section>

    <!-- 전체 베스트 -->
    <section class="all-best">
        <div class="best-header">
        <h2>${weekend} 전체 베스트</h2>
        <div class="filters">
            <span onclick="getupdate()">업데이트순</span>
            <a href="#">인기순</a>
            </div>
        </div>
        <div class="best-grid">
            <c:forEach items="${week}" var="week">
                <div class="grid-item">
                    <a href="#">
                        <img src="/images/noname.jpg" alt="작품 이미지">
                    </a>
                    <div class="content">
                        <p class="title"><a href="#">작품 제목 ${week.subject}</a></p>
                        <p class="author"><a href="#">작가 이름 ${week.userid}</a></p>
                        <p class="views">👁${week.readcountF+week.readcountM+week.readcountN}</p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>
</div>

<%@ include file="../footer.jsp" %>
