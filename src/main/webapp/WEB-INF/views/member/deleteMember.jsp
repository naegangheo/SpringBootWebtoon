<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp"%>
<link href="css/member/deleteMember.css" rel="stylesheet">

<div class="container">
    <!-- CONTENTS -->
    <div>
        <h2>탈퇴 안내</h2>
        <p>회원탈퇴를 신청하기 전에 안내 사항을 꼭 확인해주세요.</p>
    </div>
    <div class="main-container">
        <h5>
            <img src="images/member/check.png">
            사용하고 계신 아이디(<em>${loginUser.userid}</em>)는 탈퇴할 경우 재사용 및 복구가 불가능합니다.
        </h5>
        <p class="dropout_dsc">
            <em>탈퇴한 아이디는 본인과 타인 모두 재사용 및 복구가 불가</em>하오니 신중하게 선택하시기 바랍니다.
        </p>

        <h5>
            <img src="images/member/check.png">
            탈퇴 후 회원정보 및 개인형 서비스 이용기록은 모두 삭제됩니다.</h5>
        <p class="dropout_dsc">
            회원정보 및 서비스 이용기록은 모두 삭제되며, 삭제된 데이터는 복구되지 않습니다.<br>삭제되는 내용을 확인하시고 필요한 데이터는 미리 백업을 해주세요.
        </p>

        <h5>
            <img src="images/member/check.png">
            탈퇴 후에도 등록한 게시물은 그대로 남아 있습니다.</h5>
        <p class="dropout_dsc">게시글 및 댓글은 탈퇴 시에도 자동 삭제되지 않고 그대로 남아 있습니다.
            <br>
            삭제를 원하는 게시글이 있다면 <em>반드시 탈퇴 전 비공개 처리하거나 삭제하시기 바랍니다.</em>

            <br>
            탈퇴 후에는 회원정보가 삭제되어 본인 여부를 확인할 수 있는 방법이 없어, 게시글을 임의로 삭제해드릴 수 없습니다.
        </p>

        <form name="fm" id="deleteForm" method="POST">
            <div class="last-box">
                <p class="contxt">
                    <strong>
                        탈퇴 후에는 아이디 <em style="color: #08a600">${loginUser.userid}</em> 로 다시 가입할 수 없으며 아이디와 데이터는 복구할 수 없습니다.
                        <br>
                        게시판에 남아있는 게시글은 탈퇴 후 삭제할 수 없습니다.<br>또한, 네이버 아이디를 사용해 다른 서비스에 로그인 할 수 없게 됩니다.
                    </strong>
                </p>
                <input type="checkbox" id="dropoutAgree" name="dropoutAgree">
                <label for="dropoutAgree"><strong>안내 사항을 모두 확인하였으며, 이에 동의합니다.</strong></label>
                <div class="btn_area_w">
                    <button type="button" id="deleteButton" disabled><b>확인</b></button>
                </div>
            </div>
        </form>
    </div>
</div>


<!-- 모달 -->
<div id="passwordModal" class="modal">
    <div class="modal-content">
        <span class="close">&times;</span>
        <h2>비밀번호 확인</h2>
        <p>탈퇴를 진행하려면 비밀번호를 입력해주세요.</p>
        <input type="password" id="password" placeholder="비밀번호 입력">
        <button id="confirmDeleteButton">확인</button>
    </div>
</div>

</body>


<script>
    const checkbox = document.getElementById('dropoutAgree');
    const deleteButton = document.getElementById('deleteButton');
    const modal = document.getElementById('passwordModal');
    const closeModal = document.querySelector('.close');
    const confirmDeleteButton = document.getElementById('confirmDeleteButton');
    const passwordField = document.getElementById('password');

    // 체크박스 상태에 따라 버튼 활성화/비활성화
    checkbox.addEventListener('change', () => {
        deleteButton.disabled = !checkbox.checked;
    });

    // 탈퇴 버튼 클릭 이벤트 (모달 열기)
    deleteButton.addEventListener('click', () => {
        modal.style.display = 'block';
    });

    // 모달 닫기 버튼 이벤트
    closeModal.addEventListener('click', () => {
        modal.style.display = 'none';
    });

    // 모달 외부 클릭 시 닫기
    window.addEventListener('click', (event) => {
        if (event.target === modal) {
            modal.style.display = 'none';
        }
    });

    // 확인 버튼 클릭 이벤트
    confirmDeleteButton.addEventListener('click', () => {
        const password = passwordField.value;

        if (!password) {
            alert('비밀번호를 입력해주세요.');
            return;
        }

        fetch('/deleteMember', {
            method: 'POST',
            headers: {
                'Content-Type': 'application/json',
            },
            body: JSON.stringify({ password })
        })
            .then(response => response.json())
            .then(data => {
                if (data.success) {
                    alert(data.message);
                    window.location.href = '/'; // 탈퇴 후 리다이렉트
                } else {
                    alert(data.message);
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert('오류가 발생했습니다. 나중에 다시 시도해주세요.');
            })
            .finally(() => {
                modal.style.display = 'none'; // 요청 후 모달 닫기
            });
    });

</script>
</html>