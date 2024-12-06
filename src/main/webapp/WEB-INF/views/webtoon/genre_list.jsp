<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" type="text/css" href="css/best.css" />

<div class="main-container">
    <!-- 오늘의 인기 베스트도전 -->
    <section class="today-best">
        <h2>${messageG} 베스트</h2>

        <div class="best-wrapper">
            <c:forEach items="${genreList}" var="wvo">
                <div class="best-item">
                    <a href="genreBest?wseq=${wvo.wseq}">
                        <img src="/images/noname.jpg"/>
                    </a>
                    <a href="genreBest?wseq=${wvo.wseq}">
                        ${subject}
                    </a>
                    <div class="author">
                        <a href="genreBest?wseq=${wvo.wseq}">
                            ${userid}
                        </a>
                    </div>
                    <div class="views">
                        👁 ${wvo.readcountM+wvo.readcountF+wvo.readcountN}
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>

    <!-- 전체 베스트 -->
    <section class="all-best">
        <div class="best-header">
        <h2>전체 베스트</h2>
        <div class="filters">
            <a href="#">업데이트순 </a>
            <a href="#">인기순</a>
            <a href="#">별점순</a>
            </div>
        </div>
        <div class="best-grid">
            <c:forEach begin="1" end="30" var="index">
                <div class="grid-item">
                    <a href="webtoon_view?wseq="+wseq>
                        <img src="/images/noname.jpg" alt="작품 이미지">
                    </a>
                    <div class="content">
                        <p class="title">
                            <a href="webtoon_view?wseq="+wseq>
                                작품 제목 ${index}
                            </a>
                        </p>
                        <p class="author">
                            <a href="webtoon_view?wseq="+wseq>
                                작가 이름 ${index}
                            </a>
                        </p>
                        <p class="views">
                            👁 ${index * 100}
                        </p>
                    </div>
                </div>
            </c:forEach>
        </div>
    </section>
</div>

<%@ include file="../footer.jsp" %>
