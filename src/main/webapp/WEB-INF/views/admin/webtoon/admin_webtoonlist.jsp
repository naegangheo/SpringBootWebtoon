<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../admin_header.jsp"%>
<style>
  .top_menu a:nth-child(1){
    opacity: 1;
    background-color: rgb(222, 246, 222);
  }
</style>

<script>
    function adWebtoonDelete(wseq) {
        if (confirm("정말 삭제하시겠습니까?")) {
            location.href = `/adminWebtoonDelete?wseq=`+wseq;
        }
    }

</script>

    <div class="bottom">
      <div class="list">
        <div class="title">
          <div class="col">번호</div>
          <div class="col">작가</div>
          <div class="col">제목</div>
          <div class="col">조회수</div>
          <div class="col">등록일</div>
        </div>
        <br>
        <div class="content">
          <c:forEach items="${adSelectWebtoon}" var="wvo">
            <div class="content_title toggle-header" data-target="content-${wvo.wseq}" >
              <div class="col">
                  ${wvo.wseq}
              </div>
              <div class="col">
                  ${wvo.userid}
              </div>
              <div class="col">
                  ${wvo.subject}
              </div>
              <div class="col">
                  ${wvo.readcountF+wvo.readcountM+wvo.readcountN}
              </div>
              <div class="col">
                ${wvo.indate}
              </div>
            </div>
            <div id="content-${wvo.wseq}" class="toggle-content">
                <div>${wvo.content}</div>
                <button type="button" value="수정" onclick="location.href='/adminWebtoonUpdate?wseq=${wvo.wseq}'">수정</button>
                <button type="button" value="삭제" onclick="adWebtoonDelete(${wvo.wseq})">삭제</button>
            </div>
          </c:forEach>
          <br>
          <div class="pagebutton">
           <c:if test="${paging.prev}" >
              <a href="/admin?page=${paging.beginPage-1}">◀</a>&nbsp;
           </c:if>
          <c:forEach begin="${paging.beginPage}"  end="${paging.endPage}"  var="index">
                        <a href="/admin?page=${index}">
                            &nbsp;${index}&nbsp;
                        </a>
           </c:forEach>
           <c:if test="${paging.next}" >
                        <a href="/admin?page=${paging.endPage+1}">▶</a>&nbsp;
           </c:if>
           </div>
        </div>

      </div>

    </div>
  </div>
</div>



<%@ include file="../admin_footer.jsp"%>


