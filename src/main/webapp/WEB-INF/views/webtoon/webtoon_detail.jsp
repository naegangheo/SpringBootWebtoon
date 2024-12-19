<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="/css/webtoon/webtoon_detail.css" />
<script src="/script/jquery-3.7.1.min.js"></script>
<script src="/script/reply.js"></script>

    <div class="container">
        <div class="left">
            <div id="content">
                <%-- 제목,이미지--%>
                <div class="title">
                    <div class="title_image">
                        <img class="wbimgT" src="../images/webtoon/webtoon_images/title_img/${webtoonVO.image}"/>
                    </div>
                    <div class="title_right">
                        <div class="subtitle" style="font-size: 26px; font-weight: bold;">${webtoonVO.subject}</div>
                        <div class="title_name" >작가 : ${webtoonVO.userid}</div>
                        <div class="title_content" >내용 : ${webtoonVO.content}</div>
                        <div class="title_content" >
                            <c:choose>
                                <c:when test ="${webtoonVO.genre == 1}">장르 : 전체</c:when>
                                <c:when test ="${webtoonVO.genre == 2}">장르 : 로맨스</c:when>
                                <c:when test ="${webtoonVO.genre == 3}">장르 : 판타지</c:when>
                                <c:when test ="${webtoonVO.genre == 4}">장르 : 액션</c:when>
                                <c:when test ="${webtoonVO.genre == 5}">장르 : 일상</c:when>
                                <c:when test ="${webtoonVO.genre == 6}">장르 : 스릴러</c:when>
                                <c:otherwise>장르 : null</c:otherwise>
                            </c:choose>
                        </div>
                        <input type="button" value="목록보기" onClick="history.go(-1)"/>
                    </div>
                </div>

                <%-- 내용 --%>
                <div class="list" >
                    <img src="../images/webtoon/webtoon_images/content_img/content_img1.png" width="830px;" height="1080px" />
                </div>

                    <!-- 로그인한 사용자 정보를 hidden input으로 전달 -->
                    <input type="hidden" id="loginUser" value="${loginUser != null ? loginUser.userid : ''}">

                <div class="reply">
                    <h2>댓글</h2>
                    <form method="post" class="replyform">
                       <c:choose>
                            <c:when test="${not empty loginUser}">
                                <form class="replyform">
                                    <div id="replyUser">${loginUser.userid}</div>
                                    <textarea id="reply_input" name="rcontent" placeholder="주제와 무관한 댓글이나 스포일러, 악플은 경고조치 없이 삭제되며 징계 대상이 될 수 있습니다." rows="4" cols="100" maxlength="500"></textarea>
                                    <span id="reply_counter">0/500</span>
                                    <div class="reply-actions">
                                        <input type="submit" value="댓글 추가" />
                                    </div>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <div id="nonuser">댓글 작성은 <a href="/login" style="color: gray; text-decoration: underline;">로그인</a>이 필요합니다.</div>
                            </c:otherwise>
                       </c:choose>
                    </form>

                    <div class="replylist">
                        <c:forEach items="${replyList}" var="reply">
                            <div class="reply-item">
                                <div class="reply-author">${reply.userid}</div>
                                <div class="reply-content">${reply.rcontent}</div>
                                <div class="reply-date">
                                    <fmt:formatDate value="${reply.indate}" pattern="yyyy-MM-dd HH:mm:ss" />
                                </div>
                                <button class="delete-reply" onclick="deleteReply(${reply.reseq}, ${wseq})">삭제</button>
                            </div>
                        </c:forEach>

                    </div>

                </div>
            </div>
        </div>



<%-- 오른쪽 광고 및 공지사항--%>
        <div class="aside_banner">
            <div class="ad">
                <img class="wbimg" src="images/adImages/img.png">
            </div>
            <div class="ad">
                <img class="wbimg2" src="images/adImages/ad_image2.png" >
            </div>
            <div class="notice">
                <div class ="list_title">
                    <label>공지사항 </label><a href="notice" id="noticeMore">더보기></a>
                </div>
                <div>
                    <div>
                        <ul>
                        <c:if test="${empty noticeList}">
                            <p>공지사항이 없습니다.</p>
                        </c:if>
                            <c:forEach items="${noticeList}" var="nvo" begin="0" end="4">
                                    <a href="/notice?nseq=${noticeVO.nseq}" class="nosub">
                                    ${nvo.subject}
                                    </a>
                            </c:forEach>
                        </ul>
                    </div>
                </div>
            </div>
        </div>
    </div>



<%@ include file="../footer.jsp"%>
