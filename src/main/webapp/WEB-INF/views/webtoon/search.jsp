<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Search Results</title>
    <style>
        /*div, ul, li { border: 1px dashed grey;}*/
       /*광고영역*/
        .ad-item {
            width: 300px;
            height: 250px;
            margin: 10px auto;
        }
        /* 공지사항 영역 */
        .notice-header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ebebeb;
        }
        .notice-list {
            list-style: none;
            padding: 0;
            margin: 0;
            display: flex;
            flex-direction: column;
            row-gap: 5px;
            text-align: left;
        }
        .notice-list ul {
            padding-left: 15px;
            margin: 0;
        }
        .notice-list li {
            list-style: none;
            margin: 2px;
            padding: 0; /* li 태그의 패딩 제거 */
            font-size: 15px;
        }

        /* 공통 스타일 */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            justify-content: center;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        a {
            text-decoration: none;
            color: inherit;
            transition: text-decoration-color 0.3s ease;
        }

        a:hover {
            text-decoration: underline;
            text-decoration-color: black;
        }

        /* 컨테이너 스타일 */
        .container {
            display: flex;
            justify-content: center;
            width: 100%;
        }

        .content-wrap {
            display: flex;
            justify-content: space-between;
            width: 1190px;
            max-width: 100%;
        }

        /* 검색 결과 영역 */
        .search-container {
            width: 840px;
            background-color: #fff;
            padding: 0;
        }

        .search-content-top {
            display: flex;
            align-items: center;
            font-size: 20px;
            font-weight: 600;
            height: 50px;
            margin-top: 20px;
        }

        .search-content-head {
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 50px;
            margin-bottom: 5px;
            border-bottom: 1px solid #ebebeb;
        }

        .search-results {
            list-style: none;
            padding: 0;
            display: flex;
            flex-direction: column;
            row-gap: 20px;
            margin-top: 20px;
        }

        .result-item {
            display: flex;
            align-items: flex-start;
            background-color: #fff;
            column-gap: 16px;
        }

        .thumbnail {
            width: 120px;
            height: 156px;
            overflow: hidden;
            border-radius: 5px;
            border: 1px solid #eee;
        }

        .thumbnail img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.5s ease;
        }

        .thumbnail img:hover {
            transform: scale(1.05);
        }

        .result-info {
            flex: 1;
            width: 704px;
        }

        .result-info h3 {
            margin: 10px 0 0 0;
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .result-info .horizontal-info {
            display: flex;
            align-items: center;
            gap: 0px;
            margin: 0 0 0px;
            color: #666;
            font-size: 14px;
            height: 30px;
        }

        .p-second{
            font-size: 14px;
            margin: 0 auto;
        }

        .tags span {
            display: inline-block;
            margin-right: 8px;
            padding: 4px 8px;
            background-color: #e0f7fa;
            color: #00796b;
            border-radius: 4px;
            font-size: 12px;
        }

        /* 사이드바 영역 */
        .aside-container {
            width: 300px;
            display: flex;
            flex-direction: column;
            gap: 10px;
            text-align: center;
        }

        .aside-box {
            width: 300px;
        }

        .aside-title {
            margin-bottom: 20px;
            font-size: 18px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 10px;
            border-bottom: 1px solid #ebebeb;
            font-weight: bold;
        }

        .aside-item {
            display: flex;
            column-gap: 12px;
            align-items: center;
            padding: 5px 0;
        }

        .aside-item img {
            width: 60px;
            height: 65px;
            object-fit: cover;
        }

        .aside-item-rank {
            display: flex;
            justify-content: center;
            align-items: center;
            width: 25px;
            font-size: 16px;
            font-weight: bold; /* 굵은 글씨 */
            color: #333; /* 글자 색상 */
        }

        .aside-item-info {
            display: flex;
            flex-direction: column;
            align-items: flex-start;
            width: 115px;
        }

        #rank {
            display: flex;
            flex-direction: column;
            /*padding: 5px;*/
            margin: 0;
        }

        #rank_list {
            display: flex;
            /*padding: 5px;*/
            justify-content: flex-start;
            align-items: center;
            transition: transform 0.3s ease;
            /*margin-bottom: 10px;*/
        }

        #rank_list div {
            /*padding: 5px;*/
            display: flex;
            justify-content: space-between;
            align-items: center;
        }


    </style>
<body>
    <div class="container">
    <div class="content-wrap">
        <div class="search-container">
            <div class="search-content-top">
                <h2><span style="color:#00dc64;">'${keyword}'</span> 에 대한 검색결과입니다.</h2>
            </div>
            <div class="search-content-head">
                <span>웹툰 총 ${resultCount}개</span>
            </div>
            <div class="search-content-bottom">
                <c:if test="${not empty searchResults}">
                    <ul class="search-results">
                        <c:forEach var="result" items="${searchResults}">
                            <li class="result-item">
                                <div class="thumbnail">
                                    <a href="webtoon_view?wseq=${result.wseq}">
                                        <img src="images/webtoon/webtoon_images/title_img/${result.image}" alt="${result.subject}">
                                    </a>
                                </div>
                                <div class="result-info">
                                    <h3><a href="webtoon_view?wseq=${result.wseq}">${result.subject}</a></h3>
                                    <div class="horizontal-info">
                                        <p>작가: ${result.userid}</p>
                                        <p>ㅣ</p>
                                        <p>최종 업데이트: ${result.indate.toString().split(' ')[0]}</p>
                                    </div>
                                    <p class="p-second">${result.content}</p>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </c:if>
                <c:if test="${empty searchResults}">
                    <p>No results found for '<span style="color:#00dc64;">${keyword}</span>'.</p>
                </c:if>
            </div>
        </div>

        <div class="aside-container">
            <%--광고--%>
            <div class="ad-item" id="ad-container">
                <iframe
                        src="adPage"
                        width="300"
                        height="250"
                        frameborder="0"
                        sandbox="allow-scripts allow-same-origin allow-popups">
                </iframe>
            </div>

            <div class="aside-box">
                <div class="aside-title">
                    <div>실시간 인기웹툰</div>
                    <div style="font-size: 13px; font-weight: normal;">
                        <!-- 성별 버튼 -->
                        <a href="#" class="gender_button" data-gender="T">전체</a>
                        <a href="#" class="gender_button" data-gender="F">여성</a>
                        <a href="#" class="gender_button" data-gender="M">남성</a>
                    </div>
                </div>
                <!-- AJAX 데이터가 채워질 영역 -->
                <div id="rank"></div>
            </div>

            <div class="aside-box">
                <div class="aside-title">실시간 신작</div>
                <c:forEach begin="0" end="4" items="${last}" var="wvo" varStatus="status">
                    <a href="webtoon_view?wseq=${wvo.wseq}" style="display: block;">
                        <div class="aside-item">
                            <div class="aside-item-rank">${status.index + 1}</div>
                            <img src="/images/webtoon/webtoon_images/title_img/${wvo.image}" alt="${wvo.subject} 이미지">
                            <div class="aside-item-info">
                                <div>${wvo.subject}</div>
                            </div>
                        </div>
                    </a>
                </c:forEach>
            </div>


            <div class="aside-box">
                <div class="notice-header">
                    <div>공지사항</div>
                    <div><a href="notice">더보기 ＞</a></div>
                </div>
                <div class="notice-list">
                    <ul>
                        <c:forEach items="${noticeList}" var="noticeVO" begin="0" end="7">
                            <li><a href="/notice?nseq=${noticeVO.nseq}">${noticeVO.subject}</a></li>
                        </c:forEach>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</div>


<%@ include file="../footer.jsp" %>

<script>
    // iframe 클릭 시 새 창에서 열기
    document.querySelector("#ad-container").addEventListener("click", function () {
        window.open("adPage", "_blank"); // 새 창에서 광고 페이지 열기
    });
</script>