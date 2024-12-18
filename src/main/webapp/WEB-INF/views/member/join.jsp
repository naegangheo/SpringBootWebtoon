<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원 가입</title>
    <link href="css/member/join.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<div class="container">
    <h2>회원 가입</h2>
    <form action="member" method="POST">
        <div class="form-group">
            <label for="userid">아이디</label>
            <input type="text" name="userid" id="userid" placeholder="아이디 입력">
            <!-- 아이디 중복 확인 메시지 -->
            <div id="useridErrorMessage" class="error-message"></div>
        </div>
        <div class="form-group">
            <label for="pwd">비밀번호</label>
            <input type="password" name="pwd" id="pwd" placeholder="비밀번호 입력">
        </div>
        <div class="form-group">
            <label for="pwdConfirm">비밀번호 확인</label>
            <input type="password" name="pwdConfirm" id="pwdConfirm" placeholder="비밀번호 확인 입력">
            <div id="pwdErrorMessage" class="error-message"></div>
        </div>

        <div class="form-group">
            <label for="email">이메일 주소</label>
            <input type="email" name="email" id="email" placeholder="이메일 입력">
            <div id="emailErrorMessage" class="error-message"></div>
        </div>
        <div class="form-group">
            <label for="name">이름</label>
            <input type="text" name="name" id="name" placeholder="이름 입력">
            <div id="nameErrorMessage" class="error-message"></div>
        </div>
        <div class="form-group">
            <label for="birth">생년월일</label>
            <input type="text" name="birth" id="birth" placeholder="생년월일 6자리 입력 예)123456">
            <div id="birthErrorMessage" class="error-message"></div>
        </div>
        <div class="form-group">
            <label>성별</label>
            <div class="gender-group" style="width: 50%">
                <div class="gender-item">
                    <div class="gender-label"><input type="radio" name="gender" id="male" value="1"></div><!--
                    --><div class="gender-label"><label for="male" class="gender-label">&nbsp;남자</label></div>
                </div>
                <div class="gender-item">
                    <div class="gender-label"><input type="radio" name="gender" id="female" value="2" class="gender-label"></div><!--
                    --><div class="gender-label"><label for="female" class="gender-label">&nbsp;여자</label></div>
                </div>
                <div class="gender-item">
                    <div class="gender-label"><input type="radio" name="gender" id="none" value="3" class="gender-label"></div><!--
                    --><div class="gender-label"><label for="none" class="gender-label">&nbsp;선택안함</label></div>
                </div>
            </div>
            <div id="genderErrorMessage" class="error-message"></div>
        </div>
        <div class="form-group">
            <label for="phone">휴대전화번호</label>
            <input type="tel" name="phone" id="phone" placeholder="전화번호 입력">
            <div id="phoneErrorMessage" class="error-message"></div>
            <div id="formErrorMessage" class="error-message"></div>
        </div>
        <button type="button" class="btn-submit" id="joinButton">입력 완료</button>
    </form>
</div>
<script>
    $(document).ready(function() {
        let valid = true;

        // 아이디 중복 체크
        $('#userid').blur(function() {
            const userid = $(this).val().trim();

            if (!userid) {
                $('#useridErrorMessage').text('아이디를 입력해주세요.');
                valid = false;
                return;
            }

            // AJAX 요청으로 아이디 중복 체크
            $.ajax({
                url: '/member/checkUserid',
                type: 'GET',
                data: { userid: userid },
                success: function(response) {
                    if (!response.available) {
                        $('#useridErrorMessage').text('이미 사용중인 아이디입니다.');
                        valid = false;
                    } else {
                        $('#useridErrorMessage').text('');
                        valid = true;
                    }
                },
                error: function() {
                    $('#useridErrorMessage').text('아이디 중복 확인 중 문제가 발생했습니다.');
                    valid = false;
                }
            });
        });

        // 비밀번호 확인
        $('#pwdConfirm').blur(function() {
            const password = $('#pwd').val().trim();
            const passwordConfirm = $('#pwdConfirm').val().trim();

            if (password !== passwordConfirm) {
                $('#pwdErrorMessage').text('비밀번호가 일치하지 않습니다.');
                valid = false;
            } else {
                $('#pwdErrorMessage').text('');
                valid = true;
            }
        });

        $('#email').blur(function() {
            const email = $(this).val().trim();
            const emailRegex = /^[^\s@]+@[^\s@]+\.[^\s@]+$/; // 이메일 형식 정규식

            if (!email) {
                $('#emailErrorMessage').text('이메일을 입력해주세요.');
                valid = false;
            } else if (!emailRegex.test(email)) { // 이메일 형식이 올바르지 않을 때
                $('#emailErrorMessage').text('올바른 이메일 형식이 아닙니다.');
                valid = false;
            } else {
                $('#emailErrorMessage').text('');
                valid = true;
            }
        });

        // 이름 유효성 검사
        $('#name').blur(function() {
            const name = $(this).val().trim();
            if (!name) {
                $('#nameErrorMessage').text('이름을 입력해주세요.');
                valid = false;
            } else {
                $('#nameErrorMessage').text('');
                valid = true;
            }
        });

// 생년월일 유효성 검사
        $('#birth').blur(function() {
            const birth = $(this).val().trim();
            if (!birth || birth.length !== 6 || !/^\d+$/.test(birth)) {
                $('#birthErrorMessage').text('생년월일을 올바르게 입력해주세요 (6자리 숫자).');
                valid = false;
            } else {
                $('#birthErrorMessage').text('');
                valid = true;
            }
        });

// 전화번호 유효성 검사
        $('#phone').blur(function() {
            const phone = $(this).val().trim();
            if (!phone || !/^\d{10,11}$/.test(phone)) {
                $('#phoneErrorMessage').text('전화번호를 올바르게 입력해주세요.');
                valid = false;
            } else {
                $('#phoneErrorMessage').text('');
                valid = true;
            }
        });

        // 회원가입 요청
        $('#joinButton').click(function(event) {
            event.preventDefault();

            // 최종 유효성 확인
            const userid = $('#userid').val().trim();
            const password = $('#pwd').val().trim();
            const passwordConfirm = $('#pwdConfirm').val().trim();
            const email = $('#email').val().trim();
            const name = $('#name').val().trim();
            const birth = $('#birth').val().trim();
            const phone = $('#phone').val().trim();
            const gender = $('input[name="gender"]:checked').val();

            valid = true;

            // 아이디 확인
            if (!userid) {
                $('#useridErrorMessage').text('아이디를 입력해주세요.');
                valid = false;
            }

            // 비밀번호 확인
            if (!password || password !== passwordConfirm) {
                $('#pwdErrorMessage').text('비밀번호가 일치하지 않거나 비어 있습니다.');
                valid = false;
            }

            // 이메일 확인
            if (!email) {
                $('#emailErrorMessage').text('이메일을 입력해주세요.');
                valid = false;
            }

            // 생년월일 확인
            if (!birth || birth.length !== 6 || !/^\d+$/.test(birth)) {
                $('#birthErrorMessage').text('생년월일을 올바르게 입력해주세요.');
                valid = false;
            }

            // 성별 확인
            if (!gender) {
                $('#genderErrorMessage').text('성별을 선택해주세요.');
                valid = false;
            }

            // 전화번호 확인
            if (!phone || !/^\d{10,11}$/.test(phone)) {
                $('#phoneErrorMessage').text('전화번호를 올바르게 입력해주세요.');
                valid = false;
            }

            if (!valid) {
                $('#formErrorMessage').text('입력값을 확인해주세요.');
                return;
            } else {
                $('#formErrorMessage').text(''); // 유효할 경우 에러 메시지 초기화
            }

            // AJAX 요청
            $.ajax({
                url: '/member',
                type: 'POST',
                data: {
                    userid: userid,
                    pwd: password,
                    email: email,
                    name: name,
                    birth: birth,
                    gender: gender,
                    phone: phone
                },
                success: function(response) {
                    if (response.success) {
                        alert('회원가입이 성공적으로 완료되었습니다.');
                        window.location.href = response.redirectUrl;
                    } else {
                        $('#formErrorMessage').text(response.message);
                    }
                },
                error: function() {
                    $('#formErrorMessage').text('회원가입 요청 중 문제가 발생했습니다.');
                }
            });
        });
    });

</script>
</body>
</html>
