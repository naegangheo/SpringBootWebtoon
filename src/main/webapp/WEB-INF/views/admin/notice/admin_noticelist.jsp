<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<script src="/script/admin.js"></script>
<script type="text/javascript">
    function NocieDelete(nseq){
        if (confirm("정말 삭제하시겠습니까?")) {
            location.href = "adminNoticeDelete?nseq="+nseq;
        }
    }
</script>
<%@ include file="../admin_header.jsp"%>

<div class="admin_view">

  <div class="top">
    <div>
      <a href="/adminNoticeWriteForm" style="text-decoration: none;">Notice List</a>
    </div>
    <div>LOGO</div>
  </div>

    <div class="bottom">
      <div class="content">
        <div class="title">
          <div class="col">번호</div>
          <div class="col">관리자명</div>
          <div class="col">제목</div>
          <div class="col">등록일</div>
        </div>
        <br>
        <div class="content">
          <c:forEach items="${adSelectNotice}" var="ntc">
            <div class="content_title toggle-header" data-target="content-${ntc.nseq}" id="title">
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
            <div id="content-${ntc.nseq}" class="toggle-content">
              <div>${ntc.content}</div>
              <button type="button" value="수정" onclick="location.href='/adminNoticeUpdateForm?nseq=${ntc.nseq}'">수정</button>
              <button type="button" value="삭제" onclick="NocieDelete(${ntc.nseq})">삭제</button>
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

