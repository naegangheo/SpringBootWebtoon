<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp"%>
<link href="css/member/updateMember.css" rel="stylesheet">

<form action="updateMember" method="POST" name="updateMember">
    <div class="profile-container">
        <div class="section">
            <div class="section-title">계정</div>
            <div class="section-middle">
                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M20 21C20 19.6044 20 18.9067 19.8278 18.3389C19.44 17.0605 18.4395 16.06 17.1611 15.6722C16.5933 15.5 15.8956 15.5 14.5 15.5H9.5C8.10444 15.5 7.40665 15.5 6.83886 15.6722C5.56045 16.06 4.56004 17.0605 4.17224 18.3389C4 18.9067 4 19.6044 4 21M16.5 7.5C16.5 9.98528 14.4853 12 12 12C9.51472 12 7.5 9.98528 7.5 7.5C7.5 5.01472 9.51472 3 12 3C14.4853 3 16.5 5.01472 16.5 7.5Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                <label>아이디 :</label><br>
                <input type="text" class="input-type-box" placeholder="${loginUser.userid}" disabled>
            </div>
            <div class="section-bottom">
                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M17 10V8C17 5.23858 14.7614 3 12 3C9.23858 3 7 5.23858 7 8V10M12 14.5V16.5M8.8 21H15.2C16.8802 21 17.7202 21 18.362 20.673C18.9265 20.3854 19.3854 19.9265 19.673 19.362C20 18.7202 20 17.8802 20 16.2V14.8C20 13.1198 20 12.2798 19.673 11.638C19.3854 11.0735 18.9265 10.6146 18.362 10.327C17.7202 10 16.8802 10 15.2 10H8.8C7.11984 10 6.27976 10 5.63803 10.327C5.07354 10.6146 4.6146 11.0735 4.32698 11.638C4 12.2798 4 13.1198 4 14.8V16.2C4 17.8802 4 18.7202 4.32698 19.362C4.6146 19.9265 5.07354 20.3854 5.63803 20.673C6.27976 21 7.11984 21 8.8 21Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                <label>현재 비밀번호 :</label><button type="button" onclick="openPasswordModal()" class="pwd-edit-button">비밀번호 수정</button>
                <input type="password" class="input-type-box" id="profileCurrentPwd" name="currentPwd" placeholder="회원 정보를 수정하려면 현재 비밀번호를 입력하세요">
            </div>
        </div>

        <div class="section">
            <div class="section-title">개인 정보</div>
            <div class="section-middle">
                <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg">
                    <path d="M15 9H15.01M9 9H9.01M22 12C22 17.5228 17.5228 22 12 22C6.47715 22 2 17.5228 2 12C2 6.47715 6.47715 2 12 2C17.5228 2 22 6.47715 22 12ZM15.5 9C15.5 9.27614 15.2761 9.5 15 9.5C14.7239 9.5 14.5 9.27614 14.5 9C14.5 8.72386 14.7239 8.5 15 8.5C15.2761 8.5 15.5 8.72386 15.5 9ZM9.5 9C9.5 9.27614 9.27614 9.5 9 9.5C8.72386 9.5 8.5 9.27614 8.5 9C8.5 8.72386 8.72386 8.5 9 8.5C9.27614 8.5 9.5 8.72386 9.5 9ZM12 17.5C14.5005 17.5 16.5 15.667 16.5 14H7.5C7.5 15.667 9.4995 17.5 12 17.5Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                <label>이름 : </label>
                <input type="text" class="input-type-box" name="name" id="name" value="${loginUser.name}">
                <div id="nameErrorMessage" class="error-message"></div>
            </div>
            <div class="section-middle">
                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M2 7L10.1649 12.7154C10.8261 13.1783 11.1567 13.4097 11.5163 13.4993C11.8339 13.5785 12.1661 13.5785 12.4837 13.4993C12.8433 13.4097 13.1739 13.1783 13.8351 12.7154L22 7M6.8 20H17.2C18.8802 20 19.7202 20 20.362 19.673C20.9265 19.3854 21.3854 18.9265 21.673 18.362C22 17.7202 22 16.8802 22 15.2V8.8C22 7.11984 22 6.27976 21.673 5.63803C21.3854 5.07354 20.9265 4.6146 20.362 4.32698C19.7202 4 18.8802 4 17.2 4H6.8C5.11984 4 4.27976 4 3.63803 4.32698C3.07354 4.6146 2.6146 5.07354 2.32698 5.63803C2 6.27976 2 7.11984 2 8.8V15.2C2 16.8802 2 17.7202 2.32698 18.362C2.6146 18.9265 3.07354 19.3854 3.63803 19.673C4.27976 20 5.11984 20 6.8 20Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                <label>이메일 : </label>
                <input type="email" class="input-type-box" name="email" id="email" value="${loginUser.email}">
                <div id="emailErrorMessage" class="error-message"></div>
            </div>
            <div class="section-middle">
                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M18 15.8369C19.4559 16.5683 20.7041 17.742 21.6152 19.2096C21.7956 19.5003 21.8858 19.6456 21.917 19.8468C21.9804 20.2558 21.7008 20.7585 21.3199 20.9204C21.1325 21 20.9216 21 20.5 21M16 11.5322C17.4817 10.7959 18.5 9.26686 18.5 7.5C18.5 5.73314 17.4817 4.20411 16 3.46776M14 7.5C14 9.98528 11.9852 12 9.49996 12C7.01468 12 4.99996 9.98528 4.99996 7.5C4.99996 5.01472 7.01468 3 9.49996 3C11.9852 3 14 5.01472 14 7.5ZM2.55919 18.9383C4.1535 16.5446 6.66933 15 9.49996 15C12.3306 15 14.8464 16.5446 16.4407 18.9383C16.79 19.4628 16.9646 19.725 16.9445 20.0599C16.9289 20.3207 16.7579 20.64 16.5495 20.7976C16.2819 21 15.9138 21 15.1776 21H3.82232C3.08613 21 2.71804 21 2.4504 20.7976C2.24201 20.64 2.07105 20.3207 2.05539 20.0599C2.03529 19.725 2.20992 19.4628 2.55919 18.9383Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                <label>성별 : </label>
                <select id="gender" class="input-type-box" name="gender">
                    <option value="1" <c:if test="${loginUser.gender == '1'}">selected</c:if>>남자</option>
                    <option value="2" <c:if test="${loginUser.gender == '2'}">selected</c:if>>여자</option>
                    <option value="3" <c:if test="${loginUser.gender == '3'}">selected</c:if>>선택안함</option>
                </select>
            </div>
            <div class="section-bottom">
                <svg viewBox="0 0 24 24" xmlns="http://www.w3.org/2000/svg">
                    <path d="M8.38028 8.85335C9.07627 10.303 10.0251 11.6616 11.2266 12.8632C12.4282 14.0648 13.7869 15.0136 15.2365 15.7096C15.3612 15.7694 15.4235 15.7994 15.5024 15.8224C15.7828 15.9041 16.127 15.8454 16.3644 15.6754C16.4313 15.6275 16.4884 15.5704 16.6027 15.4561C16.9523 15.1064 17.1271 14.9316 17.3029 14.8174C17.9658 14.3864 18.8204 14.3864 19.4833 14.8174C19.6591 14.9316 19.8339 15.1064 20.1835 15.4561L20.3783 15.6509C20.9098 16.1824 21.1755 16.4481 21.3198 16.7335C21.6069 17.301 21.6069 17.9713 21.3198 18.5389C21.1755 18.8242 20.9098 19.09 20.3783 19.6214L20.2207 19.779C19.6911 20.3087 19.4263 20.5735 19.0662 20.7757C18.6667 21.0001 18.0462 21.1615 17.588 21.1601C17.1751 21.1589 16.8928 21.0788 16.3284 20.9186C13.295 20.0576 10.4326 18.4332 8.04466 16.0452C5.65668 13.6572 4.03221 10.7948 3.17124 7.76144C3.01103 7.19699 2.93092 6.91477 2.9297 6.50182C2.92833 6.0436 3.08969 5.42311 3.31411 5.0236C3.51636 4.66357 3.78117 4.39876 4.3108 3.86913L4.46843 3.7115C4.99987 3.18006 5.2656 2.91433 5.55098 2.76999C6.11854 2.48292 6.7888 2.48292 7.35636 2.76999C7.64174 2.91433 7.90747 3.18006 8.43891 3.7115L8.63378 3.90637C8.98338 4.25597 9.15819 4.43078 9.27247 4.60655C9.70347 5.26945 9.70347 6.12403 9.27247 6.78692C9.15819 6.96269 8.98338 7.1375 8.63378 7.4871C8.51947 7.60142 8.46231 7.65857 8.41447 7.72538C8.24446 7.96281 8.18576 8.30707 8.26748 8.58743C8.29048 8.66632 8.32041 8.72866 8.38028 8.85335Z" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round"/>
                </svg>
                <label>전화번호 : </label>
                <input type="tel" class="input-type-box" name="phone" id="phone" value="${loginUser.phone}">
                <div id="phoneErrorMessage" class="error-message"></div>
            </div>
        </div>
        <div class="last-button">
            <input type="submit" class="last-button" value="수정">
        </div>
    </div>
    <div class="profile-container-footer">
        <div><a href="logout" id="logout">로그아웃</a></div><div>|</div><div><a href="deleteMember">회원탈퇴</a></div>
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
            headers: {'Content-Type': 'application/json'},
            body: JSON.stringify({currentPwd: currentPwd, newPwd: newPwd})
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

    // 로그아웃 확인
    document.getElementById('logout').addEventListener('click', function (event) {
    event.preventDefault();


    const confirmLogout = confirm('정말 로그아웃 하시겠습니까?');
    if (confirmLogout) {
    window.location.href = '/logout';
    }
    });
</script>

<%@ include file="../footer.jsp"%>
