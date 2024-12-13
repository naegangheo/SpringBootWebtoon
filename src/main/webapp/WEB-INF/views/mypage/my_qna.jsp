<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="css/mypage/my_qna.css" />

<section>
    <div class="container">
        <div class="left">
            <div class="notice" style="display: flex; justify-content: space-between;">
                <h1>나의 Q&A</h1><button class="openFormButton" id="openFormButton">문의하기</button>
            </div>
            <div class="notice_content">
                <div class="notice_title">
                    <div class="col">번호</div>
                    <div class="col">제목</div>
                    <div class="col">등록일</div>
                </div>
                <div class="notice_content">
                    <c:forEach items="${qnaList}" var="qnaVO" varStatus="status">
                        <div class="notice_title toggle-header" data-target="content-${qnaVO.qseq}">
                            <!-- varStatus.index를 활용하여 1부터 시작하는 번호 표시 -->
                            <div class="col">${fn:length(qnaList) - status.index}</div>
                            <div class="col">${qnaVO.subject}</div>
                            <div class="col">
                                <fmt:formatDate value="${qnaVO.indate}" pattern="yyyy-MM-dd"/>
                            </div>
                        </div>
                        <div id="content-${qnaVO.qseq}" class="toggle-content">
                            <div class="qna-content">
                                <div class="qna-text"><p>${qnaVO.content}</p></div>
                                <div class="qna-edit-delete-button">
                                    <button class="edit-button" data-qseq="${qnaVO.qseq}" data-subject="${qnaVO.subject}"
                                    data-content="${qnaVO.content}">수정</button>

                                    <form action="deleteQna" method="POST" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
                                        <input type="hidden" name="qseq" value="${qnaVO.qseq}">
                                        <button type="submit" class="delete-button">삭제</button>
                                    </form>
                                </div>
                            </div>
                            <div class="content-reply" style="border-top: 1px solid #ebebeb;">댓글자리 입니다.</div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="paging">
                <!-- prev 버튼의 표시 여부 -->
                <c:if test="${paging.prev}" >
                    <a href="myQna?page=${paging.beginPage-1}">◀</a>&nbsp;
                </c:if>

                <!-- beginPage 부터 endPage 까지 일렬로 페이지를 표시 -->
                <c:forEach begin="${paging.beginPage}" end="${paging.endPage}" var="index">
                    <a href="myQna?page=${index}" class="${paging.page == index ? 'active' : ''}">
                        &nbsp;${index}&nbsp;
                    </a>
                </c:forEach>

                <!-- next 버튼 표시 여부 -->
                <c:if test="${paging.next}" >
                    <a href="myQna?page=${paging.endPage+1}">▶</a>&nbsp;
                </c:if>
            </div>
        </div>
        <%-- 오른쪽 광고 및 공지사항 --%>
        <div class="aside_banner">
            <div class="ad">
                <img class="adimg" src="images/webtoon/noimg.png">
            </div>
            <br/>
            <div class="ad">
                <img class="adimg" src="images/webtoon/noimg.png">
            </div>
        </div>
    </div>
</section>

<!-- Q&A 등록 및 수정 모달 -->
<div id="qnaFormModal" class="modal">
    <div class="modal-content">
        <span class="close-button" id="closeFormButton">&times;</span>
        <h2 id="modalTitle">문의하기</h2>
        <form id="qnaForm" action="insertQna" method="POST">
            <input type="hidden" id="qseq" name="qseq" value="${qnaVO.qseq != null ? qnaVO.qseq : ''}">
            <div>
                <label for="subject">제목</label><br>
                <input type="text" id="subject" name="subject" required>
            </div>
            <div>
                <label for="pwd">비밀번호</label><br>
                <input type="password" id="pwd" name="pwd" required>
            </div>
            <div>
                <label for="content">내용</label><br>
                <textarea id="content" name="content" rows="5" required></textarea>
            </div>
            <button type="submit" id="submitButton">제출하기</button>
        </form>
    </div>
</div>


<%@ include file="../footer.jsp"%>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        const toggleHeaders = document.querySelectorAll('.toggle-header');
        const qnaFormModal = document.getElementById('qnaFormModal');
        const closeFormButton = document.getElementById('closeFormButton');
        const openFormButton = document.getElementById('openFormButton');
        const modalTitle = document.getElementById('modalTitle');
        const qseqInput = document.getElementById('qseq');
        const subjectInput = document.getElementById('subject');
        const contentTextarea = document.getElementById('content');
        const submitButton = document.getElementById('submitButton');

        // "toggle-header" 클릭 이벤트 (게시글 펼치기)
        toggleHeaders.forEach(header => {
            header.addEventListener('click', function (event) {
                // "수정" 버튼을 클릭했을 경우 이벤트 중지
                if (event.target.classList.contains('edit-button')) return;

                const targetId = this.getAttribute('data-target');
                const content = document.getElementById(targetId);

                // 모든 다른 열려있는 컨텐츠를 숨김
                document.querySelectorAll('.toggle-content.visible').forEach(el => {
                    if (el !== content) {
                        el.classList.remove('visible');
                    }
                });

                // 클릭한 컨텐츠만 토글
                content.classList.toggle('visible');
            });
        });

        // "문의하기" 버튼 클릭 이벤트
        if (openFormButton) {
            openFormButton.addEventListener('click', function () {
                console.log('문의하기 버튼 클릭'); // 디버깅 로그
                modalTitle.textContent = '문의하기';
                qseqInput.value = ''; // 신규 작성 시 번호 없음
                subjectInput.value = '';
                contentTextarea.value = '';
                submitButton.textContent = '제출하기';
                qnaFormModal.style.display = 'block';
            });
        } else {
            console.error('문의하기 버튼이 선택되지 않았습니다.');
        }

        // "수정" 버튼 클릭 이벤트
        document.querySelectorAll('.edit-button').forEach(button => {
            button.addEventListener('click', function (event) {
                event.stopPropagation(); // "toggle-header" 이벤트 중지

                const qseq = this.getAttribute('data-qseq');
                const subject = this.getAttribute('data-subject');
                const content = this.getAttribute('data-content');

                // 모달에 수정할 게시글 정보 채우기
                modalTitle.textContent = '문의 수정';
                qseqInput.value = qseq; // 수정할 게시글 번호
                subjectInput.value = subject;
                contentTextarea.value = content;
                submitButton.textContent = '수정하기';
                qnaFormModal.style.display = 'block';
            });
        });

        // 모달 닫기 버튼
        closeFormButton.addEventListener('click', function () {
            qnaFormModal.style.display = 'none';
        });
    });

    /*document.addEventListener('DOMContentLoaded', function () {
        const message = "${message}";
        if (!message) {
            const qnaFormModal = document.getElementById('qnaFormModal');
            qnaFormModal.style.display = 'none';
        }
    });*/
</script>
