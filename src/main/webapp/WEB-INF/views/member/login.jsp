<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link href="css/member/login.css" rel="stylesheet">
</head>

<body>
    <form method="POST" action="login" class="login-form">
    <div class="main-container">
        <div class="container">
            <h2>로그인</h2>
            <div class="form-group">
                <label for="id">아이디</label>
                <input type="text" name="userid" id="id" placeholder="아이디 입력">
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" name="pwd" id="password" placeholder="비밀번호 입력">
            </div>
            <button type="submit" class="btn-submit">입력 완료</button>
        </div>
        <div class="bottom">
            <div class="bottom-group"><a href="agree">회원가입</a></div><div class="bottom-group">|</div><div class="bottom-group"><a href="#">고객센터</a></div>
        </div>
        <div class="footer"><img src="images/member/ad_pet.png"></div>
        <div class="footer">Copyright © NAVER Corp. All Rights Reserved.</div>
    </div>
    </form>
<!--<div>${message}</div>-->
</body>
</html>
