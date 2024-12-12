<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="admin_header.jsp"%>

    <div class="bottom">
      <!-- <%--webtoonlist--%> -->
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
          <c:forEach items="${webtoon}" var="wvo">
            <div class="title">
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
          </c:forEach>
        </div>
      </div>

    </div>
  </div>
</div>

<!-- <%--  여기까지가 main  --%> -->

<!-- <%--  여기부터 footer  --%> -->
<%@ include file="admin_footer.jsp"%>

