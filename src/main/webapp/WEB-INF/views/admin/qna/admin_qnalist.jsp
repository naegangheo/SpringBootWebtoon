<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../admin_header.jsp"%>


<div class="admin_view">

    <div class="top">
        <div>Q&a List</div>
        <div>LOGO</div>
    </div>

    <div class="bottom">

      <div class="content">
        <div class="title">
          <div class="col">번호</div>
          <div class="col">작성자</div>
          <div class="col">제목</div>
          <div class="col">등록일</div>
        </div>
        <br>
        <div class="content">
          <c:forEach items="${qnaList}" var="qna">
            <div class="content_title toggle-header" data-target="content-${qna.qseq}" id="title">
              <div class="col">
                  ${qna.qseq}
              </div>
              <div class="col">
                  ${qna.userid}
              </div>
              <div class="col">
                  ${qna.subject}
              </div>
              <div class="col">
                  <fmt:formatDate value="${qna.indate}" pattern="yyyy-MM-dd"/>
              </div>
            </div>
            <div id="content-${qna.qseq}" class="toggle-contentq">
              <div>${qna.content}</div>
              <div>
                <input type="text" name="content"/>
                <button type="button" value="댓글 작성" onclick="location.href='/adminQreplyInsert?qrseq=${qreply.qrseq}'">댓글 작성</button>
              </div>

              <div class="qreply">
                  <c:choose>
                    <c:when test="${qreplyList.size()==0}">
                        <div class="qreply_title">
                            <div class="qreply_col">
                                    아직 댓글이 하나도 없습니다.
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach items="${qreplyList}" var="qreply">
                            <div class="qreply_title">
                                <div class="qreply_col">${qreply.qrcontent}</div>
                                <div class="qreply_col">
                                    <fmt:formatDate value="${qreply.indate}" pattern="MM/dd hh:mm"/>
                                </div>
                                <div class="qreply_col">
                                     <c:if test="${qreply.adminid==loginUser.adminid}">
                                        <input type="button" value="삭제"
                                            onClick="deleteReply('${qreply.qrseq}', '${qna.qseq}')"/>
                                     </c:if>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                  </c:choose>

              </div>
            </div>
          </c:forEach>
          <br>
            <div class="pagebutton">
                <c:if test="${paging.prev}" >
                    <a href="/adminQnalist?page=${paging.beginPage-1}">◀</a>&nbsp;
                </c:if>
                <c:forEach begin="${paging.beginPage}"  end="${paging.endPage}"  var="index">
                    <a href="/adminQnalist?page=${index}">
                    &nbsp; ${index}&nbsp;
                    </a>
                </c:forEach>
                <c:if test="${paging.next}" >
                    <a href="/adminQnalist?page=${paging.endPage+1}">▶</a>&nbsp;
                </c:if>
            </div>
        </div>
      </div>

    </div>
  </div>
</div>

<%@ include file="../admin_footer.jsp"%>

