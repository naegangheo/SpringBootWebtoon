<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../admin_header.jsp"%>
<style>
  .top_menu a:nth-child(3){
    opacity: 1;
    background-color: rgb(222, 246, 222);
  }
</style>

    <div class="bottom">
      <div class="list">
        <div class="title">
          <div class="col">번호</div>
          <div class="col">관리자명</div>
          <div class="col">제목</div>
          <div class="col">등록일</div>
        </div>
        <br>
        <div class="content">
          <c:forEach items="${adSelectNotice}" var="ntc">
            <div class="content_title">
              <div class="col">
                  ${ntc.nseq}
              </div>
              <div class="col">
                  ${ntc.adminid}
              </div>
              <div class="col">
                  ${ntc.subject}
              </div>
              <div class="col">
                <fmt:formatDate value="${ntc.indate}" pattern="yyyy-MM-dd"/>
              </div>
            </div>
          </c:forEach>
          <br>
          <div class="pagebutton">
           <c:if test="${paging.prev}" >
              <a href="/adminNoticelist?page=${paging.beginPage-1}">◀</a>&nbsp;
           </c:if>
          <c:forEach begin="${paging.beginPage}"  end="${paging.endPage}"  var="index">
                        <a href="/adminNoticelist?page=${index}">
                            &nbsp;${index}&nbsp;
                        </a>
           </c:forEach>
           <c:if test="${paging.next}" >
                        <a href="/adminNoticelist?page=${paging.endPage+1}">▶</a>&nbsp;
           </c:if>
        </div>
      </div>
      </div>

    </div>
  </div>
</div>

<%@ include file="../admin_footer.jsp"%>

