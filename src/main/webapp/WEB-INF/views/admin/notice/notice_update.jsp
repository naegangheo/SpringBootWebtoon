<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Notice Insert Form</title>
    <script src="/script/jquery-3.7.1.min.js"></script>
    <script src="/admin/script/admin.js"></script>
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

    <form action="adminNoticeUpdate" method="post" >
        <input type="hidden" name="nseq" value="${nvo.nseq}"/>
        <div class="info">

            <div class="subject">
                <div class="sub">adminid</div>
                <div>
                    <input type="text" id="adminid" name="adminid" value="${nvo.adminid}" maxlength="30" readonly/>
                </div>
            </div>

            <div class="subject">
                <div class="sub">비밀번호</div>
                <div>
                    <input type="password" id="pwd" name="pwd" maxlength="30" />
                </div>
            </div>
            <div class="subject">
                <div class="sub">공지사항 제목</div>
                <div>
                    <input type="text" id="subject" name="subject" value="${nvo.subject}" maxlength="30" />
                </div>
            </div>
            <div class="content">
                <div class="sub">내용</div>
                <div>
                    <textarea id="content" name="content" maxlength="400" rows="5"></textarea>
                </div>
            </div>
            <div>${message}</div>
            <div class="bottom_button">
                <button type="submit">수정</button>
                <button type="button" value="돌아가기" onclick="location.href='/adminNoticelist'">돌아가기</button>
            </div>
            <br/>
        </div>
    </form>
</div>
</body>
</html>