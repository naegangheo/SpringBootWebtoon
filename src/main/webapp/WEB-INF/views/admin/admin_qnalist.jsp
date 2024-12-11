<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="admin_header.jsp"%>

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
          <c:forEach items="${qna}" var="qna">
            <div class="title">
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
        </div>
      </div>

    </div>
  </div>
</div>

<!-- <%--  여기까지가 main  --%> -->

<!-- <%--  여기부터 footer  --%> -->
<%@ include file="admin_footer.jsp"%>

