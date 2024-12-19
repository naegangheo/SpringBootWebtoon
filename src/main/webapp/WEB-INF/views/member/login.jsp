<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <link href="css/member/login.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>

<form method="POST" action="login" class="login-form" id="loginForm">
    <div class="main-container">
        <div class="container">
            <h2>로그인</h2>
            <div class="form-group">
                <label for="id">아이디</label>
                <input type="text" name="userid" id="id" placeholder="아이디 입력">
                <div id="idError" class="error-message"></div>
            </div>
            <div class="form-group">
                <label for="password">비밀번호</label>
                <input type="password" name="pwd" id="password" placeholder="비밀번호 입력">
                <div id="passwordError" class="error-message"></div>
                <div id="errorMessage" class="error-message" style="margin: 10px 0 10px 0; color: red"></div>
            </div>

            <button type="button" class="btn-submit" id="loginButton">입력 완료</button>
        </div>
        <div class="bottom">
            <div class="bottom-group"><a href="agree">회원가입</a></div>
            <div class="bottom-group">|</div>
            <div class="bottom-group"><a href="#">고객센터</a></div>
        </div>
        <div class="footer"><img src="images/member/ad_pet.png" alt="광고"></div>
        <div class="footer">Copyright © NAVER Corp. All Rights Reserved.</div>
    </div>
</form>

<script>
    $(document).ready(function () {
        // 로그인 버튼 클릭 이벤트
        $('#loginButton').click(function () {
            // 에러 메시지 초기화
            $('#errorMessage').text('');

            const userid = $('#id').val().trim();
            const password = $('#password').val().trim();
            let valid = true;

            if (!userid) {
                $('#errorMessage').text('아이디를 입력해주세요.');
                valid = false;
            } else if (!password) {
                $('#errorMessage').text('비밀번호를 입력해주세요.');
                valid = false;
            }

            if (valid) {
                // 유효성 검사를 통과한 경우 AJAX 요청
                $.ajax({
                    url: '/login', // 서버 로그인 엔드포인트
                    type: 'POST',
                    data: {
                        userid: userid,
                        pwd: password
                    },
                    success: function (response) {
                        if (response.success) {
                            // 로그인 성공 시
                            window.location.href = response.redirectUrl; // 리다이렉트
                        } else {
                            // 로그인 실패 시 에러 메시지를 비밀번호 위에 표시
                            $('#errorMessage').text(response.message);
                        }
                    },
                    error: function () {
                        $('#errorMessage').text('로그인 요청 중 문제가 발생했습니다.');
                    }
                });
            }
        });

        // Enter 키를 눌렀을 때 로그인 버튼 클릭
        $('#loginForm').on('keypress', function (e) {
            if (e.which === 13) { // Enter 키의 keyCode는 13
                $('#loginButton').click(); // 로그인 버튼 클릭 이벤트 호출
                e.preventDefault(); // 기본 Enter 동작(폼 제출 방지)
            }
        });
    });
</script>



</body>
</html>
