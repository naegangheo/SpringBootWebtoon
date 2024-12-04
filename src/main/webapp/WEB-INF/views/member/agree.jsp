<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>가입 약관</title>
    <link href="css/member/agree.css" rel="stylesheet">
  
</head>
<body>
    <div class="container">
        <h2>이용 약관 동의</h2>
        <form action="join" method="get">
            <div class="checkbox-group">
                <label>
                    <input type="checkbox" name="all" id="all">
                    전체 동의하기
                </label>
                <div class="detail">
<textarea>네이버 서비스 및 제품(이하 ‘서비스’)을 이용해 주셔서 감사합니다. 본 약관은 다양한 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버 주식회사(이하 ‘네이버’)와 이를 이용하는 네이버 서비스 회원(이하 ‘회원’) 또는 비회원과의 관계를 설명하며, 아울러 여러분의 네이버 서비스 이용에 도움이 될 수 있는 유익한 정보를 포함하고 있습니다.네이버 서비스를 이용하시거나 네이버 서비스 회원으로 가입하실 경우 여러분은 본 약관 및 관련 운영 정책을 확인하거나 동의하게 되므로, 잠시 시간을 내시어 주의 깊게 살펴봐 주시기 바랍니다.</textarea>
                </div>
            </div>
            <div class="checkbox-group">
                <label>
                    <input type="checkbox" name="terms" required>
                    [필수] 이용약관
                </label>
                <div class="detail">
                    <textarea>네이버 서비스 및 제품을 이용해 주셔서 감사합니다. 본 약관은 네이버 서비스의 이용과 관련하여 네이버 서비스를 제공하는 네이버와 회원 간의 관계를 설명하며...</textarea>
                </div>
            </div>
            <div class="checkbox-group">
                <label>
                    <input type="checkbox" name="privacy" required>
                    [필수] 개인정보 수집 및 이용
                </label>
                <div class="detail">
                    <textarea>개인정보보호법에 따라 네이버 회원가입 시 필요한 최소한의 개인정보를 수집합니다. </textarea>
                </div>
            </div>
            <div class="checkbox-group">
                <label>
                    <input type="checkbox" name="realname">
                    실명 인증된 아이디로 가입
                </label>
            </div>
            <div class="checkbox-group">
                <label>
                    <input type="checkbox" name="location">
                    위치기반서비스 이용약관
                </label>
            </div>
            <button type="submit" class="btn-next">다음</button>
        </form>
    </div>
</body>
</html>
