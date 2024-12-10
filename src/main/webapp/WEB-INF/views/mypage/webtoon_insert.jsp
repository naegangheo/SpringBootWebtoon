<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>CREATE</title>
    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="/script/mypage.js"></script>

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
        <h2>신규 작품 등록</h2>

    <div class="rule">
        <label>운영원칙</label>
        <p>저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련 법률에 의해 제재를 받으실 수 있습니다.
            성인물, 폭력물 등의 게시물은 통보 없이 삭제될 수 있습니다</p>
        <label><input type="checkbox" id="ruleAgree" required> 운영 원칙에 동의합니다.</label>
    </div>



    <form action="/webtoon/save" method="post" enctype="multipart/form-data">
    <div class="info">
        <div class="subject">
            <div class="sub">작품명</div>
            <div><input type="text" id="title" name="title" placeholder="작품명을 입력해 주세요." maxlength="30" required> </div>
        </div>

        <div class="genre">
            <div class="sub">장르</div>
            <label><input type="radio" name="genre" value="1" checked> 로맨스</label>
            <label><input type="radio" name="genre" value="2"> 판타지</label>
            <label><input type="radio" name="genre" value="3"> 액션</label>
            <label><input type="radio" name="genre" value="4"> 일상</label>
            <label><input type="radio" name="genre" value="5"> 스릴러</label>
        </div>

        <div class="content">
            <div class="sub">내용</div>
            <div>
                <textarea id="content" name="content" placeholder="작품의 줄거리를 작성해 주세요." maxlength="400" rows="5"  required></textarea>
            </div>
        </div>

        <div class="images">
            <!-- 이미지 업로드 영역 -->
            <div class="imgInsert">
                <!-- 대표 이미지 -->
                <div class="sub">대표 이미지</div>
                <label>
                    <input type="file" id="mainImageFile" name="mainImage" style="display: none;" onchange="previewImage(event, 'mainImagePreview')">
                    <button type="button" onclick="document.getElementById('mainImageFile').click()">대표 이미지 선택</button>
                </label>

                <!-- 웹툰 이미지 -->
                <div class="sub">웹툰 이미지</div>
                <label>
                    <input type="file" id="contentImageFile" name="contentImage" style="display: none;" onchange="previewImage(event, 'contentImagePreview')">
                    <button type="button" onclick="document.getElementById('contentImageFile').click()">웹툰 이미지 선택</button>
                </label>
            </div>

            <!-- 이미지 미리보기 영역 -->
            <div class="imgPreview">
                <div class="sub">이미지 미리보기</div>
                <img id="mainImagePreview" src="" alt="대표 이미지 미리보기" style="display: none; width: 150px; height: 150px;">
                <img id="contentImagePreview" src="" alt="웹툰 이미지 미리보기" style="display: none; width: 150px; height: 150px;">
            </div>
        </div>


    <div class="bottom_button">
        <button type="submit">제출</button>
        <button type="button" value="돌아가기" onclick="location.href='/'">돌아가기</button>
    </div>
    <br/>

    </div>
</form>


</div>
</body>
</html>