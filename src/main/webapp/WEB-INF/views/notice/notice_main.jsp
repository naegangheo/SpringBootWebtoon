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
                            <div class="notice_title">
                                <div class="col">
                                    ${noticeVO.nseq}
                                </div>
                                <div class="col" >
                                    ${noticeVO.subject}
                                </div>
                                <div class="col" >
                                    <fmt:formatDate value="${noticeVO.indate}"/>
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
        </div>
    </section>

<%@ include file="../footer.jsp"%>