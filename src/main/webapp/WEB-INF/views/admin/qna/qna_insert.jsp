<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Q&A Write Form</title>
    <script src="/script/jquery-3.7.1.min.js"></script>

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
        <h2>Q&A Write Form</h2>

    <form action="" method="post" >
        <div class="info">

            <div class="subject">
                <div class="sub">작성자</div>
                <div>
                    ${qnaVO.userid}
                </div>
            </div>

            <div class="content">
                <div class="sub">내용</div>
                <div>
                    <textarea id="content" name="content" placeholder="공자시항 내용을 입력해주세요" maxlength="400" rows="5"  required></textarea>
                </div>
            </div>

            <div class="bottom_button">
                <button type="submit">제출</button>
                <button type="button" value="돌아가기" onclick="history.go(-1)">돌아가기</button>
            </div>
            <br/>

        </div>
</form>


</div>
</body>
</html>