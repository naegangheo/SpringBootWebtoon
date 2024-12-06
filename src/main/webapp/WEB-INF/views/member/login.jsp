<!--<%@ page contentType="text/html;charset=UTF-8" language="java" %>-->
<html>
<head>
    <title>Title</title>
</head>
<link href="css/member/login.css" rel="stylesheet">
    <style>
    body {
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f8f9fa;

}
.main-container {
    width: 600px;
    display: block;
    margin-left: auto;
    margin-right: auto;
}
.container {
    width: 500px;
    margin: 50px 50px 10px 50px;
    background: white;
    padding: 20px;
    border-radius: 8px;
    box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
    text-align: center;
}
h2 {
    font-size: 20px;
    margin-bottom: 20px;
    color: #2db400;
}
.form-group {
    margin-bottom: 15px;
    text-align: left;
}
.form-group label {
    display: block;
    font-size: 14px;
    margin-bottom: 5px;
}
.form-group input {
    width: 100%;
    padding: 10px;
    font-size: 14px;
    border: 1px solid #ccc;
    border-radius: 4px;
}
.form-group input:focus {
    border-color: #2db400;
    outline: none;
}
.btn-submit {
    display: block;
    width: 100%;
    padding: 10px;
    background-color: #2db400;
    color: white;
    border: none;
    border-radius: 4px;
    font-size: 16px;
    cursor: pointer;
}
.btn-submit:hover {
    background-color: #249a00;
}
.bottom,
.footer
{
    width: 540px;
    margin: 10px 50px 10px 50px;
    color: #757575;
    text-align: center;
}
.bottom-group{
    display: inline-block;
    margin-left: 10px;
    font-size: 14px;
}
a {
    text-decoration: none;
    color: inherit;
}
.footer {
    font-size: 12px;
    margin-top: 50px;
}

h2 {
    font-size: 45px;
}
.form-group {
    margin: 50px 0px 50px 0px;
}
.footer {
    margin-top: 50px;
}
    </style>
<body>
    <form method="POST" action="login">
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
            <div class="footer"><img src="images/member/ad_pet.png" style="width: 540"></div>
            <div class="footer">Copyright © NAVER Corp. All Rights Reserved.</div>
        </div>
<%--        <div>${message}</div>--%>
    </form>
</body>
</html>
