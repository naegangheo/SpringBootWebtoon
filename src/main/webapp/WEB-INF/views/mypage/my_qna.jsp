<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ include file="../header.jsp"%>
<%--<script src="/script/mypage/my_qna.js"></script>--%>

<link rel="stylesheet" href="css/mypage/my_qna.css"/>
<style>

</style>
<section>
    <div class="container">
        <div class="left">
            <div class="notice">
                <h1>나의 Q&A</h1><button class="openFormButton" id="openFormButton">문의하기</button>
            </div>
            <div class="notice_content-wrap">
                <div class="notice_title" style="border-top: none; font-weight: bold">
                    <div class="col-no">답변상태</div>
                    <div class="col-text" style="text-align: center">제목</div>
                    <div class="col-date">작성일</div>
                </div>
                <div class="notice_content">
                    <c:forEach items="${qnaList}" var="qnaVO" varStatus="status">
                        <div class="notice_title toggle-header" data-target="content-${qnaVO.qseq}">
                            <div class="col-no"><%--답변완료/미답변--%>
                                <c:choose>
                                    <c:when test="${not empty qnaReplyList[qnaVO.qseq]}">
                                        답변 완료
                                    </c:when>
                                    <c:otherwise>
                                        미답변
                                    </c:otherwise>
                                </c:choose>
                            </div>
                            <div class="col-text">${qnaVO.subject}</div>
                            <div class="col-date">
                                <fmt:formatDate value="${qnaVO.indate}" pattern="yyyy-MM-dd"/>
                            </div>
                        </div>
                        <div id="content-${qnaVO.qseq}" class="toggle-content"><%--토글--%>
                            <div></div>
                            <div class="qna-content">
                                <div class="qna-content-main">
                                    <div class="qna-text">${qnaVO.content}</div>
                                    <div class="third"></div>
                                </div>
                                <div class="qna-edit-delete-button">
                                    <div class="button-wrap" style="font-size: 12px; color: #858891;">
                                        <button class="edit-button" data-qseq="${qnaVO.qseq}" data-subject="${qnaVO.subject}"
                                        data-content="${qnaVO.content}">수정</button>
                                        <div>｜</div>
                                        <form action="deleteQna" method="POST" onsubmit="return confirm('정말로 삭제하시겠습니까?');">
                                            <input type="hidden" name="qseq" value="${qnaVO.qseq}">
                                            <button type="submit" class="delete-button">삭제</button>
                                        </form>
                                    </div>
                                    <div class="third"></div>
                                </div>
                                <!-- 댓글 표시 영역 -->
                                <div class="qna-content-reply">
                                    <div class="replies">
                                        <c:choose>
                                            <c:when test="${not empty qnaReplyList[qnaVO.qseq]}">
                                                <c:forEach var="reply" items="${qnaReplyList[qnaVO.qseq]}">
                                                    <div class="reply-item">
                                                        <div>관리자 답변:</div>
                                                        <div class="reply-2">${reply.qrcontent}</div>
                                                        <div class="third" style="display: flex; justify-content: center;">
                                                            <fmt:formatDate value="${reply.indate}" pattern="yyyy-MM-dd"/>
                                                        </div>
                                                    </div>
                                                </c:forEach>
                                            </c:when>
                                            <c:otherwise>
                                                <div class="no-reply">아직 답변이 없습니다.</div>
                                            </c:otherwise>
                                        </c:choose>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </c:forEach>
                </div>
            </div>
            <div class="paging" style="font-size: 14px;">
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

        // 문의하기 버튼 클릭 시 모달 열기
        if (openFormButton) {
            openFormButton.addEventListener('click', function () {
                modalTitle.textContent = '문의하기';
                qseqInput.value = '';
                subjectInput.value = '';
                contentTextarea.value = '';
                submitButton.textContent = '제출하기';
                qnaFormModal.style.display = 'flex'; // 중앙 표시
            });
        }

        // 수정 버튼 클릭 시 모달 열기
        document.querySelectorAll('.edit-button').forEach(button => {
            button.addEventListener('click', function (event) {
                event.stopPropagation();

                const qseq = this.getAttribute('data-qseq');
                const subject = this.getAttribute('data-subject');
                const content = this.getAttribute('data-content');

                modalTitle.textContent = '문의 수정';
                qseqInput.value = qseq;
                subjectInput.value = subject;
                contentTextarea.value = content;
                submitButton.textContent = '수정하기';
                qnaFormModal.style.display = 'flex';
            });
        });

        // 모달 닫기 버튼
        closeFormButton.addEventListener('click', function () {
            qnaFormModal.style.display = 'none';
        });

        // 모달 외부 클릭 시 닫기
        window.addEventListener('click', function (event) {
            if (event.target === qnaFormModal) {
                qnaFormModal.style.display = 'none';
            }
        });
    });


</script>