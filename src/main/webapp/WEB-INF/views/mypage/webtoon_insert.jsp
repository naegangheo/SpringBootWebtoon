<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>${pageTitle != null ? pageTitle : "Default Title"}</title>
    <link rel="stylesheet" href="/css/mypage/webtoon_insert.css">
    <script src="/script/jquery-3.7.1.min.js"></script>
</head>
<body>
<div class="header">
    <div class="logo">
        <a href="/">
            <img src="/images/mypage/insertwebtoonlogo.png" alt="Logo">
        </a>
    </div>
    <div class="id">
        <img src="/images/mypage/1.png" alt="User Icon">
        <label>
            <c:choose>
                <c:when test="${not empty loggedInUser}">
                    ${loggedInUser.name}님
                </c:when>
                <c:otherwise>
                    <a href="/login">로그인</a>
                </c:otherwise>
            </c:choose>
        </label>
    </div>
</div>

<div class="container">
    <div>
        <h2>${sectionTitle != null ? sectionTitle : "신규 작품 등록"}</h2>
    </div>
    <div class="rule">
        <br/>
        <div><label>운영원칙</label></div>
        <div>
            저작권 등 다른 사람의 권리를 침해하거나 명예를 훼손하는 게시물은 이용약관 및 관련 법률에 의해 제재를 받으실 수 있습니다.
            성인물, 폭력물 등의 게시물은 통보 없이 삭제될 수 있습니다
        </div>
        <div class="ruleradio">
            <input type="radio" id="rule" name="rule" required>
            <label>동의합니다</label>
        </div>
        <br/>
    </div>
    <br/>

    <div class="info">
        <div class="subject">
            <div class="sub">작품명</div>
            <div>
                <input type="text" id="title" name="title" placeholder="작품명을 입력해 주세요." maxlength="30" required>
            </div>
        </div>
        <br/>
        <div class="tag">
            <div class="sub">장르</div>
            <div class="genre">
                <c:forEach items="${genreList}" var="genre">
                    <div class="genreradio">
                        <input type="radio" id="genre${genre.id}" name="genre" value="${genre.id}"
                            ${genre.default ? "checked" : ""}>
                        <label>${genre.name}</label>
                    </div>
                </c:forEach>
            </div>
        </div>
        <br/>
        <div class="content">
            <div class="sub">내용</div>
            <div>
                <textarea id="content" name="content" placeholder="작품의 줄거리를 작성해 주세요." maxlength="400" rows="5" required></textarea>
            </div>
        </div>
    </div>

    <div class="images">
        <div class="imginsert">
            <div class="sub"><label>이미지</label></div>
            <div><input type="file" id="mainImage" name="mainImage" accept="image/*"></div>
            <div><input type="file" id="webtoonImage" name="webtoonImage" accept="image/*"></div>
        </div>
        <br>
        <div class="imgpreview">
            <div class="sub"><label>이미지 미리보기</label></div>
            <div>
                <img id="previewMainImage" src="#" alt="미리보기" style="display: none;">
            </div>
            <div>
                <img id="previewWebtoonImage" src="#" alt="미리보기" style="display: none;">
            </div>
        </div>
    </div>
    <br/>

    <div class="bottom_button">
        <button type="submit">제출</button>
        <button type="button" onclick="history.back()">돌아가기</button>
    </div>
    <br/>
</div>

<script>
    // 이미지 미리보기 스크립트
    document.getElementById('mainImage').addEventListener('change', function(event) {
        const file = event.target.files[0];
        const preview = document.getElementById('previewMainImage');
        if (file) {
            preview.src = URL.createObjectURL(file);
            preview.style.display = 'block';
        } else {
            preview.style.display = 'none';
        }
    });

    document.getElementById('webtoonImage').addEventListener('change', function(event) {
        const file = event.target.files[0];
        const preview = document.getElementById('previewWebtoonImage');
        if (file) {
            preview.src = URL.createObjectURL(file);
            preview.style.display = 'block';
        } else {
            preview.style.display = 'none';
        }
    });
</script>
</body>
</html>
