<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>내 정보</title>
    <link href="css/member/updateMember.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
</head>
<body>
<form action="updateMember" method="POST" name="updateMember">
    <div class="profile-container">
        <div class="section">
            <div class="section-title">계정</div>
            <div class="section-middle">
                <label>아이디 :</label><br>
                <span>${loginUser.userid}</span>
            </div>
            <div class="section-middle">
                <label>현재 비밀번호 :</label><button type="button" onclick="openPasswordModal()" class="pwd-edit-button">비밀번호 수정</button>
                <input type="password" class="input-type-box" id="profileCurrentPwd" name="currentPwd" placeholder="회원 정보를 수정하려면 현재 비밀번호를 입력하세요">
            </div>
        </div>

        <div class="section">
            <div class="section-title">개인 정보</div>
            <div class="section-middle">
                <label>이름 : </label>
                <input type="text" class="input-type-box" name="name" id="name" value="${loginUser.name}">
                <div id="nameErrorMessage" class="error-message"></div>
            </div>
            <div class="section-middle">
                <label>이메일 : </label>
                <input type="email" class="input-type-box" name="email" id="email" value="${loginUser.email}">
                <div id="emailErrorMessage" class="error-message"></div>
            </div>
            <div class="section-middle">
                <label>성별 : </label>
                <select id="gender" class="input-type-box" name="gender">
                    <option value="1" <c:if test="${loginUser.gender == '1'}">selected</c:if>>남자</option>
                    <option value="2" <c:if test="${loginUser.gender == '2'}">selected</c:if>>여자</option>
                    <option value="3" <c:if test="${loginUser.gender == '3'}">selected</c:if>>선택안함</option>
                </select>
            </div>
            <div class="section-bottom">
                <label>전화번호 : </label>
                <input type="tel" class="input-type-box" name="phone" id="phone" value="${loginUser.phone}">
                <div id="phoneErrorMessage" class="error-message"></div>
            </div>
        </div>
        <div class="last-button">
            <input type="submit" class="last-button" value="수정">
        </div>
    </div>
</form>

<!-- 비밀번호 수정 모달 -->
<div id="passwordModal" style="display:none; position:fixed; top:50%; left:50%; transform:translate(-50%, -50%); padding:20px; background:white; border:1px solid #ddd; border-radius:8px; box-shadow:0 4px 6px rgba(0,0,0,0.2);">
    <h3>비밀번호 수정</h3>
    <form id="passwordForm" onsubmit="return submitPassword();">
        <div style="margin-bottom: 10px;">
            <label for="modalCurrentPwd">현재 비밀번호:</label>
            <input type="password" id="modalCurrentPwd" required>
        </div>
        <div style="margin-bottom: 10px;">
            <label for="modalNewPwd">새 비밀번호:</label>
            <input type="password" id="modalNewPwd" required minlength="4">
        </div>
        <div style="margin-bottom: 20px;">
            <label for="modalConfirmPwd">새 비밀번호 확인:</label>
            <input type="password" id="modalConfirmPwd" required minlength="4">
        </div>
        <div style="text-align:right;">
            <button type="button" onclick="closePasswordModal()">취소</button>
            <button type="submit">저장</button>
        </div>
    </form>
</div>

<script>
    (function ($) {
        $(document).ready(function () {
            let valid = true;

            $('#name').on('blur', function () {
                const name = $(this).val().trim();
                if (!name) {
                    $('#nameErrorMessage').text('이름을 입력해주세요.');
                    valid = false;
                } else {
                    $('#nameErrorMessage').text('');
                    valid = true;
                }
            });

            $('#email').on('blur', function () {
                const email = $(this).val().trim();
                if (!email) {
                    $('#emailErrorMessage').text('이메일을 입력해주세요.');
                    valid = false;
                } else if (!/^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email)) {
                    $('#emailErrorMessage').text('올바른 이메일 주소를 입력해주세요.');
                    valid = false;
                } else {
                    $('#emailErrorMessage').text('');
                    valid = true;
                }
            });

            $('#phone').on('blur', function () {
                const phone = $(this).val().trim();
                if (!phone) {
                    $('#phoneErrorMessage').text('전화번호를 입력해주세요.');
                    valid = false;
                } else if (!/^\d{10,11}$/.test(phone)) {
                    $('#phoneErrorMessage').text('올바른 전화번호를 입력해주세요.');
                    valid = false;
                } else {
                    $('#phoneErrorMessage').text('');
                    valid = true;
                }
            });
        });
    })(jQuery);

    function openPasswordModal() {
        document.getElementById("passwordModal").style.display = "block";
    }

    function closePasswordModal() {
        document.getElementById("passwordModal").style.display = "none";
    }

    function submitPassword() {
        const currentPwd = document.getElementById("modalCurrentPwd").value;
        const newPwd = document.getElementById("modalNewPwd").value;
        const confirmPwd = document.getElementById("modalConfirmPwd").value;

        if (newPwd !== confirmPwd) {
            alert("새 비밀번호가 일치하지 않습니다.");
            return false;
        }

        fetch('/updatePwd', {
            method: 'POST',
            headers: { 'Content-Type': 'application/json' },
            body: JSON.stringify({ currentPwd: currentPwd, newPwd: newPwd })
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert('비밀번호가 성공적으로 수정되었습니다.');
                    closePasswordModal();
                } else {
                    alert(data.message || '비밀번호 수정 실패!');
                }
            })
            .catch(err => {
                console.error('Error:', err);
                alert('서버와 통신하는 중 오류가 발생했습니다.');
            });
        return false;
    }

    function showAlert(message) {
        if (message) {
            alert(message);
        }
    }

    // 메시지 출력
    showAlert('<c:out value="${errorMessage}" escapeXml="true" />');
    showAlert('<c:out value="${successMessage}" escapeXml="true" />');
</script>

</body>
</html>
