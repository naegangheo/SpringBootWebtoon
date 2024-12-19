<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>CREATE</title>
    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
    <script src="/script/mypage.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>


</head>
<link rel="stylesheet" href="/css/mypage/webtoon_insert.css">
<body>
<div class="header">
    <div class="logo">
        <a href="/">
        <img src="images/mypage/insertwebtoonlogo.png" alt="logo"/>
        </a>
    </div>
    <div class="id">
        <img src="images/mypage/1.png" alt="UserIcon"/>
        <label>
            <c:choose>
                <c:when test="${not empty loginUser}">
                    ${loginUser.name}님
                </c:when>
                <c:otherwise>
                    <a href="/login">로그인</a>
                </c:otherwise>
            </c:choose>
        </label>
    </div>
</div>

<div class="container">

    <form method="POST" action="insertWebtoon" enctype="multipart/form-data" onsubmit="return validateForm()" novalidate>
        <h2><c:out value="${createTitle != null ? createTitle : '신규 작품 등록'}" /></h2>
    <div class="rule">
        <label>운영원칙</label>
        <p>저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련 법률에 의해 제재를 받으실 수 있습니다.
            성인물, 폭력물 등의 게시물은 통보 없이 삭제될 수 있습니다</p>
        <label><input type="checkbox" id="ruleAgree" required> 운영 원칙에 동의합니다.</label>
    </div>
    <div class="info">
        <div class="subject">
            <div class="sub">작품명</div>
            <div class="text-container">
                <input type="text" id="subject" name="subject" value="${webtoon.subject}"
                       placeholder="작품명을 입력해 주세요." maxlength="30" required
                        oninput="updateCounter('subject', 'subjectCounter')">
                <div class="maxlength-counter" id="subjectCounter">0/30</div>
            </div>
        </div>

        <div class="genre">
            <div class="sub">장르</div>
            <label><input type="radio" name="genre" value="2" <c:if test="${webtoon.genre == 2}">checked</c:if>> 로맨스</label>
            <label><input type="radio" name="genre" value="3" <c:if test="${webtoon.genre == 3}">checked</c:if>> 판타지</label>
            <label><input type="radio" name="genre" value="4" <c:if test="${webtoon.genre == 4}">checked</c:if>> 액션</label>
            <label><input type="radio" name="genre" value="5" <c:if test="${webtoon.genre == 5}">checked</c:if>> 일상</label>
            <label><input type="radio" name="genre" value="6" <c:if test="${webtoon.genre == 6}">checked</c:if>> 스릴러</label>
        </div>

        <div class="week">
            <div class="sub">요일</div>
            <label><input type="radio" name="week" value="1" <c:if test="${webtoon.week == 1}">checked</c:if>> 월</label>
            <label><input type="radio" name="week" value="2" <c:if test="${webtoon.week == 2}">checked</c:if>> 화</label>
            <label><input type="radio" name="week" value="3" <c:if test="${webtoon.week == 3}">checked</c:if>> 수</label>
            <label><input type="radio" name="week" value="4" <c:if test="${webtoon.week == 4}">checked</c:if>> 목</label>
            <label><input type="radio" name="week" value="5" <c:if test="${webtoon.week == 5}">checked</c:if>> 금</label>
            <label><input type="radio" name="week" value="6" <c:if test="${webtoon.week == 6}">checked</c:if>> 토</label>
            <label><input type="radio" name="week" value="7" <c:if test="${webtoon.week == 7}">checked</c:if>> 일</label>
        </div>
    </div>

        <div class="content">
            <div class="sub">내용</div>
            <div class="text-container">
                <textarea id="content" name="content" placeholder="작품의 줄거리를 작성해 주세요."
                          maxlength="400" rows="5"  required
                          oninput="updateCounter('content', 'contentCounter')">${webtoon.content}</textarea>
                <div class="maxlength-counter" id="contentCounter">0/400</div>
            </div>
        </div>
    </form>

    <form method="POST" action="uploadFile" enctype="multipart/form-data">
            <div class="images">
                <!-- 대표 이미지 -->
                <div class="sub">대표 이미지</div>
                <label>
                    <input type="file" id="mainImage" name="mainImage" style ="display: none;" onchange="previewImage(event, 'mainImagePreview')">
                    <button type="button" onclick="triggerFileInput('mainImage')">대표 이미지 선택</button>
                </label>
                <!-- 웹툰 이미지 -->
                <div class="sub">웹툰 이미지</div>
                <label>
                    <input type="file" id="contentImage" name="contentImage" style="display: none;" onchange="previewImage(event, 'contentImagePreview')">
                    <button type="button" onclick="triggerFileInput('contentImage')">웹툰 이미지 선택</button>
                </label>
            </div>
            <!-- 이미지 미리보기 -->
            <div class="imgPreview">
                <div class="sub">이미지 미리보기</div>
                <c:if test="${not empty webtoon.savefilename}">
                    <img id="mainImagePreview" src="/images/mainImages/${webtoon.savefilename}" alt="대표 이미지 미리보기" style="width: 150px; height: 150px; display: inline;">
                </c:if>
                <c:if test="${empty webtoon.savefilename}">
                    <img id="mainImagePreview" src="" alt="대표 이미지 미리보기" style="width: 150px; height: 150px; display: none;">
                </c:if>
                <c:if test="${not empty webtoon.savefilename2}">
                    <img id="contentImagePreview" src="/images/contentImages/${webtoon.savefilename2}" alt="웹툰 이미지 미리보기" style="width: 150px; height: 150px; display: inline;">
                </c:if>
                <c:if test="${empty webtoon.savefilename2}">
                    <img id="contentImagePreview" src="" alt="웹툰 이미지 미리보기" style="width: 150px; height: 150px; display: none;">
                </c:if>
            </div>
                <div class="bottom_button">
                    <button type="submit">웹툰 저장</button>
                    <button type="button" value="돌아가기" onclick="location.href='/'">돌아가기</button>
                </div>
        </form>
    </div>
</body>
</html>