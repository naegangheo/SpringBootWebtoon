<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../admin_header.jsp"%>

<style>
  .top_menu a:nth-child(2){
    opacity: 1;
    background-color: rgb(222, 246, 222);
  }
</style>

    <div class="bottom">
      <!-- <%--webtoonlist--%> -->
      <div class="list">
        <div class="title">
          <div class="col">번호</div>
          <div class="col">작성자</div>
          <div class="col">제목</div>
          <div class="col">등록일</div>
        </div>
        <br>
        <div class="content">
          <c:forEach items="${adSelectQna}" var="qna">
            <div class="content_title">
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
                  ${qna.indate}
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
                            &nbsp;${index}&nbsp;
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

