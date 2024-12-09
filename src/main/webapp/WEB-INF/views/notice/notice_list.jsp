<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="/css/notice/notice.css" />
    <section>
        <div class="container">
            <div class="left">
                <div class="notice">
                    <h1>NOTICE</h1>
                </div>
                <div class="notice_content">
                    <div class="notice_title">
                        <div class="col">번호</div>
                        <div class="col">제목</div>
                        <div class="col">등록일</div>
                    </div>
                    <div class="notice_content">
                        <c:forEach items="${noticeList}" var="noticeVO">
                            <div class="notice_title toggle-header" data-target="content-${noticeVO.nseq}"" >
                                <div class="col">
                                    ${noticeVO.nseq}
                                </div>
                                <div class="col" >
                                    ${noticeVO.subject}
                                </div>
                                <div class="col" >
                                    <fmt:formatDate value="${noticeVO.indate}" pattern="yyyy-MM-dd"/>
                                </div>
                                <div id="content-${noticeVO.nseq}" class="toggle-content">
                                    <p>${noticeVO.content}</p>
                            </div>
                            </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <%-- 오른쪽 광고 및 공지사항--%>
            <div class="aside_banner">
                <div class="ad">
                    <img class="adimg" src="images/webtoon/noimg.png">
                </div>
                <br/>
                <div class="ad">
                    <img class="adimg" src="images/webtoon/noimg.png">
                </div>
            </div>

            <div class="paging">
            <!-- prev 버튼의 표시 여부 -->
            <c:if test="${paging.prev}" >
                <a href="notice?page=${paging.beginPage-1}">◀</a>&nbsp;
            </c:if>

            <!--  beginPage 부터  endPage 까지 일렬로 페이지를 표시 -->
            <c:forEach begin="${paging.beginPage}"  end="${paging.endPage}"  var="index">
                <a href="notice?page=${index}">
                    &nbsp;${index}&nbsp;
                </a>
            </c:forEach>

            <!-- next 버튼 표시 여부 -->
            <c:if test="${paging.next}" >
                <a href="notice?page=${paging.endPage+1}">▶</a>&nbsp;
            </c:if>
            </div>
        </div>
    </section>

<%@ include file="../footer.jsp"%>

<script>
    document.addEventListener('DOMContentLoaded', function () {
        // 모든 토글 헤더에 클릭 이벤트 추가
        document.querySelectorAll('.toggle-header').forEach(header => {
            header.addEventListener('click', function () {
                const targetId = this.getAttribute('data-target');
                const content = document.getElementById(targetId);

                if (content) {
                    // 토글 클래스 추가/제거
                    content.classList.toggle('visible');
                }
            });
        });
    });
</script>