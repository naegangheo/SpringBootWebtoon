<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../admin_header.jsp"%>


<div class="admin_view">

    <div class="top">
        <div>Q&A List</div>
        <div>LOGO</div>
    </div>
    <form method="post" action="/adminQreplyInsert">
        <input type="hidden" name= "qseq" value="${qna.qseq}"/>
        <input type="hidden" name="adminid" value="l${loninUser.loginAdmin}"/>
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
            <div id="content-${qna.qseq}" class="toggle-contentq" data-qseq="${qna.qseq}">

              <div>${qna.content}</div>
              <div>
                <input type="text" id="newReplyContent-${qna.qseq}" name="qrcontent" placeholder="댓글을 작성하세요"/>
                <input id ="reply_button" type="submit" value="댓글 작성" data-qseq="${qna.qseq}"/>
              </div>

              <div class="qreply">
                    <%--        ajax구현부          --%>
              </div>
            </div>

          </c:forEach>

    </form>
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

