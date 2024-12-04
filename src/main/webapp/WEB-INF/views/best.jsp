<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/best.css" />
<script src="js/jquery-3.7.1.min.js"></script>
<script src="js/header.js"></script>

<div class="main-container">
    <!-- 오늘의 베스트 웹툰 -->
    <section class="today-best">
        <h2>오늘의 베스트 웹툰</h2>
        <!-- 기존 코드는 유지 -->
    </section>

    <!-- 전체 베스트 -->
    <section class="all-best">
        <h2>전체 베스트</h2>
        <div class="filters">
            <a href="#">업데이트순</a>
            <a href="#">인기순</a>
            <a href="#">별점순</a>
        </div>
        <div class="best-grid">
            <!-- 30개의 콘텐츠 생성 -->
            <c:forEach begin="1" end="30" var="index">
                <div class="grid-item">
                    <a href="#">
                        <img src="/images/noname.jpg" alt="Default Image" style="width: 100px; height: 100px">
                    </a>
                    <p class="title"><a href="#">작품 제목 ${index}</a></p>
                    <p class="author">작가 이름 ${index}</p>
                    <p class="views">👁 조회수 ${index * 100}</p>
                </div>
                <c:if test="${index % 3 == 0}">
                    <div class="row-separator"></div> <!-- 3개의 항목마다 줄바꿈 -->
                </c:if>
            </c:forEach>
        </div>
    </section>
</div>

<%@ include file="footer.jsp" %>
