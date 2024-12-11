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
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            display: flex;
            justify-content: center;
        }
        /*div{ border: solid 1px black}*/

        .container {
            display: flex;
            justify-content: center;
            width: 100%;
        }

        .content-wrap {
            display: flex;
            justify-content: space-between; /* 양쪽 끝에 요소 배치 */
            width: 1190px; /* 고정 너비 */
            max-width: 100%; /* 화면이 작아질 때 반응형 */
        }

        .search-container {
            width: 840px;
            margin: 0 auto;
            background-color: #fff;
            padding: 20px;
            /*border-radius: 8px;*/
            /*box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);*/
            text-align: left;
        }

        .search-content-top {   }
        .search-content-bottom {    }
        .aside-wrap {
            width: 300px; /* 오른쪽 영역의 고정 너비 */
            margin: 0;
            display: flex;
            flex-direction: column;
            gap: 10px; /* 항목 간의 간격 */
            text-align: center;
        }

        h2 {
            font-size: 24px;
            margin-bottom: 20px;
        }

        /* 검색 결과 리스트 */
        .search-results {
            list-style: none;
            margin: 0;
            padding: 0;
            display: flex;
            flex-direction: column;
            gap: 16px;
        }

        .result-item {
            display: flex;
            align-items: flex-start;
            background-color: #fff;
            padding: 16px;
            /*
            border-radius: 8px;
            border: 1px solid #ddd;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            */
        }

        .result-item img {
            width: 100px;
            height: 100px;
            border-radius: 8px;
            margin-right: 16px;
            object-fit: cover;
            border: 1px solid #eee;
        }

        .result-info {
            flex: 1;
        }

        .result-info h3 {
            margin: 0 0 8px;
            font-size: 18px;
            font-weight: bold;
            color: #333;
        }

        .result-info p {
            margin: 0 0 8px;
            color: #666;
            font-size: 14px;
            display: inline-block;
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

    </style>
</head>
<body>

<div class="container">
    <div class="content-wrap">
        <div class="search-container">
            <div class="search-content-top">
                <!-- 동적 검색 키워드 강조 -->
                <h1 style="border-bottom: #5a6174">
                    <span style="color:#00dc64;">'${keyword}'</span> 에 대한 검색결과입니다.
                </h1>
            </div>

            <div class="search-content-bottom">
                <!-- 검색 결과가 있을 경우 -->
                <c:if test="${not empty searchResults}">
                    <ul class="search-results">
                        <!-- 검색 결과를 반복하여 출력 -->
                        <c:forEach var="result" items="${searchResults}">
                            <li class="result-item">
                                <!-- 썸네일 -->
                                <img src="images/webtoon/webtoon_images/title_img/${result.image}" alt="${result.subject}">
                                <!-- 웹툰 정보 -->
                                <div class="result-info">
                                    <h3>${result.subject}</h3>
                                    <p>작가: ${result.userid}</p>
                                    <p>ㅣ</p>
                                    <p>최종 업데이트: ${result.indate}</p><br>
                                    <p class="p-second">${result.content}</p>
                                </div>
                            </li>
                        </c:forEach>
                    </ul>
                </c:if>

                <!-- 검색 결과가 없을 경우 -->
                <c:if test="${empty searchResults}">
                    <p>No results found for '<span style="color:#00dc64;">${keyword}</span>'.</p>
                </c:if>
            </div>
        </div>

        <div class="aside-wrap">
            <div style="width: 300px; height: 250px; border: 1px dashed #eee;">광고?</div>
            <div style="width: 300px; height: 509px; border: 1px dashed #eee;">실시간 인기웹툰</div>
            <div style="width: 300px; height: 509px; border: 1px dashed #eee;">실시간 신작랭킹</div>
            <div style="width: 300px; height: 326px; border: 1px dashed #eee;">공지사항</div>
        </div>
    </div>
</div>

<%@ include file="../footer.jsp" %>