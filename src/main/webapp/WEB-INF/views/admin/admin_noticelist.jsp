<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="admin_header.jsp"%>

    <div class="bottom">
      <!-- <%--webtoonlist--%> -->
      <div class="list">
        <div class="title">
          <div class="col">번호</div>
          <div class="col">관리자명</div>
          <div class="col">제목</div>
          <div class="col">등록일</div>
        </div>
        <br>
        <div class="content">
          <c:forEach items="${notice}" var="ntc">
            <div class="title">
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
                ${ntc.indate}
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

