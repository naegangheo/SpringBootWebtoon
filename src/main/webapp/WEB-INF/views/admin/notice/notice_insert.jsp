<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Notice Insert Form</title>
    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="/script/admin.js"></script>
    <link rel="stylesheet" href="/css/mypage/webtoon_insert.css">
</head>
<body>

<div class="header">
    <div class="logo">
        <a href="#">
            <img src="images/mypage/insertwebtoonlogo.png" alt="logo"/>
        </a>
    </div>
</div>

<div class="container">
    <h2>Notice Write Form</h2>

    <form action="adminNoticeWrite" method="post" >
        <div class="info">

            <div class="subject">
                <div class="sub">adminid</div>
                <div>
                    <input type="text" id="adminid" name="adminid" placeholder="관리자아이디 입력해주세요" maxlength="30" />
                </div>
            </div>

            <div class="subject">
                <div class="sub">비밀번호</div>
                <div>
                    <input type="password" id="pwd" name="pwd" placeholder="비밀번호를 입력해주세요" maxlength="30" />
                </div>
            </div>
            <div class="subject">
                <div class="sub">공지사항 제목</div>
                <div>
                    <input type="text" id="subject" name="subject" placeholder="공지사항 제목을 입력해주세요" maxlength="30" />
                </div>
            </div>
            <div class="content">
                <div class="sub">내용</div>
                <div>
                    <textarea id="content" name="content" placeholder="공자시항 내용을 입력해주세요" maxlength="400" rows="5"></textarea>
                </div>
            </div>
            <div>${message}</div>
            <div class="bottom_button">
                <button type="submit">제출</button>
                <button type="button" value="돌아가기" onclick="location.href='adminNoticelist'">돌아가기</button>
            </div>
            <br/>
        </div>
    </form>
</div>
</body>
</html>