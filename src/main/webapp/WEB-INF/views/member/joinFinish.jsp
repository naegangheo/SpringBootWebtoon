<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>Title</title>
</head>
<link href="css/member/joinFinish.css" rel="stylesheet">

<body>
<div class="main-container">
    <div class="container">
        <h2>환영합니다!</h2>
        <div class="form-group">
            <p></p>회원가입을 축하합니다. <br>${loginUser.name}님의 새로운 아이디는 <span style="color: 2db400; font-weight:bold;">${loginUser.userid}</span>입니다.
        </div>
        <button type="button" class="btn-submit" onclick="location.href='/'">시작하기</button>
    </div>
    <div class="footer"><img src="/images/ad_pet.png" style="width: 540"></div>
    <div class="footer">Copyright © NAVER Corp. All Rights Reserved.</div>
    </div>
</body>
</html>
