<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
    <link href="css/member/join.css" rel="stylesheet">
</head>
<body>
<div class="container">
    <h2>회원 가입</h2>
    <form action="member" method="POST">
        <div class="form-group">
            <label for="userid">아이디</label>
            <input type="text" name="userid" id="userid" placeholder="아이디 입력">
        </div>
        <div class="form-group">
            <label for="pwd">비밀번호</label>
            <input type="password" name="pwd" id="pwd" placeholder="비밀번호 입력">
        </div>
        <div class="form-group">
            <label for="email">이메일 주소</label>
            <input type="email" name="email" id="email" placeholder="이메일 입력">
        </div>
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" name="name" id="name" placeholder="이름 입력">
        </div>
        <div class="form-group">
            <label for="birth">생년월일</label>
            <input type="text" name="birth" id="birth" placeholder="생년월일 8자리 입력">
        </div>
        <div class="form-group">
            <label>성별</label>
            <div class="gender-group" style="width: 50% ">
                <div class="gender-item">
                    <div class="gender-label"><input type="radio" name="gender" id="male" value="m"></div><!--
                    --><div class="gender-label"><label for="male" class="gender-label">&nbsp;남자</label></div>
                </div>
                <div class="gender-item">
                    <div class="gender-label"><input type="radio" name="gender" id="female" value="f" class="gender-label"></div><!--
                    --><div class="gender-label"><label for="female" class="gender-label">&nbsp;여자</label></div>
                </div>
                <div class="gender-item">
                    <div class="gender-label"><input type="radio" name="gender" id="none" value="n" class="gender-label"></div><!--
                    --><div class="gender-label"><label for="none" class="gender-label">&nbsp;선택안함</label></div>
                </div>
            </div>
        </div>
        <%--        <div class="form-group">--%>
        <%--            <label for="country">국가</label>--%>
        <%--            <select id="country">--%>
        <%--                <option value="+82">대한민국 +82</option>--%>
        <%--                <option value="+1">미국 +1</option>--%>
        <%--                <option value="+81">일본 +81</option>--%>
        <%--            </select>--%>
        <%--        </div>--%>
        <div class="form-group">
            <label for="phone">휴대전화번호</label>
            <input type="tel" name="phone" id="phone" placeholder="전화번호 입력">
        </div>
        <button type="submit" class="btn-submit">입력 완료</button>
    </form>
</div>
</body>
</html>
